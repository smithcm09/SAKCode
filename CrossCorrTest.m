%CrossCorr Testing
%shortCatalog{1,x} = catalogobj.waveforms{1,x}
%shortCatalog{2,x} = catalogobj.arrivals{1,x}

%i = event number you are looking at
%eg i = 841

%or for a group
WFS = []
Trig = []
for i = 1:length(indexVar)
    x = indexVar(i);
    %change structure to arrays
    yy = shortCatalog{2,x};
    T = yy.time;
    Ch = yy.channelinfo;

    %subset arrays based on the station/channel string desired
%****change this line if changing correlated pair****
    trig = T(strcmp('.SAKA..BD1',Ch),:); 
    
        for j = 1:length(shortCatalog{1,x})
            xx = shortCatalog{1,x}(j,1);
            y = get(xx,'station');
            z = get(xx,'channel');
%****change this line if changing correlated pair****
            if strmatch(y,'SAKA') & strmatch(z,'BD1')
            Wfs = shortCatalog{1,x}(j,1);
            Trigger = trig; 
            
            WFS = [WFS;Wfs];
            Trig = [Trig;Trigger];
            else
                sprintf 'N';
            end

        end
   
end
%%
c = correlation(WFS,Trig);

%%
%% Plot original data
% Use 'wig' option for a traditional wiggle plot. 'sha' displays shaded traces often useful when viewing more than ~50 traces at a time. 
%can use 'sha' for a shaded instead of wiggle plot

plot(c,'wig');
%plot(c,'sha');

%% crop filter and taper waveforms
% This particular use of crop is unnecessary but it demonstrates cropping the data (in this case on the low end) and zero padding (in this case on the high end.) BUTTER applies a zero-phase Butterworth filter to the data. It is important to at least apply a high pass filter to data before cross-correlating as long period rolls can greatly bias the correlation.
c = crop(c,-3,12);
c = taper(c);

%***CHANGE THIS VALUE***
c = butter(c,[1 20]);
plot(c,'wig')
%% Perform the cross correlation
%Cross correlate waveforms, identifying the maximum correlation value and the relative time offset between each pair of traces to acheive the maximum correlation. For many hundreds of events, this can be a time consuming process. XCORR provides status information along the way. 
%c = xcorr(c,[0 3.5]);

%***CHANGE THIS VALUE***
c = xcorr(c,[0 10]);
%% create the Similarity Matrix
%Sort traces by time and plot the correlation matrix - the set of maximum cross-correlation values between each pair of traces. To access the correlation matrix directly, first extract it from the correlation object using the get command. 
c = sort(c);
plot(c,'corr');
corr_matrix = get(c,'CORR');
corr_matrix(1:5,1:5)

%% Create the Lag Matrix
%Similar to above, this function plots the matrix of lag times (in seconds) that yeild the maximum correlation between each pair of traces.
plot(c,'lag');
lag_matrix = get(c,'LAG');
lag_matrix(1:5,1:5)

%% Realign traces
%Apply the time corrections in the lag matrix to the trigger times. This will result in highly correlated traces being well aligned. Plot the results as a shaded waveform plot. 
c = adjusttrig(c,'MIN',1);
plot(c,'wig');

%% Create the hierarchial cluster tree
%Plot a hierarchical cluster tree relationship (denrogram) between traces. Plot reorders traces such that they correspond with the ordering of traces on the cluster tree. 
c = linkage(c);
plot(c,'den');
close(gcf)

%% Determine Event Clusters
%Trim the cluster tree relationship into discrete clusters of events. Subset just the events of the largest cluster.

% the (c,0.#) is the minimum correlation coefficient allowed for the
% cluster

%***CHANGE THIS VALUE***
c = cluster(c,.7);

%fig6
index = find(c,'CLUST',1);
c1 = subset(c,index);
%subsetting the subset to investigate the weird multi-line signal - turns
%out it isn't anything - just a plotting artifact
% cz = subset(c1,1:45)
plot(c1,'wig');

%% Converting waveform and correlation objects
%Inside the CORRELATION object, waveforms are stored as WAVEFORM objects. It is possible to extract and then reinsert waveforms. This is use for carrying out trace manipulations that do not exist in the CORRELATION toolbox. Be aware if reinserting waveforms that it is possible to manipulate waveforms in ways that may be incompatible with the correlation object, removing waveforms, for example, or altering timestamps.
w  = waveform(c1);
for n = 1:numel(w)
     w(n) = w(n).^2 .* sign(w(n));
end
c2 = correlation(c1,w);
%% Normalize traces

%can also normalize a plot of all waveforms on top of each other with
%plot(normalize(w(i:j)) where i and j are indexes of the waveforms you wish
%to plot


%% Sign traces
%SIGN effectively removes the ampltiude information from traces. In some cases the can improve correlations in the presence of large amplitude transients. 
c2 = sign(c1);
plot(c2,'wig',.3);


%% Stack Traces
%Crop, normalize and stack events. The stack is appended as an additional traces at the bottom. The first NORM call is to ensure that each trace is given equal weight in the stack. The second NORM call is to normalize the new trace stack appended to the end. STACK does not, by default, divide the summation by the number of traces. 

%***CHANGE THIS VALUE***
c1 = crop(c1,-4,15);

c1 = norm(c1);
c1 = stack(c1);
c1 = norm(c1);
plot(c1,'wig')
%% Find Residual Waveform
%Subtract the stacked waveform from all other traces. The final trace is zeroed out because it was subtracted from itself (the stack). 
c2 = norm(c1);
c2 = minus(c2);
plot(c2,'raw',.5)

%% Interferogram
%Calculate the correlation and lag values on narrow time windows within each trace relative to a master event. By default, the final trace is used as the master event, which in this case is the trace stack. Both the maximum correlations and the lag times can be plotted behind a wiggle trace plot, or they can be exported as matrices. This can be a computationally intensive routine. Feedback is given to show progress through the calculation. See HELP CORRELATION/PLOT for an explanation of the lag interferogram color scale. 
c1 = xcorr(c1,[1 3]);       % align traces on the initial wavelet
c1 = adjusttrig(c1);        %     "     "
c1 = interferogram(c1);
plot(c1,'int',1,'corr');    % plot the correlation value interferogram

plot(c1,'int',1,'lag',.01);    % plot the lag value interferogram

%% Occurence Plot
%Display stacked traces for the 10 largest clusters and plot them against the time history of the events.

%***CHANGE THIS VALUE***
c = crop(c,-3,15);

plot(c,'occurence',1,1:10);


%% Overlay Traces
%Plot all traces from the largest cluster together with the stack of the traces.
index = find(c,'CLUST',1);
plot(c,'overlay',1,index);
