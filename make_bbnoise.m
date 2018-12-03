function handles = make_bbnoise(handles)


disp('Making broadband noise')

fs = 44100;
dur = str2double(get(handles.duration, 'String')); % get the stim dur in ms
num_samps = fs * (dur/1000);
num_repeats = str2double(get(handles.num_repeats, 'String'));
dur = dur/1000;

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
label_cell = {};
name_cell = {}; %stimuli names
ISI_cell = {}; %list of ISI
dur_cell = {}; %list of duration
save_ctr = 1;

% if there is an ISI, incorporate silence between repeats

    for i = 1:num_repeats
        bbnoise = randn(num_samps,1);
        
        for r = 1:length(sam_array)
            
            bbnoise = randn(num_samps,1);
            
            if SAM ~= 0
                    if ~vary_sam
                        bbnoise = ammod(bbnoise, SAM, fs);
                    elseif vary_sam
                        bbnoise = ammod(bbnoise, sam_array(sam_ctr), fs);
                        SAM = sam_array(sam_ctr);
                        sam_ctr = sam_ctr+1;
                        
                    end
            end
        sil = zeros(fs*ISI,1);
        bbnoise = [bbnoise' sil'];
        stim_cell{save_ctr} = bbnoise';
        label_cell{save_ctr} = sprintf('Broadband noise: [%d ms dur / %d ms ISI / %d Hz SAM] ', dur*1000, ISI*1000, SAM);
        name_cell{save_ctr} = 'Broadband Noise';
        ISI_cell{save_ctr} = ISI*1000; %ms
        dur_cell{save_ctr} = dur*1000; %ms
        
        save_ctr = save_ctr + 1;   
        end
        
        sam_ctr = 1;
    
    end

    
handles.stim_2_play = stim_cell;
handles.wait = ISI+dur;
handles.bb_label = label_cell;
handles.stim_type = name_cell;
handles.stim_ISI = ISI_cell;
handles.stim_dur = dur_cell;
handles.time_stamps = {};

end
