%% make sure MatchedData_nowaveforms.mat and Indexmat are loaded

%% CRF color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',20)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')

for k = Index.CRF.O
    plot(MatchedData.OverallABmedInfra(k), MatchedData.VerticalABmedSeis(k), 'b.', 'MarkerSize',20, 'LineWidth',3)
    hold on
        for i = Index.CRF.N
            plot(MatchedData.OverallABmedInfra(i), MatchedData.VerticalABmedSeis(i), 'k diamond', 'MarkerSize',10, 'LineWidth',3)
                for j = Index.CRF.Y
                    plot(MatchedData.OverallABmedInfra(j), MatchedData.VerticalABmedSeis(j), 'r diamond', 'MarkerSize',10, 'LineWidth',3)
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
%title('Overall Average VASR')

xlim([100,10000000000])
ylim([100,1000000000])

%legend('Electric Activity','','No Electric Data')
hold off

%% CRF color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',20)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')

for i = Index.CRF.N
    plot(MatchedData.OverallABmedInfra(i), MatchedData.VerticalABmedSeis(i), 'k diamond', 'MarkerSize',10, 'LineWidth',3)
    hold on
        for j = Index.CRF.Y
            plot(MatchedData.OverallABmedInfra(j), MatchedData.VerticalABmedSeis(j), 'r diamond', 'MarkerSize',10, 'LineWidth',3)
%             for k = Index.CRF.O
%                 plot(MatchedData.OverallABmedInfra(k), MatchedData.VerticalABmedSeis(k), 'b.', 'MarkerSize',20, 'LineWidth',3)
%             end
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
%title('Overall Average VASR')

xlim([100,10000000000])
ylim([100,1000000000])

%legend('Electric Activity','','No Electric Data')
hold off

%% CRF color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',20)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')

%for i = Index.CRF.N
%    plot(MatchedData.OverallABmedInfra(i), MatchedData.VerticalABmedSeis(i), 'k diamond', 'MarkerSize',10, 'LineWidth',3)
%     hold on
%         for j = Index.CRF.Y
%             plot(MatchedData.OverallABmedInfra(j), MatchedData.VerticalABmedSeis(j), 'r+', 'MarkerSize',10, 'LineWidth',3)
             for k = Index.CRF.O
                 plot(MatchedData.OverallABmedInfra(k), MatchedData.VerticalABmedSeis(k), 'b.', 'MarkerSize',20, 'LineWidth',3)
                 hold on
%             end
%         end
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
%
xlim([100,10000000000])
ylim([100,1000000000])

%legend('Electric Activity','','No Electric Data')
hold off

%% CRF color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',20)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')

%for %i = Index.CRF.N
    %plot(MatchedData.OverallABmedInfra(i), MatchedData.VerticalABmedSeis(i), 'k diamond', 'MarkerSize',10, 'LineWidth',3)
%     hold on
         for j = Index.CRF.Y
             plot(MatchedData.OverallABmedInfra(j), MatchedData.VerticalABmedSeis(j), 'r diamond', 'MarkerSize',10, 'LineWidth',3)
             hold on
%             for k = Index.CRF.O
%                 plot(MatchedData.OverallABmedInfra(k), MatchedData.VerticalABmedSeis(k), 'b.')
%             end
%         end
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
%title('Overall Average VASR')

xlim([100,10000000000])
ylim([100,1000000000])

%legend('Electric Activity','','No Electric Data')
hold off

%% CRF color coded VASR plot in the infra/seis chart format

figure
set(gca,'FontSize',20)
hold on
set(gca,'YScale', 'log')
set(gca,'XScale', 'log')


for i = Index.CRF.N
    plot(MatchedData.OverallABmedInfra(i), MatchedData.VerticalABmedSeis(i), 'k diamond', 'MarkerSize',10, 'LineWidth',3)
%     hold on
%         for j = Index.CRF.Y
%             plot(MatchedData.OverallABmedInfra(j), MatchedData.VerticalABmedSeis(j), 'r+', 'MarkerSize',10, 'LineWidth',3)
%             for k = Index.CRF.O
%                 plot(MatchedData.OverallABmedInfra(k), MatchedData.VerticalABmedSeis(k), 'b.')
%             end
%         end
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
%title('Overall Average VASR')

xlim([100,10000000000])
ylim([100,1000000000])

%legend('Electric Activity','','No Electric Data')
hold off