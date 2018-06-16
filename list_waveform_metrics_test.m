function list_waveform_metrics_test(cobj)
% cobj.arrivals;
    numevents = numel(cobj.arrivals);
    
    if numevents == 0
        return
    end

    % get a complete list of channel tags
    ctags = [];
    numctags = 0;
    mintime = Inf;
    maxtime = -Inf;
    for eventnum=1:numevents
        w = cobj.arrivals{eventnum}.waveforms;
        [snum enum]=gettimerange(w);
        if min(snum)<mintime
            mintime = min(snum);
        end
        if max(enum)>maxtime
            maxtime = max(enum);
        end        
        ctags = unique([ctags; get(w,'ChannelTag')]);
    end
    timediff = maxtime-mintime;
    
    % titles
    disp('Maximum Amplitude____________________')
    fprintf('\nEvent\tdd-mmm-yyyy hh:mm:ss\tJulianDay');
    for ctagnum = 1:numel(ctags)
        fprintf('\t%s', ctags(ctagnum).string());
    end
    fprintf('\n.....\t....................\t.........');
    for ctagnum = 1:numel(ctags)
        if strfind(get(ctags(ctagnum),'channel'),'D')
            fprintf('\t(Pascals)');
        else
            fprintf('\t(nm/sec)');
        end
    end
    fprintf('\n');
    
   
    % now go through different metrics of interest, and list for each
    % event for each channel
    for eventnum=1:numevents
        fprintf('%5d:', eventnum);
        w = cobj.arrivals{eventnum}.waveforms;
        wctags = get(w,'ChannelTag');
        a = [];
        t = Inf;
        for ctagnum = 1:numel(ctags)
            a(ctagnum) = -1;
            thisctag = ctags(ctagnum);
            
            idx =find(ismember(wctags.string(), thisctag.string()));
            if idx
                %try
                    m = get(w(idx(1)),'metrics');
%                     m = cobj.arrivals{1,ctagnum}.waveforms(1,ctagnum);
                    a(ctagnum) = max(abs([m.minAmp m.maxAmp]));
                    t = min([m.minTime m.maxTime t]);
                %catch
                %    disp('no metrics')
                %end
            end
        end
        fprintf('\t%s\t%7d', datestr(t),datenum2julday(t));
        for ctagnum = 1:numel(ctags)
            if a(ctagnum)>=0
                fprintf('\t%15.1f', a(ctagnum));
            else
                fprintf('\t%s', '               '); %change whats here but keept o 15 characters if need change in table
            end
        end
        fprintf('\n');
    end