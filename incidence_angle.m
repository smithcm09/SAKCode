%Event number in my catalogobj.mat file
number = 953

%Double check the 4,5,6 numbers in the waveforms to make sure they are the correct sta/cha combo for desired components

%EW Component
wE = catalogobj.waveforms{1,number}(4,1);
wE = detrend(wE);
fobj = filterobject('b', [.8 10], 2);  %filter
wE = filtfilt(fobj, wE);

%NS Component
wN = catalogobj.waveforms{1,number}(5,1);
wN = detrend(wN);
fobj = filterobject('b', [.8 10], 2);  %filter
wN = filtfilt(fobj, wN);

%Vertical Component
wZ = catalogobj.waveforms{1,number}(6,1);
wZ = detrend(wZ);
fobj = filterobject('b', [.8 10], 2);  %filter
wZ = filtfilt(fobj, wZ);


%% 

% build waveform vector
thisw = ([wZ wN wE])

t = threecomp(thisw);
TC = particlemotion(t);


plot_panels(thisw, 'labels', {})


plot(TC.inclination)


plot(TC.azimuth)

