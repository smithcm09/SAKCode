%% Calculating Duration with GISMO sta/lta detector

% load data
% load('catalogobj.mat')

%pull the waveform from the catalog object (long waveform)


% fileID = fopen('Durations_off.txt', 'a');
% fprintf(fileID, 'Event\tWaveform\tDuration');
% formatSpec = '\n %d\t%d\t%f';
% formatSpec2 = '\n %d\t%d\t%s';

%Make a nexted loop for the waveforms
for i =1:numel(catalogobj.waveforms);
    for j = 1:numel(catalogobj.waveforms{1,i});
           
                
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

            %from https://geoscience-community-codes.github.io/GISMO/cookbook_results/drumplot_cookbook.html#5
            % set the STA/LTA detector
            sta_seconds = 0.5; % STA time window 0.7 seconds
            lta_seconds = 7; % LTA time window 7 seconds
            thresh_on = 2; % Event triggers "ON" with STA/LTA ratio exceeds 3
            thresh_off = 1; % Event triggers "OFF" when STA/LTA ratio drops below 1.5
            minimum_event_duration_seconds = 1.0; % Trigger must be on at least 1 secs
            pre_trigger_seconds = 0; % Do not pad before trigger
            post_trigger_seconds = 0; % Do not pad after trigger
            event_detection_params = [sta_seconds lta_seconds thresh_on thresh_off ...
                minimum_event_duration_seconds];

            % run the STA/LTA detector. lta_mode = 'frozen' means the LTA stops
            % updating when trigger is "ON".
            [cobj,sta,lta,sta_to_lta] = Detection.sta_lta(w, 'edp', event_detection_params, ...
                'lta_mode', 'frozen');
        
        %save figure as .fig and .jpeg
%         saveas(gcf,sprintf('%d_%d', i, j))
        saveas(gcf,sprintf('%d_%d', i, j), 'jpeg')
        close


%         %check to see if arrival exists for this time
% 
%         for k = 1:numel(catalogobj.arrivals{1,i}.time())
%          if get(catalogobj.waveforms{1,i}(j,1),'ChannelTag') == get(catalogobj.arrivals{1,i}.waveforms(k,1), 'ChannelTag')
%              break
%          end
%         end
%         
%         
%         if get(catalogobj.waveforms{1,i}(j,1),'ChannelTag') ~= get(catalogobj.arrivals{1,i}.waveforms(k,1), 'ChannelTag')
%             fprintf(fileID, formatSpec2, i, j, 'NPA');
%             continue
%         end
% 
%          
%          %if no sta/lta durations picked during timeframe
%         if numel(cobj.duration) == 0;
%           fprintf(fileID, formatSpec2, i, j, 'NSLDP');
%         end
% 
%         
%         %if only one duration picked during timeframe
%         if numel(cobj.duration) == 1;
%            format long g;
%            [~,idx]=ismembertol((get(catalogobj.arrivals{1,i}.waveforms(k,1),'start')), cobj.ontime(), 0.00005787, 'DataScale', 1);
%                 if idx == 0; %no matches with arrival pick within 5 seconds
%                     fprintf(fileID, formatSpec2, i, j, 'OANMF');
%                 else
%                     ArrPickEv = cobj.offtime(idx);
%                     fprintf(fileID, formatSpec, i, j, ArrPickEv);
%                 end
%          end
%             
%             
%         %if more than one duration picked in the timeframe... 
%         %first event after within a +- 5 second window from arrival pick
%         if numel(cobj.duration) > 1;
%            format long g;
%            [~,idx]=ismembertol((get(catalogobj.arrivals{1,i}.waveforms(k,1),'start')), cobj.ontime(), 0.00005787, 'DataScale', 1);
%                 if idx == 0 %no matches with arrival pick within 5 seconds
%                     fprintf(fileID, formatSpec2, i, j, 'MANMF');
%                 else
%                     ArrPickEv = cobj.offtime(idx);
%                     fprintf(fileID, formatSpec, i, j, ArrPickEv);
%                 end
%         end
%          
    end
end


