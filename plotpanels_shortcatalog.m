n = 2646

%shortCatalog{1,n}


w1 = shortCatalog{1,n}(1,1)
w1 = detrend(w1);
fobj = filterobject('b', [.8 10], 2);  %filter
w1 = filtfilt(fobj, w1);


w2 = shortCatalog{1,n}(2,1)
w2 = detrend(w2);
fobj = filterobject('b', [.8 10], 2);  %filter
w2 = filtfilt(fobj, w2);

w3 = shortCatalog{1,n}(3,1)
w3 = detrend(w3);
fobj = filterobject('b', [.8 10], 2);  %filter
w3 = filtfilt(fobj, w3);


w4 = shortCatalog{1,n}(4,1)
w4 = detrend(w4);
fobj = filterobject('b', [.8 10], 2);  %filter
w4 = filtfilt(fobj, w4);


w5 = shortCatalog{1,n}(5,1)
w5 = detrend(w5);
fobj = filterobject('b', [.8 10], 2);  %filter
w5 = filtfilt(fobj, w5);


w6 = shortCatalog{1,n}(6,1)
w6 = detrend(w6);
fobj = filterobject('b', [.8 10], 2);  %filter
w6 = filtfilt(fobj, w6);

w = ([w1,w2,w3,w4,w5,w6])

%%
plot_panels(w)
%plot_panels(w, 'labels', {})

