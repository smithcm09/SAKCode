%load LTG_Datetimes.mat file

%change datetime to datenum
LTG = datenum(LtgDate);

%make vector of matching length to LTG of standard value
Points = ones(353,1);

%Plot ltg times versus set points
scatter(LTG,Points, 'k.')
datetick('x')
%% 
Point2 = ones(2778,1)
figure
hold on
scatter(catalogobj.ontime,Point2, 'r*')
scatter(LTG,Points, 'k.')
datetick('x')