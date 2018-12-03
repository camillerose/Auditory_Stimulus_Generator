function handles = make_tones(handles)

disp('Making tones')

fs = 44100;

% Extract GUI Parameters
freq_low = str2double(get(handles.freq_range_low, 'String'));
freq_high = str2double(get(handles.freq_range_high, 'String'));
steps = str2double(get(handles.step_number, 'String'));

dur = str2double(get(handles.duration, 'String'));
num_samps = fs * (dur/1000);
num_repeats = str2double(get(handles.num_repeats, 'String'));

dur= dur/1000;

ISI = (str2double(get(handles.ISI,'String'))/1000);
if isnan(ISI)
    ISI = 0;
end

SAM = str2double(get(handles.sam,'String'));
if isnan(SAM)
    SAM = 0;
end


stim_cell = {}; % cell for data storage
label_cell = {}; % mark labels for each freq
name_cell = {}; %stimuli names
ISI_cell = {}; %list of ISI
dur_cell = {}; %list of duration

% make stimuli in terms of octave increase
sil = zeros(fs*ISI,1);
ctr = 1;

cf = freq_low*1000; % starting frequency, carrier freq in Hz
vary_sam = get(handles.vary_sam, 'Value'); 
if vary_sam
    sam_high = str2double(get(handles.sam_high, 'String'));
    sam_low = SAM;
    sam_array = sam_low:sam_high;
    sam_ctr = 1;
    
else
    sam_array = 1;
end

save_ctr = 1;


if get(handles.force_steps, 'Value') == 0
    for r=1:num_repeats

            for i = 1:steps

            for c = 1:length(sam_array)
                s = (1:num_samps)/fs; % sound data preparation
                y = sin(2*pi*cf*s); % tone data

                if SAM ~= 0
                    if ~vary_sam
                        y = ammod(y, SAM, fs);
                    elseif vary_sam
                        y = ammod(y, sam_array(sam_ctr), fs);
                        SAM = sam_array(sam_ctr);
                        sam_ctr = sam_ctr+1;
                        
                    end
                end
            
            y = [y sil'];
            stim_cell{save_ctr} = y';
            label_cell{save_ctr} = sprintf('Tone of %d kHz: [%d ms dur / %d ms ISI / %d Hz SAM] ', cf/1000, dur*1000, ISI*1000, SAM);
            name_cell{save_ctr} = sprintf('Tone of %d kHz', cf/1000);
            ISI_cell{save_ctr} = ISI*1000; %ms
            dur_cell{save_ctr} = dur*1000; %ms
            
            save_ctr = save_ctr + 1;
            
            end
            
            sam_ctr = 1;
            cf = cf+cf; % increase cf by an octave
               
                if cf > freq_high*1000 
                    cf = freq_low *1000;
                end

            end
    end
end



if get(handles.force_steps, 'Value') == 1
    step_size = ((freq_high-freq_low)/(steps-1))*1000;
    cf = freq_low *1000;
    
    for r=1:num_repeats


            for i = 1:steps


            s = (1:num_samps)/fs; % sound data preparation
            y = sin(2*pi*cf*s); % tone data
            
            for c = 1:length(sam_array)
                if SAM ~= 0
                    if ~vary_sam
                        y = ammod(y, SAM, fs);
                    elseif vary_sam
                        y = ammod(y, sam_array(sam_ctr), fs);
                        SAM = sam_array(sam_ctr);
                        sam_ctr = sam_ctr+1;
                        
                    end
                end
            
            y = [y sil'];
            stim_cell{save_ctr} = y';
            label_cell{save_ctr} = sprintf('Tone of %d kHz: [%d ms dur / %d ms ISI / %d Hz SAM] ', cf/1000, dur*1000, ISI*1000, SAM);
            name_cell{save_ctr} = sprintf('Tone of %d kHz', cf/1000);
            ISI_cell{save_ctr} = ISI*1000; %ms
            dur_cell{save_ctr} = dur*1000; %ms
            
            save_ctr = save_ctr + 1;
          
            end
            
            sam_ctr = 1;
            cf = cf+step_size;

                  if cf > freq_high*1000
                     cf = freq_low *1000;
                  end

            end
    end
end


handles.stim_2_play = stim_cell;
handles.wait = ISI+dur;
handles.tone_labels = label_cell;
handles.stim_type = name_cell;
handles.stim_ISI = ISI_cell;
handles.stim_dur = dur_cell;
handles.time_stamps = {};




