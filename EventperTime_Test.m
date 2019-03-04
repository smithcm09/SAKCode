%Load Date variable from AMPLITUDES.Mat -- this is out of the total event
%count reguardless of if had electrical data or both seismic adn infrasound
%components

%code from Glenn

n = hist(Date, (min(Date):max(Date)));
figure
subplot(3,1,1);
bar(min(Date):max(Date), n);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day')
ylabel ('Number of Events')

nh = hist(Date, (min(Date):1/24:max(Date)));
subplot(3,1,2);
bar(min(Date):1/24:max(Date), nh);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day/Hour')
ylabel ('Number of Events')

nm = hist(Date, (min(Date):1/1440:max(Date)));
subplot(3,1,3);
bar(min(Date):1/1440:max(Date), nm);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day/Minute')
ylabel ('Number of Events')

suptitle ('Sakurajima Seismic/Infrasound Event Catalog')

%% 

n = hist(Date, (min(Date):max(Date)));
figure
%subplot(3,1,1);
bar(min(Date):max(Date), n);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day')
ylabel ('Number of Events')
