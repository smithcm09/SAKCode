%test code to fix wonky arrival picking

%% 1. Define datasources, channels etc
%     dbpath = '/raid/data/sakurajima/db'; % symlink to Dropbox db, requires /raid/data to be mounted
    dbpath = '/home/c/cmsmith10/SAK';
    dbpath2 = 'SAK';
    antelope.dbcp(dbpath, dbpath2);
    ds = datasource('antelope', dbpath2); 
  
    %% 2. Load arrival table into an Arrival object - after subsetting for June 7th
    arrivalobj = Arrival.retrieve('antelope', dbpath2, 'time > "2015/05/28" && time < "2015/06/08"');
    save sakmaster.mat
    
    %% 3. Add a short waveform for each arrival for arrival waveform metrics
    pretrigsecs = 0; posttrigsecs = 10;
	arrivalobj = arrivalobj.addwaveforms(ds, pretrigsecs, posttrigsecs);
    
    %% 4. Compute an amplitude (and other waveform metrics) for each arrival
    max_time_diff = 1.0; % max seconds between min and max
    arrivalobj = arrivalobj.addmetrics(max_time_diff);
    
    %% 5. Associate arrivals into events in a Catalog
    % 25 seconds grouping for seismic to infra
    catalogobj = arrivalobj.associate(25);

    %% 6. Add short waveforms for each event in the Catalog
    pretriggersecs = 30; posttriggersecs = 90; 
    ctag = ChannelTag({'JP.SAK*.*.*'});
    catalogobj = catalogobj.addwaveforms(ds, ctag, pretriggersecs, posttriggersecs);
    
    %% 7. Add waveform metrics to event waveforms in Catalog
    for eventnum = 1:catalogobj.numberOfEvents
        fprintf('Computing waveform metrics for event %d of %d\n', eventnum, catalogobj.numberOfEvents);
        w = [catalogobj.waveforms{eventnum}];
        maxTimeDiff = 1.0;
        catalogobj.waveforms{eventnum} = addmetrics(w, maxTimeDiff);
    end
    
      %% 8. save the data
    save sakmaster.mat
    
    %% 9. write Catalog to Antelope db
    [dname, dfile] = fileparts(dbpath2);
    dbpath3 = sprintf('./%s_new_test',dfile);
    catalogobj.write('antelope',dbpath3);

%% 10. List waveform metrics
diary('waveform_metrics_test')
list_waveform_metrics_test(catalogobj)
diary off
%% 

% %% 11. Make seismograms, spectrograms and sound files
% mkdir('seismograms')
% mkdir('spectrograms')
% mkdir('soundfiles')
%     
% for eventnum = 1:catalogobj.numberOfEvents
%     
%     startdatestr = datestr(min(get(w,'start')), 26);
%     startdatetimestr = datestr(min(get(w,'start')), 30);
%     estr = sprintf('Event %2d: %s', eventnum, startdatestr);
%     disp(estr)
%     
%     % get waveform
%     w = [catalogobj.waveforms{eventnum}];
%     thisA = catalogobj.arrivals{eventnum};
% 
%     % clean data
%     w = clean(w);
%     
%     % plot seismograms
%     plot_panels(w(:),'arrivals',thisA);
%     suptitle(estr); 
%     print('-dpng', fullfile('seismograms', startdatetimestr )  );
%     snapnow; close
%     
% %     % clean data
% %     w = clean(w);
%     
% 
%     %CSMITH Attempt 3
%     % goal = to have all infra on one plot and all seismic on another plot
% 
%     if numel(w) > 6
%         figure
%         spectrogram([w(1:3) w(7:9)], spectralobject(256,250,15,[1 50])  );
%         suptitle(estr);
%         print('-dpng', fullfile('spectrograms', sprintf('%s_infrasound.png', startdatetimestr )  ));
%         snapnow; close
%     else 
%         figure
%         spectrogram(w(1:3), spectralobject(256,250,15,[1 50])  );
%         suptitle(estr);
%         print('-dpng', fullfile('spectrograms', sprintf('%s_infrasound.png', startdatetimestr )  ));
%         snapnow; close
%     end
%     
%     % plot spectrograms of seismic channels
%     if numel(w) > 6
%         figure
%         spectrogram([w(4:6) w(10:12)], spectralobject(256,250,30,[60 130])  );
%         suptitle(estr); 
%         print('-dpng', fullfile('spectrograms', sprintf('%s_seismic.png', startdatetimestr )  ));
%         snapnow; close
%     else
%         figure
%         spectrogram(w(4:end), spectralobject(256,250,30,[60 130])  );
%         suptitle(estr); 
%         print('-dpng', fullfile('spectrograms', sprintf('%s_seismic.png', startdatetimestr )  ));
%         snapnow; close
%     end
% 
%     
%     % make sound files
%     infrasoundwavname = fullfile('soundfiles', sprintf('%s_infrasound.wav',startdatetimestr )  );
%     waveform2sound(w(3), 30,  infrasoundwavname);
%     seismicwavname = fullfile('soundfiles', sprintf('%s_seismic.wav',startdatetimestr ) );
%     waveform2sound(w(end), 30, seismicwavname);
%     
% end
% 
