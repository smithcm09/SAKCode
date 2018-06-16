% Comparison of different frequency values 
%Mean Freq of E/NoE Subset
xvar = G_Freq.E.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).meanf;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.NoE.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).meanf;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')

[h,p,ci,stats] = ttest2(x,y)

zvar = G_Freq.E.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).meanf;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.NoE.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).meanf;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

[h,p,ci,stats] = ttest2(z,s)

tvar = G_Freq.E.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).meanf;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.NoE.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).meanf;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')

[h,p,ci,stats] = ttest2(t,u)

vvar = G_Freq.E.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).meanf;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.NoE.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).meanf;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')

[h,p,ci,stats] = ttest2(v,w)

suptitle('Mean Frequency E/NoE Subset')

%% Peak Freq

% Comparison of different frequency values 
%Peak Freq of E/NoE Subset
xvar = G_Freq.E.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).peakf;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.NoE.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).peakf;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')



zvar = G_Freq.E.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).peakf;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.NoE.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).peakf;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

tvar = G_Freq.E.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).peakf;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.NoE.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).peakf;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')



vvar = G_Freq.E.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).peakf;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.NoE.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).peakf;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')


suptitle('Peak Frequency E/NoE Subset')

%% Frequency Index E/NoE Subset

% Comparison of different frequency values 
%Peak Freq of E/NoE Subset
xvar = G_Freq.E.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).freqindex;
end

mx = mean(x)

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.NoE.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).freqindex;
end

my = mean(y)

subplot(2,4,2)
histogram(y)
title('No A HHZ')

[h,p,ci,stats] = ttest2(x,y)

zvar = G_Freq.E.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).freqindex;
end

mz = mean(z)

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.NoE.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).freqindex;
end

ms = mean(s)

subplot(2,4,4)
histogram(s)
title('No B HHZ')

[h,p,ci,stats] = ttest2(z,s)

tvar = G_Freq.E.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).freqindex;
end

mt = mean(t)

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.NoE.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).freqindex;
end

mu = mean(u)

subplot(2,4,6)
histogram(u)
title('No A BD1')

[h,p,ci,stats] = ttest2(t,u)

vvar = G_Freq.E.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).freqindex;
end

mv = mean(v)

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.NoE.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).freqindex;
end

mw = mean(w)

subplot(2,4,8)
histogram(w)
title('No B BD1')

[h,p,ci,stats] = ttest2(v,w)

suptitle('Frequency Index E/NoE Subset')


%% Frequency Ratio E/NoE Subset

% Comparison of different frequency values 
%Peak Freq of E/NoE Subset
xvar = G_Freq.E.A.HHZs
maxnum = numel(xvar(1,1:end))
for i = 1:maxnum
    x(i,1) = xvar(1,i).freqratio;
end

figure()
subplot(2,4,1)
histogram(x)
title('Yes A HHZ')

yvar = G_Freq.NoE.A.HHZs
maxnum = numel(yvar(1,1:end))
for i = 1:maxnum
    y(i,1) = yvar(1,i).freqratio;
end

subplot(2,4,2)
histogram(y)
title('No A HHZ')

[h,p,ci,stats] = ttest2(x,y)

zvar = G_Freq.E.B.HHZs
maxnum = numel(zvar(1,1:end))
for i = 1:maxnum
    z(i,1) = zvar(1,i).freqratio;
end

subplot(2,4,3)
histogram(z)
title('Yes B HHZ')

svar = G_Freq.NoE.B.HHZs
maxnum = numel(svar(1,1:end))
for i = 1:maxnum
    s(i,1) = svar(1,i).freqratio;
end

subplot(2,4,4)
histogram(s)
title('No B HHZ')

[h,p,ci,stats] = ttest2(z,s)

tvar = G_Freq.E.A.BD1s
maxnum = numel(tvar(1,1:end))
for i = 1:maxnum
    t(i,1) = tvar(1,i).freqratio;
end

subplot(2,4,5)
histogram(t)
title('Yes A BD1')

uvar = G_Freq.NoE.A.BD1s
maxnum = numel(uvar(1,1:end))
for i = 1:maxnum
    u(i,1) = uvar(1,i).freqratio;
end

subplot(2,4,6)
histogram(u)
title('No A BD1')

[h,p,ci,stats] = ttest2(t,u)

vvar = G_Freq.E.B.BD1s
maxnum = numel(vvar(1,1:end))
for i = 1:maxnum
    v(i,1) = vvar(1,i).freqratio;
end

subplot(2,4,7)
histogram(v)
title('Yes B BD1')

wvar = G_Freq.NoE.B.BD1s
maxnum = numel(wvar(1,1:end))
for i = 1:maxnum
    w(i,1) = wvar(1,i).freqratio;
end

subplot(2,4,8)
histogram(w)
title('No B BD1')

[h,p,ci,stats] = ttest2(v,w)

suptitle('Frequency Ratio E/NoE Subset')
