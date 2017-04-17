function TableMetrics(cobj)
    %making table from catalog arrivals amplitudes
    %load sakmaster.mat as developed from the sakurajima catalog workflow
    %cobj is the name of the catalog object --> for the SAK dataset this is
    %catalogobj
    
    for i = 1:2%cobj.numberOfEvents
        Sta_Chan = cobj.arrivals{1,i}.channelinfo;
        Sta_Chan = [Sta_Chan];
        Sta_Chan = Sta_Chan';
        Sta_Chan = horzcat(Sta_Chan);
        
        A = cobj.arrivals{1,i}.amp;
        Amplitude = num2cell(A);
        Amplitude = Amplitude';
        Amplitude = horzcat(Amplitude);
        
        Chan_Amp = vertcat(Sta_Chan,Amplitude);
        
        C = cobj.arrivals{1,i}.time;
        D = min(C);
        E = max(C);
        F = datestr(epoch2datenum(D), 'mm-dd-yyyy HH:MM:SS.FFF');
        G = datestr(epoch2datenum(E), 'mm-dd-yyyy HH:MM:SS.FFF');
        Arrival = vertcat({F},{G});
        
        T = table(Arrival, Chan_Amp)
        
        j=i;
        
%         while j < cobj.numberOfEvents
%             T(j,:) = table(Arrival,Chan_Amp)
%             j = j+1
%         end

end
    