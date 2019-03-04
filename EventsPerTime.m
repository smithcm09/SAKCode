%Load EVENT_CATALOGUE.mat - which is made from the antelope_gismo_week2.m
%code from Glenn

n = hist(arrivalobj.time, (min(arrivalobj.time):max(arrivalobj.time)));
figure
%subplot(3,1,1);
bar(min(arrivalobj.time):max(arrivalobj.time), n);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day')
ylabel ('Number of Events')

%% 

nh = hist(catalogobj.ontime, (min(catalogobj.ontime):1/24:max(catalogobj.ontime)));
subplot(3,1,2);
bar(min(catalogobj.ontime):1/24:max(catalogobj.ontime), nh);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day/Hour')
ylabel ('Number of Events')

nm = hist(catalogobj.ontime, (min(catalogobj.ontime):1/1440:max(catalogobj.ontime)));
subplot(3,1,3);
bar(min(catalogobj.ontime):1/1440:max(catalogobj.ontime), nm);
xlim([736111 736124])
datetick('x');
grid ON
xlabel ('Day/Minute')
ylabel ('Number of Events')

suptitle ('Sakurajima Seismic/Infrasound Event Catalog')