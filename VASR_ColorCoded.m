%% make sure MatchedData_nowaveforms.mat and Indexmat are loaded
%% 


for i = Index.CRF.Y
    figure
    plot(MatchedData.OverallABmaxSeis(i),MatchedData.ltgAll(i),'ro')
    hold on
        for j = Index.CRF.N
        plot(MatchedData.OverallABmaxSeis(j),MatchedData.ltgAll(j),'ko')
            for k = Index.CRF.O
            plot(MatchedData.OverallABmaxSeis(k),MatchedData.ltgAll(k),'b.')
            end
        end
    xlabel('OverallABmaxSeis')
    ylabel('ltgAll')
end

%% 
for i = Index.CRF.Y
    figure
    plot(log(MatchedData.OverallABmaxSeis(i)),log(MatchedData.NLS(i)),'ro')
    hold on
        for j = Index.CRF.N
        plot(log(MatchedData.OverallABmaxSeis(j)),log(MatchedData.NLS(j)),'ko')
            for k = Index.CRF.O
            plot(log(MatchedData.OverallABmaxSeis(k)),log(MatchedData.NLS(k)+1),'b.')
            end
        end
    xlabel('log(OverallABmaxSeis)')
    ylabel('log(NLS)')
end
%% 

for i = Index.CRF.Y
    figure
    plot(MatchedData.ltgAll(i),MatchedData.ElectricActivity(i),'r.')
    hold on
        for j = Index.CRF.N
        plot(MatchedData.ltgAll(j),MatchedData.ElectricActivity(j),'k.')
            for k = Index.CRF.O
            plot(MatchedData.ltgAll(k),MatchedData.ElectricActivity(k),'b.')
            end
        end
    xlabel('ltgAll')
    ylabel('ElectricActivity')
end

%% CRF color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',20)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')

for i = Index.CRF.N
    plot(MatchedData.OverallABmedInfra(i), MatchedData.VerticalABmedSeis(i), 'k+', 'MarkerSize',10, 'LineWidth',3)
    hold on
        for j = Index.CRF.Y
            plot(MatchedData.OverallABmedInfra(j), MatchedData.VerticalABmedSeis(j), 'r+', 'MarkerSize',10, 'LineWidth',3)
            for k = Index.CRF.O
                plot(MatchedData.OverallABmedInfra(k), MatchedData.VerticalABmedSeis(k), 'b.')
            end
        end
end

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average VASR')

legend('Electric Activity','','No Electric Data')
hold off

%% NLS color coded VASR plot in the infra/seis chart format

figure
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
% next line is a pure VASR plot as defined by Johnston and Aster
%scatter(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 15, log(MatchedData.NLS), 'filled')
%test - next lines is a plot of the statistical variables choosen
scatter(MatchedData.OverallABmedInfra, MatchedData.OverallABmedSeis, 15, sqrt(MatchedData.NLS), 'filled')

colorbar
colormap cool

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average Volcanic Acoustic Seismic Ratio - Color is log(NLS)')

hold off 

%% Electrical Activity color coded VASR plot in the infra/seis chart format

figure
%set(gca,'FontSize',30)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
% next line is a pure VASR plot as defined by Johnston and Aster
%scatter(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 15, log(MatchedData.ElectricActivity), 'filled')
%test - next lines is a plot of the statistical variables choosen
scatter(MatchedData.OverallABmedInfra, MatchedData.OverallABmedSeis, 15, sqrt(MatchedData.ElectricActivity), 'filled')

colorbar
colormap jet

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average VASR - Color is log(ElectricActivityDuration)')

hold off

%% ltgAll color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',30)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
scatter(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 45, log(MatchedData.ltgAll), 'filled')
colorbar
colormap cool

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average VASR - Color is log(ltgAll)')

hold off

%% 
%% %% plot only the overall average VASR on the infra vs seis chart

figure
set(gca,'FontSize',30)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
plot(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 'k.', 'MarkerSize',25)

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

%% Subplots of above VASR plots

figure
subplot(2,2,1)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')

for i = Index.CRF.Y
    plot(MatchedData.OverallABavgInfra(i), MatchedData.VerticalABavgSeis(i), 'r*')
    hold on
        for j = Index.CRF.N
            plot(MatchedData.OverallABavgInfra(j), MatchedData.VerticalABavgSeis(j), 'ko')
            for k = Index.CRF.O
                plot(MatchedData.OverallABavgInfra(k), MatchedData.VerticalABavgSeis(k), 'c.')
            end
        end
end

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

legend('CRF','No CRF','No Electric Data')
hold off

%NLS color coded VASR plot in the infra/seis chart format

subplot(2,2,2)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
scatter(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 15, log(MatchedData.NLS), 'filled')
colorbar
colormap cool

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average Volcanic Acoustic Seismic Ratio - Color is log(NLS)')

hold off 

%Electrical Activity color coded VASR plot in the infra/seis chart format

subplot(2,2,3)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
scatter(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 15, log(MatchedData.ElectricActivity), 'filled')
colorbar
colormap cool

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average Volcanic Acoustic Seismic Ratio - Color is log(ElectricActivityDuration)')

hold off

%ltgAll color coded VASR plot in the infra/seis chart format
subplot(2,2,4)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')
scatter(MatchedData.OverallABavgInfra, MatchedData.VerticalABavgSeis, 15, log(MatchedData.ltgAll), 'filled')
colorbar
colormap cool

%adding reference lines refline(slope, intercept)
refline(0.01,0);
refline(0.1,0);
refline(1,0);
refline(10,0);
refline(100,0);

grid ON
xlabel('Infrasound Energy (J)')
ylabel('Seismic Energy (J)')
title('Overall Average Volcanic Acoustic Seismic Ratio - Color is log(ltgAll)')

hold off






























