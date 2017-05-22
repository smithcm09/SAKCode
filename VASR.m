%% VASR calculation and plots

%Calculating the VASR using the extracted and averaged Total Energy (J)
% values from ExtractedEnergy.mat

%Calculate VASR for SAKA (avg infra and vert seis)
VASR_A = AverageAInfra./AHZ_TotalEnergyJ;

%Calculate VASR for SAKB (avg infra and vert seis)
VASR_B = AverageBInfra./BHZ_TotalEnergyJ;

%Calculate Overall VASR for AB (all avg infra and avg vert seis)
VASR_AB = OverallABavgInfra./VerticalABavgSeis;

%Calculate the maximum VASR for each event from the set A, B, and AB
for i = 1:numel(EnergyEvent);
    x = [VASR_A(i,1), VASR_B(i,1), VASR_AB(i,1)];
    MaxVASR(i,1) = max(x);
end


%% Plot VASR vs Time

figure
hold on
set(gca,'YScale', 'log')
plot(Date, VASR_A, 'b')%, 'm.')
plot(Date, VASR_B, 'g')%, 'g.')
plot(Date, VASR_AB, 'k')%, 'k.')
xlabel('Date')
ylabel('VASR')
title('Volcanic Acoustic Seismic Ratio')
legend('A','B','AB')
datetick('x')
hold off

%% Histogram of VASR_AB

figure
hist(log(MaxVASR),1000)
% set(gca,'XScale', 'log')
%% Bar Plot of VASR
bar(EnergyEvent,MaxVASR)
xlabel('Event #')
ylabel('Max VASR')
title('Bar Plot of Event vs MaxVASR - deleted high outlier to better see rest of plot')
%delete highpoint outlier to better see trends
%change xlimits to 0-2779 for pretty points

%% plot of all vasr (A,B,AB) on acoustic vs seismic energy chart

figure
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
plot(AverageAInfra, AHZ_TotalEnergyJ, 'b.')
plot(AverageBInfra, BHZ_TotalEnergyJ, 'g.')
plot(OverallABavgInfra, VerticalABavgSeis, 'k.')

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Volcanic Acoustic Seismic Ratio')
legend('A','B','AB')
hold off

%% plot only the max VASR temporally

figure
set(gca,'YScale', 'log')
semilogy(Date, MaxVASR)
xlabel('Date')
ylabel('VASR')
title('Maximum Volcanic Acoustic Seismic Ratio')
datetick('x')

%% plot only the overall average VASR on the infra vs seis chart

figure
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
plot(OverallABavgInfra, VerticalABavgSeis, 'k.')

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average Volcanic Acoustic Seismic Ratio')

hold off

