%Calculating the VASR based on J.B. Johnson, R.C. Aster / Journal of Volcanology and Geothermal Research 148 (2005) 334?354

%load Durations.mat -- in format: A_BD1
%load Amplitudes.mat --  in format: SAKA_BD1

%% calculate the earliest on-time and latest off-time for each event for each setup (SAKA and SAKB)

tic
%preallocate space
MinON_A = zeros(2778,1);
MinON_B = zeros(2778,1);
MaxOFF_A = zeros(2778,1);
MaxOFF_B = zeros(2778,1);

%calculate the minimum infrasound ontime on SAKA across the three
%channels
for i = 1:numel(onEvent);
    x = [onA_BD1(i,1), onA_BD2(i,1), onA_BD3(i,1), onA_HHE(i,1), onA_HHN(i,1), onA_HHZ(i,1)];
    MinON_A(i,1) = max(x);  
end

%calculate the minimum infrasound ontime on SAKB across the three
%channels
for i = 1:numel(Event);
    y = [onB_BD1(i,1), onB_BD2(i,1), onB_BD3(i,1), onB_HHE(i,1), onB_HHN(i,1), onB_HHZ(i,1)];
    MinON_B(i,1) = max(y);  
end

%calculate the maximum infrasound offtime on SAKA across the three
%channels
for i = 1:numel(offEvent);
    x = [offA_BD1(i,1), offA_BD2(i,1), offA_BD3(i,1), offA_HHE(i,1), offA_HHN(i,1), offA_HHZ(i,1)];
    MaxOFF_A(i,1) = max(x);  
end

%calculate the maximum infrasound offtime on SAKB across the three
%channels
for i = 1:numel(Event);
    y = [offB_BD1(i,1), offB_BD2(i,1), offB_BD3(i,1), offB_HHE(i,1), offB_HHN(i,1), offB_HHZ(i,1)];
    MaxOFF_B(i,1) = max(y);  
end
toc
%% 

%calculate the maximum offtime for all stations/channels
for i = 1:numel(Event);
    y = [offA_BD1(i,1), offA_BD2(i,1), offA_BD3(i,1), offA_HHE(i,1), offA_HHN(i,1), offA_HHZ(i,1), offB_BD1(i,1), offB_BD2(i,1), offB_BD3(i,1), offB_HHE(i,1), offB_HHN(i,1), offB_HHZ(i,1)];
    MaxOFF(i,1) = max(y);  
end