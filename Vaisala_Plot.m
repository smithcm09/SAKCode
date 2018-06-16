%% Plotting Vaisala data for Sakurajima 5/28-6/8

scatter(Vaisala_lon,Vaisala_Lat,abs(Vaisala_peakCurrent),Date, 'filled')
cbdate
grid on

%% Cluster of 5/30 are on the island proper and match close to a 1st priority event at 5/30 05:39

scatter(Vaisala_lon(1:10),Vaisala_Lat(1:10),abs(Vaisala_peakCurrent(1:10)),Date(1:10), 'filled')
cbdate hh:MM:ss
grid on
hold on
scatter(130.66325,31.57890,100,'r^', 'filled')
hold off
title('Sakurajima Vaisala Lightning Data for 5/30/15')
