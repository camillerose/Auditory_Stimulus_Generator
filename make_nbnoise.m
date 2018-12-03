function handles = make_nbnoise(handles)


disp('Making narrowband noise')

fs = 44100;

% Extract GUI Parameters
dur = str2double(get(handles.duration, 'String')); % get the stim dur in ms
num_samps = fs * (dur/1000);
num_repeats = str2double(get(handles.num_repeats, 'String'));
dur=dur/1000;
bandwidth = str2double(get(handles.bandwidth, 'String'));
steps = str2double(get(handles.step_number, 'String'));
vary_ranges = get(handles.vary_nbnoise, 'Value');
octaves_check = get(handles.octaves_check, 'Value');

ISI = (str2double(get(handles.ISI,'String'))/1000);
if isnan(ISI)
    ISI=0;
end

SAM = (str2double(get(handles.sam,'String')));
if isnan(SAM)
    SAM=0;
end

vary_sam = get(handles.vary_sam, 'Value'); 
if vary_sam
    sam_high = str2double(get(handles.sam_high, 'String'));
    sam_low = SAM;
    sam_array = sam_low:sam_high;
    sam_ctr = 1;
    
else
    sam_array = 1;
end

% create random noise
stim_cell = {}; % empty cell for stim storage
ctr = 1;
name_cell = {}; %stimuli names
ISI_cell = {}; %list of ISI
dur_cell = {}; %list of duration
save_ctr = 1;

%frequency range
if vary_ranges == 0 % one set range
    
    freq_low = str2double(get(handles.freq_range_low, 'String'))*1000;
    freq_high = str2double(get(handles.freq_range_high, 'String'))*1000;
    bbnoise = randn(num_samps,1);
    
    if freq_high > fs/2
       errordlg('The highest frequency cannot exceed the half of the sampling rate (22050 Hz). Change frequency specifications or steps to resolve this issue.','Error!!!')
    end
            
    if freq_low <= 0
       errordlg('Frequency specifications falls at or below 0. Change the bandwidth or starting frequency.','Error!!!')
    end
    
    nbnoise = filter_design(freq_low, freq_high, bbnoise);
    
    % if there is an ISI, incorporate silence between repeats

    for i = 1:num_repeats
        sil = zeros(fs*ISI,1);
        
        for c = 1:length(sam_array)
            
            if SAM ~= 0
                        if ~vary_sam
                            nbnoise = ammod(nbnoise, SAM, fs);
                        elseif vary_sam
                            nbnoise = ammod(nbnoise, sam_array(sam_ctr), fs);
                            SAM = sam_array(sam_ctr);
                            sam_ctr = sam_ctr+1;

                        end
             end
        
        
        noise = [nbnoise' sil'];
        stim_cell{save_ctr} = noise';
        label_cell{save_ctr} = sprintf('Narrowband noise %d kHz to %d kHz: [%d ms dur / %d ms ISI / %d Hz SAM] ', freq_low/1000, freq_high/1000, dur*1000, ISI*1000, SAM);
        name_cell{save_ctr} = sprintf('Narrowband noise %d kHz to %d kHz',freq_low/1000, freq_high/1000);
        ISI_cell{save_ctr} = ISI*1000; %ms
        dur_cell{save_ctr} = dur*1000; %ms
        save_ctr = save_ctr + 1;
        
        end
        
        sam_ctr = 1;
    
    end

    
