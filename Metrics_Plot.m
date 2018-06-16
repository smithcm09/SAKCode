%Plotting the Amplitude Metrics
% have AMPLITUDES.mat loaded

%% Amplitude Plots vs Time

Date = datenum(Date_Time);
figure
subplot(6,2,1)
semilogy(Date, SAKA_BD1, 'k.')
datetick('x');
title('SAKA BD1')

subplot(6,2,3)
semilogy(Date, SAKA_BD2, 'k.')
datetick('x');
title('SAKA BD2')

subplot(6,2,5)
semilogy(Date, SAKA_BD3, 'k.')
datetick('x');
title('SAKA BD3')

subplot(6,2,2)
semilogy(Date, SAKA_HHE, 'k.')
datetick('x');
title('SAKA HHE')

subplot(6,2,4)
semilogy(Date, SAKA_HHN, 'k.')
datetick('x');
title('SAKA HHN')

subplot(6,2,6)
semilogy(Date, SAKA_HHZ, 'k.')
datetick('x');
title('SAKA HHZ')

subplot(6,2,7)
semilogy(Date, SAKB_BD1, 'k.')
datetick('x');
title('SAKB BD1')

subplot(6,2,9)
semilogy(Date, SAKB_BD2, 'k.')
datetick('x');
title('SAKB BD2')

subplot(6,2,11)
semilogy(Date, SAKB_BD3, 'k.')
datetick('x');
title('SAKB BD3')

subplot(6,2,8)
semilogy(Date, SAKB_HHE, 'k.')
datetick('x');
title('SAKB HHE')

subplot(6,2,10)
semilogy(Date, SAKB_HHN, 'k.')
datetick('x');
title('SAKB HHN')

subplot(6,2,12)
semilogy(Date, SAKB_HHZ, 'k.')
datetick('x');
title('SAKB HHZ')


%% Histograms of Event Amplitudes
figure
subplot(6,2,1)
hist(SAKA_BD1, 100)
title('SAKA BD1')

subplot(6,2,3)
hist(SAKA_BD2, 100)
title('SAKA BD2')

subplot(6,2,5)
hist(SAKA_BD3, 100)
title('SAKA BD3')

subplot(6,2,2)
hist(SAKA_HHE, 100)
title('SAKA HHE')

subplot(6,2,4)
hist(SAKA_HHN, 100)
title('SAKA HHN')

subplot(6,2,6)
hist(SAKA_HHZ, 100)
title('SAKA HHZ')

subplot(6,2,7)
hist(SAKB_BD1, 100)
title('SAKB BD1')

subplot(6,2,9)
hist(SAKB_BD2, 100)
title('SAKB BD2')

subplot(6,2,11)
hist(SAKB_BD3, 100)
title('SAKB BD3')

subplot(6,2,8)
hist(SAKB_HHE, 100)
title('SAKB HHE')

subplot(6,2,10)
hist(SAKB_HHN, 100)
title('SAKB HHN')

subplot(6,2,12)
hist(SAKB_HHZ, 100)
title('SAKB HHZ')

%% Plotting Infrasound vs Seismic
figure
subplot(2,1,1)
loglog(SAKA_BD1, SAKA_HHZ, 'ko')
title('SAKA BD1 vs SAKA HHZ')

subplot(2,1,2)
loglog(SAKB_BD1, SAKB_HHZ, 'ko')
title('SAKB BD1 vs SAKB HHZ')

%% 
Date = datenum(Date_Time);

figure
subplot(2,1,1)
semilogy(Date, SAKA_BD1, 'r.')
hold on
semilogy(Date, SAKA_BD2, 'r.')
semilogy(Date, SAKA_BD3, 'r.')
semilogy(Date, SAKB_BD1, 'c.')
semilogy(Date, SAKB_BD2, 'c.')
semilogy(Date, SAKB_BD3, 'c.')
title('Sakurajima Infrasound (Pa)')
datetick('x')
legend('A-BD1','A-BD2','A-BD3','B-BD1','B-BD2','B-BD3','Location','northwest','Orientation','horizontal')
% scatter(LTG,Points, 'k.')
hold off

subplot(2,1,2)
% semilogy(Date, SAKA_HHE, 'r.')
% hold on
% semilogy(Date, SAKA_HHN, 'r.')
semilogy(Date, SAKA_HHZ, 'r.')
hold on
% semilogy(Date, SAKB_HHE, 'c.')
% semilogy(Date, SAKB_HHN, 'c.')
semilogy(Date, SAKB_HHZ, 'c.')
title('Sakurajima Seismic (nm/s)')
datetick('x');
%legend('A-HHE','A-HHN','A-HHZ','B-HHE','B-HHN','B-HHZ','Location','southwest','Orientation','horizontal')
%legend('HHE','HHN','HHZ','Location','southwest','Orientation','horizontal')
legend('A-HHZ','B-HHZ','Location','southwest','Orientation','horizontal')
% scatter(LTG,(Points*10000), 'k.')
hold off