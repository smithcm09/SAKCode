dbpath = '/home/c/cmsmith10/SAK/SAK'
ds = datasource('antelope',dbpath);
snum = datenum(2015,5,28,0,0,0);
enum = datenum(2015,6,8,0,0,0);
ctag1 = ChannelTag('','SAKA','','BD1'); %change for other stations
ctag2 = ChannelTag('','SAKA','','HHZ'); %change for other stations
ctag3 = ChannelTag('','SAKB','','BD1'); %change for other stations
ctag4 = ChannelTag('','SAKB','','HHZ'); %change for other stations
w1 = waveform(ds, ctag1, snum, enum);
w2 = waveform(ds, ctag2, snum, enum);
w3 = waveform(ds, ctag3, snum, enum);
w4 = waveform(ds, ctag4, snum, enum);

%% 
% plot(w)
% rsamobj1 = waveform2rsam(w)
%equivalent to next line
% rsamobj2 = waveform2rsam(w, 'mean', 60.0)
% rsamobj3 = waveform2rsam(w, 'max', 10.0)

%% looking for tremor only
rsamobj1 = waveform2rsam(w1, 'median', 600.0)
rsamobj2 = waveform2rsam(w2, 'median', 600.0)
rsamobj3 = waveform2rsam(w3, 'median', 600.0)
rsamobj4 = waveform2rsam(w4, 'median', 600.0)

%% plot all on one plot - wiki way
rsamvectorA = [rsamobj1 rsamobj3] %infra
rsamvectorB = [rsamobj2 rsamobj4] %seis

figure
hold on
subplot(2,1,1)
rsamplot(rsamvectorA)
legend('1:A-BD1','2:B-BD1')
xlabel('2015')
ylabel('Pa')
title('Infrasound')

subplot(2,1,2)
rsamplot(rsamvectorB)
legend('1:A-HHZ','2:B-HHZ')
xlabel('2015')
ylabel('nm/s')
title('Seismic')

suptitle('Sakurajima RSAM: median - 600s')

hold off

%% 

%plot panels
rsamvector = [rsamobj1 rsamobj2 rsamobj3 rsamobj4]
rsamvector.plot_panels();