elseif vary_ranges == 1 && octaves_check == 0
    
    
    center_freq = str2double(get(handles.freq_range_low, 'String'))*1000;
    freq_low = center_freq - (bandwidth*1000);
    freq_high = center_freq + (bandwidth*1000);
    bbnoise = randn(num_samps,1);
    sil = zeros(fs*ISI,1);
    

    for r=1:num_repeats
        
        for i=1:steps
            
            if freq_high > fs/2
                errordlg('The highest frequency cannot exceed the half of the sampling rate (22050 Hz). Change frequency specifications or steps to resolve this issue.','Error!!!')
            end
            
            if freq_low <= 0
                errordlg('Frequency specifications falls at or below 0. Change the bandwidth or starting frequency.','Error!!!')
            end
            
            nbnoise = filter_design(freq_low, freq_high, bbnoise);
            
            for c = 1:length(sam_array)
                
                if SAM ~= 0
                        if ~vary_sam
                            nbnoise = ammod(nbnoise, SAM, fs);
                        elseif vary_sam
                            nbnoise = ammod(nbnoise, sam_array(sam_ctr), fs);
                            SAM = sam_array(sam_ctr);
                            sam_ctr = sam_ctr+1;

                        end
                end
            
                noise = [nbnoise' sil'];
                stim_cell{save_ctr} = noise';
                label_cell{save_ctr} = sprintf('Narrowband noise %d kHz to %d kHz : [%d ms dur / %d ms ISI / %d Hz SAM] ', freq_low/1000, freq_high/1000, dur*1000, ISI*1000, SAM);
                name_cell{save_ctr} = sprintf('Narrowband noise %d kHz to %d kHz',freq_low/1000, freq_high/1000);
                ISI_cell{save_ctr} = ISI*1000; %ms
                dur_cell{save_ctr} = dur*1000; %ms
                save_ctr = save_ctr + 1;
            
            
            end
                freq_low = center_freq;
                freq_high = freq_high + (bandwidth*1000);
                center_freq = center_freq + (bandwidth*1000);
            
            sam_ctr = 1;
          
        end
        
        
    center_freq = str2double(get(handles.freq_range_low, 'String'))*1000;
    freq_low = center_freq - (bandwidth*1000);
    freq_high = center_freq + (bandwidth*1000);

    end
    
    
elseif vary_ranges == 1 && octaves_check == 1
    
    center_freq = str2double(get(handles.freq_range_low, 'String'))*1000;
    freq_low = center_freq/(bandwidth*2);
    freq_high = center_freq*(2*bandwidth);
    bbnoise = randn(num_samps,1);
    sil = zeros(fs*ISI,1);
    
    

    
    for r=1:num_repeats
        
        for i=1:steps
            
            if freq_high > fs/2
                errordlg('The highest frequency cannot exceed the half of the sampling rate (22050 Hz). Change frequency specifications or steps to resolve this issue.','Error!!!')
            end
            
            if freq_low <= 0
                errordlg('Frequency specifications falls at or below 0. Change the bandwidth or starting frequency.','Error!!!')
            end
            
            
            nbnoise = filter_design(freq_low, freq_high, bbnoise);
            
            for c = 1:length(sam_array)
                if SAM ~= 0
                        if ~vary_sam
                            nbnoise = ammod(nbnoise, SAM, fs);
                        elseif vary_sam
                            nbnoise = ammod(nbnoise, sam_array(sam_ctr), fs);
                            SAM = sam_array(sam_ctr);
                            sam_ctr = sam_ctr+1;

                        end
                end

                noise = [nbnoise' sil'];
                stim_cell{save_ctr} = noise';
                label_cell{save_ctr} = sprintf('Narrowband noise %d kHz to %d kHz : [%d ms dur / %d ms ISI / %d Hz SAM] ', freq_low/1000, freq_high/1000, dur*1000, ISI*1000, SAM);
                name_cell{save_ctr} = sprintf('Narrowband noise %d kHz to %d kHz',freq_low/1000, freq_high/1000);
                ISI_cell{save_ctr} = ISI*1000; %ms
                dur_cell{save_ctr} = dur*1000; %ms
                save_ctr = save_ctr + 1;

            end
            
            
            center_freq = freq_high;
            freq_low = center_freq/(bandwidth*2);
            freq_high = freq_high*(bandwidth*2);
            
            sam_ctr = 1;
        end
        
        
    center_freq = str2double(get(handles.freq_range_low, 'String'))*1000;
    freq_low = center_freq/(bandwidth*2);
    freq_high = center_freq*(2*bandwidth);
     
    
    
    
    end


end

handles.stim_2_play = stim_cell;
handles.wait = ISI+dur;
handles.nb_label = label_cell;
handles.stim_type = name_cell;
handles.stim_ISI = ISI_cell;
handles.stim_dur = dur_cell;
handles.time_stamps = {};
