% Comparison of different frequency values 
%Mean Freq of CRF Subset
xvar = G_Freq.CRF.Y.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).meanf;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.CRF.N.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).meanf;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')

[h,p,ci,stats] = ttest2(x,y)

zvar = G_Freq.CRF.Y.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).meanf;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.CRF.N.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).meanf;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

[h,p,ci,stats] = ttest2(z,s)

tvar = G_Freq.CRF.Y.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).meanf;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.CRF.N.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).meanf;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')

[h,p,ci,stats] = ttest2(t,u)


vvar = G_Freq.CRF.Y.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).meanf;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.CRF.N.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).meanf;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')

[h,p,ci,stats] = ttest2(v,w)

suptitle('Mean Frequency CRF Subset')

%% Peak Freq

% Comparison of different frequency values 
%Peak Freq of CRF Subset
xvar = G_Freq.CRF.Y.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).peakf;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.CRF.N.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).peakf;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')

zvar = G_Freq.CRF.Y.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).peakf;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.CRF.N.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).peakf;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

tvar = G_Freq.CRF.Y.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).peakf;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.CRF.N.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).peakf;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')

vvar = G_Freq.CRF.Y.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).peakf;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.CRF.N.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).peakf;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')

suptitle('Peak Frequency CRF Subset')

%% Frequency Index CRF Subset

% Comparison of different frequency values 
%Peak Freq of CRF Subset
xvar = G_Freq.CRF.Y.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).freqindex;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.CRF.N.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).freqindex;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')

[h,p,ci,stats] = ttest2(x,y)

zvar = G_Freq.CRF.Y.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).freqindex;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.CRF.N.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).freqindex;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

[h,p,ci,stats] = ttest2(z,s)

tvar = G_Freq.CRF.Y.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).freqindex;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.CRF.N.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).freqindex;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')

[h,p,ci,stats] = ttest2(t,u)

vvar = G_Freq.CRF.Y.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).freqindex;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.CRF.N.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).freqindex;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')

[h,p,ci,stats] = ttest2(v,w)

suptitle('Frequency Index CRF Subset')


%% Frequency Ratio CRF Subset

% Comparison of different frequency values 
%Peak Freq of CRF Subset
xvar = G_Freq.CRF.Y.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).freqratio;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.CRF.N.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).freqratio;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')

[h,p,ci,stats] = ttest2(x,y)

zvar = G_Freq.CRF.Y.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).freqratio;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.CRF.N.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).freqratio;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

[h,p,ci,stats] = ttest2(z,s)

tvar = G_Freq.CRF.Y.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).freqratio;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.CRF.N.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).freqratio;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')

[h,p,ci,stats] = ttest2(t,u)

vvar = G_Freq.CRF.Y.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).freqratio;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.CRF.N.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).freqratio;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')

[h,p,ci,stats] = ttest2(v,w)

suptitle('Frequency Ratio CRF Subset')

%% 
%% 
%% 
% FrequencyValues of No Electrical (of CRF y/n/o this is the o)
%Mean Freq of CRF Subset
xvar = G_Freq.CRF.O.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).meanf;
end

figure()
subplot(2,2,1)
histogram(x)
title('NoElectrical A HHZ')


zvar = G_Freq.CRF.O.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).meanf;
end

subplot(2,2,2)
histogram(z)
title('NoElectrical B HHZ')

tvar = G_Freq.CRF.O.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).meanf;
end

subplot(2,2,3)
histogram(t)
title('NoElectrical A BD1')


vvar = G_Freq.CRF.O.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).meanf;
end

subplot(2,2,4)
histogram(v)
title('NoElectrical B BD1')


suptitle('Mean Frequency CRF Subset')

%% Peak Freq

% Comparison of different frequency values 
%Peak Freq of CRF Subset
xvar = G_Freq.CRF.O.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).peakf;
end

figure()
subplot(2,2,1)
histogram(x)
title('NoElectrical A HHZ')


zvar = G_Freq.CRF.O.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).peakf;
end

subplot(2,2,2)
histogram(z)
title('NoElectrical B HHZ')


tvar = G_Freq.CRF.O.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).peakf;
end

subplot(2,2,3)
histogram(t)
title('NoElectrical A BD1')


vvar = G_Freq.CRF.O.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).peakf;
end

subplot(2,2,4)
histogram(v)
title('NoElectrical B BD1')

suptitle('Peak Frequency CRF Subset')

%% Frequency Index CRF Subset

% Comparison of different frequency values 
%Peak Freq of CRF Subset
xvar = G_Freq.CRF.O.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).freqindex;
end

figure()
subplot(2,2,1)
histogram(x)
title('NoElectrical A HHZ')


zvar = G_Freq.CRF.O.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).freqindex;
end

subplot(2,2,2)
histogram(z)
title('NoElectrical B HHZ')


tvar = G_Freq.CRF.O.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).freqindex;
end

subplot(2,2,3)
histogram(t)
title('NoElectrical A BD1')

vvar = G_Freq.CRF.O.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).freqindex;
end

subplot(2,2,4)
histogram(v)
title('NoElectrical B BD1')


suptitle('Frequency Index CRF Subset')


%% Frequency Ratio CRF Subset

% Comparison of different frequency values 
%Peak Freq of CRF Subset
xvar = G_Freq.CRF.O.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).freqratio;
end

figure()
subplot(2,2,1)
histogram(x)
title('NoElectrical A HHZ')



zvar = G_Freq.CRF.O.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).freqratio;
end

subplot(2,2,2)
histogram(z)
title('NoElectrical B HHZ')


tvar = G_Freq.CRF.O.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).freqratio;
end

subplot(2,2,3)
histogram(t)
title('NoElectrical A BD1')

vvar = G_Freq.CRF.O.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).freqratio;
end

subplot(2,2,4)
histogram(v)
title('NoElectrical B BD1')

suptitle('Frequency Ratio CRF Subset')


