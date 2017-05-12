
%Waveform Correlation from the Correlation cookbook 
% http://www.giseis.alaska.edu/Seis/EQ/tools/GISMO/correlation_cookbook/correlation_cookbook.html

%Load arrival data from the resulting structures from Antelope_gismo_week2

dbpath = '/home/c/cmsmith10/SAK/SAK'
ds = datasource('antelope',dbpath);
%% 

%change structure to arrays
T = arrivalobj.time;
Ch = arrivalobj.channelinfo;

%subset arrays based on the station/channel string desired
time = T(strcmp('.SAKA..HHZ',Ch),:);
%% 

%change scnl to the specific station and channel that you wish to run the
%correlation on
%scnl = scnlobject('sta','chan');
scnl = scnlobject('SAKA','HHZ');

c = correlation(ds,scnl,time,-1,15);

%c = correlation(ds,scnl,timenum,-1,60);
%reminder of what can be done with a correlationobject
% methods(c)
% display(c)

%% Plot original data

%can use 'sha' for a shaded instead of wiggle plot
%plot(c,'wig');
plot(c,'sha');

%% crop filter and taper waveforms

c = crop(c,-4,12);
c = taper(c);
c = butter(c,[.5 15]);

%% Perform the cross correlation

c = xcorr(c,[0 3.5]);

%% create the Similarity Matrix

c = sort(c);
plot(c,'corr');
corr_matrix = get(c,'CORR');
corr_matrix(1:5,1:5)

%% Create the Lag Matrix

plot(c,'lag');
lag_matrix = get(c,'LAG');
lag_matrix(1:5,1:5)

%% Realign traces

c = adjusttrig(c,'MIN',1);
plot(c,'sha');

%% Create the hierarchial cluster tree

c = linkage(c);
plot(c,'den');
close(gcf)

%% Determine Event Clusters

% the (c,0.#) is the minimum correlation coefficient allowed for the
% cluster

c = cluster(c,.8);
%c = cluster(c,.8);
index = find(c,'CLUST',1);
c1 = subset(c,index);
plot(c1,'wig');

%% Converting waveform and correlation objects

w  = waveform(c1);
for n = 1:numel(w)
     w(n) = w(n).^2 .* sign(w(n));
end
c2 = correlation(c1,w);

%% Sign traces

c2 = sign(c1);
plot(c2,'wig',.3);


%% Stack Traces

c1 = crop(c1,-4,9);
c1 = norm(c1);
c1 = stack(c1);
c1 = norm(c1);

%% Find Residual Waveform

c2 = norm(c1);
c2 = minus(c2);
plot(c2,'raw',.5)

%% Interferogram

c1 = xcorr(c1,[1 3]);       % align traces on the initial wavelet
c1 = adjusttrig(c1);        %     "     "
c1 = interferogram(c1);
plot(c1,'int',1,'corr');    % plot the correlation value interferogram

plot(c1,'int',1,'lag',.01);    % plot the lag value interferogram

%% Occurence Plot

% c = crop(c,-3,10);
% plot(c,'occurence',1,1:10);


%% Overlay Traces

index = find(c,'CLUST',1);
plot(c,'overlay',1,index);

%% 
% close all


