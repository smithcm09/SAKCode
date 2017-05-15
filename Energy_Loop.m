% Energy Calculation
% energygy.m is a function from Glenn Thompson based off of the Johnson and
% Aster (2005) paper
    dbpath = '/home/c/cmsmith10/SAK/SAK';
    dbpath2 = 'SAK';
    antelope.dbcp(dbpath, dbpath2);
    ds = datasource('antelope', dbpath); 
%% 

%load catalogobj.mat; and the MaxOFF variable from Energy_Loop.mat

%Load Waveforms using the arrival pick as the start time and the maximum
%off time from the duration calculation for the off time - this is so that
%the energy is calculated "The integral is thus calculated from the signal
%onset until the time when both seismic and acoustic amplitudes have
%decayed to background levels" (Johnson and Aster, 2005) 

% %     save Energy_Loop.mat
% % 

    %% 
%     fileID = fopen('PostTrig.txt', 'a');
%     fprintf(fileID, 'Event\tWaveform\tPostTrig');
%     formatSpec = '\n %d\t%d\t%f';
%     formatSpec2 = '\n %d\t%d\t%s';
% 
%     % calculate postTrig time for each waveform in the catalog
%     for i =1:numel(catalogobj.waveforms);
%         for j = 1:numel(catalogobj.waveforms{1,i});
%             
%              %check to see if arrival exists for this time
%         for k = 1:numel(catalogobj.arrivals{1,i}.time())
%          if get(catalogobj.waveforms{1,i}(j,1),'ChannelTag') == get(catalogobj.arrivals{1,i}.waveforms(k,1), 'ChannelTag')
%              break
%          end
%         end
%         
%         if get(catalogobj.waveforms{1,i}(j,1),'ChannelTag') ~= get(catalogobj.arrivals{1,i}.waveforms(k,1), 'ChannelTag')
%             fprintf(fileID, formatSpec2, i, j, 'no_picked_arrival');
%             continue
%         end
%         
%             TimeDiff = (MaxOFF(i,1)-catalogobj.arrivals{1,i}.time(k,1))*86400;
%             fprintf(fileID, formatSpec, i, j, TimeDiff);
%         end
%     end
%     
%     PostTrig = abs(PostTrig); % some of the math gave negative times (n = 3) so use abs to get positive values

%% 

fileID = fopen('Energy_extracted_waveforms.txt', 'a');
fprintf(fileID, 'Event\tWaveform\tTotalEnergy(J)\tDuration\tMeanPower\tMaxPower');
formatSpec = '\n %d\t%d\t%f\t%f\t%f\t%f';
formatSpec2 = '\n %d\t%d\t%s';

%Make a nested loop for the waveforms
for i =1:numel(catalogobj.waveforms);
    for j = 1:numel(catalogobj.waveforms{1,i});
           
        fprintf('\nCalculating %d_%d ', i,j)
                
            %pull the waveform from the catalog object (long waveform)
            w = catalogobj.waveforms{1,i}(j,1);
        
            %from https://geoscience-community-codes.github.io/GISMO/cookbook_results/drumplot_cookbook.html#5
            % clean data
            % in case there are gaps in the time series (marked by NaN) we can interpolate a
            % meaningful value
            w = fillgaps(w, 'interp');

            % detrend the time series - this removes linear drift
            w = detrend(w);

            % create a Butterworth bandpass filter from 0.5 to 15 Hz, 2 poles
            %%%% changed from 0.5-15 to 0.8-10
            fobj = filterobject('b', [0.8 10], 2);

            % apply the filter in both directions (acausal) - this is a zero phase
            % filter which is helpful because it doesn't disperse different frequency
            % components. the caveat is that it can spread energy so arrivals may appear
            % slighter earlier than they actually are
            w = filtfilt(fobj, w);
%             plot(w)
            
            for k = 1:numel(catalogobj.arrivals{1,i}.time())
                if get(catalogobj.waveforms{1,i}(j,1),'ChannelTag') == get(catalogobj.arrivals{1,i}.waveforms(k,1), 'ChannelTag')
             break
                end
            end
            if get(catalogobj.waveforms{1,i}(j,1),'ChannelTag') ~= get(catalogobj.arrivals{1,i}.waveforms(k,1), 'ChannelTag')
                fprintf(fileID, formatSpec2, i, j, 'no_picked_arrival');
                continue
            end
  
                %crop the waveform to the arrivaltime and Posttrig boundaries
                StartTime = catalogobj.arrivals{1,i}.time(k,1);
                EndTime = MaxOFF(i,1);
                if isnan(EndTime)
                    fprintf(fileID, formatSpec2, i, j, 'NaN_endTime');
                    continue
                end
                    
                w2 = extract(w, 'TIME', StartTime, EndTime);
%                 plot(w2)  

            %use the energygt.m function to create an energy class
            %containing the data
            %second value in energygt is the distance to station
            % distance of 4km (4000m) is from
            % http://www.nhc.noaa.gov/gccalc.shtml using the station and
            % showa lat/long values from my GMT files
            
            En = energygt(w2, 4000);
             
        TE = En.totalenergy;
        Dur = En.duration;
        MeP = En.meanpower;
        MP = En.maxpower;
        fprintf(fileID, formatSpec, i, j, TE, Dur, MeP, MP);
       
    end
end