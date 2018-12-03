function handles = make_puretone(handles)

fs = 44100;

const_freq = str2double(get(handles.const_freq, 'String'));

dur = str2double(get(handles.duration, 'String'));
num_samps = fs * (dur/1000);
num_repeats = str2double(get(handles.num_repeats, 'String'));
dur = dur/1000;

ISI = (str2double(get(handles.ISI,'String'))/1000);
if isnan(ISI)
    ISI = 0;
end

SAM = str2double(get(handles.sam,'String'));
if isnan(SAM)
    SAM = 0;
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

label_cell = {};
name_cell = {}; %stimuli names
ISI_cell = {}; %list of ISI
dur_cell = {}; %list of duration
save_ctr = 1;


    for i = 1:num_repeats
        
        for r = 1:length(sam_array)
            
            s = (1:num_samps)/fs; % sound data preparation
            pt = sin(2*pi*(const_freq*1000)*s); % tone data
        
            if SAM ~= 0
                    if ~vary_sam
                        pt = ammod(pt, SAM, fs);
                    elseif vary_sam
                        pt = ammod(pt, sam_array(sam_ctr), fs);
                        SAM = sam_array(sam_ctr);
                        sam_ctr = sam_ctr+1;                      
                    end
            end
            
            sil = zeros(fs*ISI,1);
            pt = [pt sil'];
            stim_cell{save_ctr} = pt';
            label_cell{save_ctr} =sprintf('Pure tone of %d kHz: [%d ms dur / %d ms ISI / %d Hz SAM] ', const_freq, dur*1000, ISI*1000, SAM);
            name_cell{save_ctr} = sprintf('Pure tone of %d kHz',const_freq);
            ISI_cell{save_ctr} = ISI*1000; %ms
            dur_cell{save_ctr} = dur*1000; %ms

            save_ctr = save_ctr + 1;
        
        end
        
        sam_ctr = 1;
    
    end


handles.stim_2_play = stim_cell;
handles.wait = ISI+dur;
handles.pt_label = label_cell;
handles.stim_type = name_cell;
handles.stim_ISI = ISI_cell;
handles.stim_dur = dur_cell;
handles.time_stamps = {};

end