diary ('structureTableTest')
%Structure = catalogobj
%Convert structure to table

diary off
%% 

%Cool events per day and cumulative events plot (can also do by hour if
%catalog is only 1 day long)
catalogobj.plot_counts

%reverted list_waveform_metrics file into my matlabfunction file and changed back to original format of listing just the event metrics not arrival metrics
list_waveform_metrics_test(catalogobj)
