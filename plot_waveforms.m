%plot waveform traces for infrasound and seismic from catalogobj.mat
 
%change to number of event

%No CRF
%n = 3

%No Electrical
%n = 2422

% CRF
%n = 2633

%doublecheck to make sure pulling correct event time since R and Matlab
%indices are not the sam

n = 2738

datestr(gettimerange(catalogobj.waveforms{1,n}(1,1)))

%% 

% change to how want data clipped 
% comment everything if want whole raw waveform
% uncomment start time and end time if want zoomed times
% 1st end time is best viewing of waveforms
% 2nd end time is 1 minute of data

%No CRF - Min
%start_time = '5/28/2015 2:18:39'
%end_time = '5/28/2015 2:19:09'
%end_time = '5/28/2015 2:19:39'

%No Electrical - Min
%start_time = '6/06/2015 16:23:05'
%end_time = '6/06/2015 16:24:00'
%end_time = '6/06/2015 16:24:05'

%CRF - Max
%start_time = '6/07/2015 07:58:49'
%end_time = '6/07/2015 07:59:24'
%end_time = '6/07/2015 07:59:49'
%%

% will plot filtered detrended values for the first 6 waveforms
% 3 infra and 3 seismic A vs B depends on if either station was out of
% order, if want other station change X value in -> {1,n,}(X,1)to values 7-12

%If want full waveform section uncomment the capital W lines. 

w1 = catalogobj.waveforms{1,n}(1,1)
w1 = detrend(w1);
fobj = filterobject('b', [.8 10], 2);  %filter
w1 = filtfilt(fobj, w1);
%W1 = extract(w1, 'TIME', start_time, end_time);

w2 = catalogobj.waveforms{1,n}(2,1)
w2 = detrend(w2);
fobj = filterobject('b', [.8 10], 2);  %filter
w2 = filtfilt(fobj, w2);
%W2 = extract(w2, 'TIME', start_time, end_time);

w3 = catalogobj.waveforms{1,n}(3,1)
w3 = detrend(w3);
fobj = filterobject('b', [.8 10], 2);  %filter
w3 = filtfilt(fobj, w3);
%W3 = extract(w3, 'TIME', start_time, end_time);

w4 = catalogobj.waveforms{1,n}(4,1)
w4 = detrend(w4);
fobj = filterobject('b', [.8 10], 2);  %filter
w4 = filtfilt(fobj, w4);
%W4 = extract(w4, 'TIME', start_time, end_time);

w5 = catalogobj.waveforms{1,n}(5,1)
w5 = detrend(w5);
fobj = filterobject('b', [.8 10], 2);  %filter
w5 = filtfilt(fobj, w5);
%W5 = extract(w5, 'TIME', start_time, end_time);

w6 = catalogobj.waveforms{1,n}(6,1)
w6 = detrend(w6);
fobj = filterobject('b', [.8 10], 2);  %filter
w6 = filtfilt(fobj, w6);
%W6 = extract(w6, 'TIME', start_time, end_time);

%%
w = ([w1,w2,w3,w4,w5,w6])
%W = ([W1,W2,W3,W4,W5,W6])

plot_panels(w, 'labels', {})
%plot_panels(W, 'labels', {})

%%
