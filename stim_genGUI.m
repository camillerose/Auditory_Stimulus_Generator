function varargout = stim_genGUI(varargin)
% STIM_GENGUI MATLAB code for stim_genGUI.fig
%      STIM_GENGUI, by itself, creates a new STIM_GENGUI or raises the existing
%      singleton*.
%
%      H = STIM_GENGUI returns the handle to a new STIM_GENGUI or the handle to
 %
%      STIM_GENGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STIM_GENGUI.M with the given input arguments.
%
%      STIM_GENGUI('Property','Value',...) creates a new STIM_GENGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stim_genGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stim_genGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stim_genGUI

% Last Modified by GUIDE v2.5 14-Sep-2015 13:52:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stim_genGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @stim_genGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before stim_genGUI is made visible.
function stim_genGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stim_genGUI (see VARARGIN)

% Choose default command line output for stim_genGUI
handles.output = hObject;

set(handles.sam_high, 'enable', 'off');

setappdata(0, 'SaveNum', 1);
setappdata(0, 'first_play', 1);

% Update handles structure
guidata(hObject, handles);

stim_log()

% UIWAIT makes stim_genGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stim_genGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function freq_range_low_Callback(hObject, eventdata, handles)
% hObject    handle to freq_range_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_range_low as text
%        str2double(get(hObject,'String')) returns contents of freq_range_low as a double


% --- Executes during object creation, after setting all properties.
function freq_range_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_range_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_range_high_Callback(hObject, eventdata, handles)
% hObject    handle to freq_range_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_range_high as text
%        str2double(get(hObject,'String')) returns contents of freq_range_high as a double


% --- Executes during object creation, after setting all properties.
function freq_range_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_range_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_number_Callback(hObject, eventdata, handles)
% hObject    handle to step_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_number as text
%        str2double(get(hObject,'String')) returns contents of step_number as a double


% --- Executes during object creation, after setting all properties.
function step_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sam_Callback(hObject, eventdata, handles)
% hObject    handle to sam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sam as text
%        str2double(get(hObject,'String')) returns contents of sam as a double


% --- Executes during object creation, after setting all properties.
function sam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function duration_Callback(hObject, eventdata, handles)
% hObject    handle to duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duration as text
%        str2double(get(hObject,'String')) returns contents of duration as a double


% --- Executes during object creation, after setting all properties.
function duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ISI_Callback(hObject, eventdata, handles)
% hObject    handle to ISI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ISI as text
%        str2double(get(hObject,'String')) returns contents of ISI as a double


% --- Executes during object creation, after setting all properties.
function ISI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ISI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in generate_stim.
function generate_stim_Callback(hObject, eventdata, handles)
% hObject    handle to generate_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs = 44100;
logGUI = getappdata(0, 'logGUI');
rando = get(handles.randomize, 'Value');
setappdata(0, 'play_stim', 0);
handles.stim_2_play = [];

% if a checkbox has been selected, call the respective function
%%
if get(handles.create_tones, 'Value') == 1
    
    handles = make_tones(handles);
    if rando
       rand_array = randperm(length(handles.stim_2_play)); 
    end
    
    while getappdata(0, 'play_stim') == 0
        pause(.001)
    end
        for i = 1:length(handles.stim_2_play)
                       
            if rando        
                sound(handles.stim_2_play{rand_array(i)}, fs)
                start_time = datestr(now,'HH:MM:SS.FFF AM');
                time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');
            else
                sound(handles.stim_2_play{i},fs);
                start_time = datestr(now,'HH:MM:SS.FFF AM');
                time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');
            end
            
            pause(handles.wait)
            data = get(logGUI.log, 'String');
            
            if rando
                set(logGUI.log, 'String', [data; {[handles.tone_labels{rand_array(i)} time_stamp]}]);  
            else
                set(logGUI.log, 'String', [data; {[handles.tone_labels{i} time_stamp]}]);  
            end
            
            
            len = length(handles.stim_2_play); % how many stim
            len_ctr = (1:len);
        
            handles.time_stamps{len_ctr(i)} = start_time;
        
            
        end
        
        disp('STIMULI PLAYED:')
        disp('Range of tones')
    
        stim_type = handles.stim_type';
        start_times = handles.time_stamps';
        stim_ISI = handles.stim_ISI';
        stim_dur = handles.stim_dur';
       
        filename = get(handles.save_filename, 'String'); 
        
        saveNum = getappdata(0, 'SaveNum');
        filename = [num2str(saveNum) '_' filename];
        setappdata(0, 'SaveNum', saveNum+1);
        
        save(filename, 'stim_type', 'start_times', 'stim_ISI', 'stim_dur');
        
end

%%
if get(handles.create_bbnoise, 'Value') == 1

    handles = make_bbnoise(handles);

    
    while getappdata(0, 'play_stim') == 0
        pause(.001)
    end
        
        for i = 1:length(handles.stim_2_play)
                  
            sound(handles.stim_2_play{i},fs);
            time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM'); 
            start_time = datestr(now,'HH:MM:SS.FFF AM');
            pause(handles.wait)
            data = get(logGUI.log, 'String');
            set(logGUI.log, 'String', [data; {[handles.bb_label{i} time_stamp]}]); 
            
            len = length(handles.stim_2_play); % how many stim
            len_ctr = (1:len);
        
            handles.time_stamps{len_ctr(i)} = start_time;
        end
      

        disp('STIMULI PLAYED:')
        disp('Broadband noise')
       
        stim_type = handles.stim_type';
        start_times = handles.time_stamps';
        stim_ISI = handles.stim_ISI';
        stim_dur = handles.stim_dur';
        
        saveNum = getappdata(0, 'SaveNum');
        filename = get(handles.save_filename, 'String'); 
        filename = [num2str(saveNum) '_' filename];
        setappdata(0, 'SaveNum', saveNum+1);
        
        
        save(filename, 'stim_type', 'start_times', 'stim_ISI', 'stim_dur');

end

%%

if get(handles.create_puretone, 'Value') == 1

    handles = make_puretone(handles);
    
    while getappdata(0, 'play_stim') == 0
        pause(.001)
    end
        for i = 1:length(handles.stim_2_play)
                  
            sound(handles.stim_2_play{i},fs);
            time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');
            start_time = datestr(now,'HH:MM:SS.FFF AM');
            pause(handles.wait)
            data = get(logGUI.log, 'String');
            set(logGUI.log, 'String', [data; {[handles.pt_label{i} time_stamp]}]);  
        
            len = length(handles.stim_2_play); % how many stim
            len_ctr = (1:len);
        
            handles.time_stamps{len_ctr(i)} = start_time;
        
        end
      

        disp('STIMULI PLAYED:')
        disp('Pure tone(s)')
        
        % % % FOR SAVING % % %
        
        first_play = getappdata(0, 'first_play');
        
        stim_type = handles.stim_type';
        start_times = handles.time_stamps';
        stim_ISI = handles.stim_ISI';
        stim_dur = handles.stim_dur';
        
        if first_play == 1
            stim_cell = cell(10000,0);
            start_cell = cell(10000,0);
            ISI_cell = cell(10000,0);
            dur_cell = cell(10000,0);
            
            for i = 1:length(stim_type)
                stim_cell{i} = stim_type{i};
                start_cell{i} = start_times{i};
                ISI_cell{i} = stim_ISI{i};
                dur_cell{i} = stim_dur{i};
            end
                
                setappdata(0, 'stim_cell', stim_cell');
                setappdata(0, 'start_cell', start_cell');
                setappdata(0, 'ISI_cell', ISI_cell');
                setappdata(0, 'dur_cell', dur_cell');
                
        else
            len_prev = length(getappdata(0,'stim_cell'));
            start_ind = len_prev + 1;
            
            len_curr = length(stim_type);
            end_ind = len_prev + len_curr;
            
            stim_cell = getappdata(0, 'stim_cell');
            start_cell = getappdata(0, 'start_cell');
            ISI_cell = getappdata(0, 'ISI_cell');
            dur_cell = getappdata(0, 'dur_cell');
            
            ctr = 1;
            
            
            for i = start_ind:end_ind
                
                stim_cell{i} = [];
                start_cell{i} = [];
                ISI_cell{i} = [];
                dur_cell{i} = [];
                
                stim_cell{i} = stim_type{ctr};
                start_cell{i} = start_times{ctr};
                ISI_cell{i} = stim_ISI{ctr};
                dur_cell{i} = stim_dur{ctr};
           
                ctr = ctr + 1;
            
            end
            
            setappdata(0, 'stim_cell', stim_cell);
            setappdata(0, 'start_cell', start_cell);
            setappdata(0, 'ISI_cell', ISI_cell);
            setappdata(0, 'dur_cell', dur_cell);
        
        end
        
        setappdata(0, 'first_play', 0);

        
        %saveNum = getappdata(0, 'SaveNum');
        filename = get(handles.save_filename, 'String'); 
        %filename = [num2str(saveNum) '_' filename];
        %setappdata(0, 'SaveNum', saveNum+1); 
        
        stim_type = getappdata(0, 'stim_cell');
        start_times = getappdata(0, 'start_cell');
        stim_ISI = getappdata(0, 'ISI_cell');
        stim_dur = getappdata(0, 'dur_cell');
        
        save(filename, 'stim_type', 'start_times', 'stim_ISI', 'stim_dur');


end

%%

if get(handles.create_nbnoise, 'Value') == 1
    
    handles = make_nbnoise(handles);
    if rando
       rand_array = randperm(length(handles.stim_2_play)); 
    end
    
    while getappdata(0, 'play_stim') == 0
        pause(.001)
    end
    
    for i = 1:length(handles.stim_2_play)

            
            if rando
                sound(handles.stim_2_play{rand_array(i)},fs)
                time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');
                start_time = datestr(now,'HH:MM:SS.FFF AM');
            else
                sound(handles.stim_2_play{i},fs);
                time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');
                start_time = datestr(now,'HH:MM:SS.FFF AM');
            end
            
           
            pause(handles.wait)
            data = get(logGUI.log, 'String');
            
            if rando
                set(logGUI.log, 'String', [data; {[handles.nb_label{rand_array(i)} time_stamp]}]);  
            else
                set(logGUI.log, 'String', [data; {[handles.nb_label{i} time_stamp]}]);  
            end
            
            
            len = length(handles.stim_2_play); % how many stim
            len_ctr = (1:len);
        
            handles.time_stamps{len_ctr(i)} = start_time;
            
    end
      
        disp('STIMULI PLAYED:')
        disp('Narrowband noise')
        
        stim_type = handles.stim_type';
        start_times = handles.time_stamps';
        stim_ISI = handles.stim_ISI';
        stim_dur = handles.stim_dur';
        
        saveNum = getappdata(0, 'SaveNum');
        filename = get(handles.save_filename, 'String'); 
        filename = [num2str(saveNum) '_' filename];
        setappdata(0, 'SaveNum', saveNum+1);
        
        save(filename, 'stim_type', 'start_times', 'stim_ISI', 'stim_dur');

        handles.stim_2_play = [];
    
    
end



% --- Executes on button press in play_stim.
function play_stim_Callback(hObject, eventdata, handles)
% hObject    handle to play_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    setappdata(0, 'play_stim', 1)
end

% --- Executes on button press in create_tones.
function create_tones_Callback(hObject, eventdata, handles)
% hObject    handle to create_tones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of create_tones

set(handles.force_steps,'Value',0);
set(handles.const_freq,'enable','off');
set(handles.bandwidth,'enable','off');
set(handles.octaves_check,'enable','off');

if get(hObject, 'Value') == 0 
    set(handles.const_freq,'enable','on');
    set(handles.bandwidth,'enable','on');
    set(handles.octaves_check,'enable','on');
end

% --- Executes on button press in create_bbnoise.
function create_bbnoise_Callback(hObject, eventdata, handles)
% hObject    handle to create_bbnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of create_bbnoise

set(handles.freq_range_low,'String','');
set(handles.freq_range_high,'String','');
set(handles.step_number,'String','');
set(handles.force_steps,'Value',0);
set(handles.const_freq,'String','');

set(handles.freq_range_low,'enable','off');
set(handles.freq_range_high,'enable','off');
set(handles.step_number,'enable','off');
set(handles.force_steps,'enable','off');
set(handles.const_freq,'enable','off');
set(handles.bandwidth,'enable','off');
set(handles.octaves_check,'enable','off');

if get(hObject, 'Value') == 0 
    
    set(handles.freq_range_low,'enable','on');
    set(handles.freq_range_high,'enable','on');
    set(handles.step_number,'enable','on');
    set(handles.force_steps,'enable','on');
    set(handles.const_freq,'enable','on');
    set(handles.bandwidth,'enable','on');
    set(handles.octaves_check,'enable','on');
    
end



% --- Executes on button press in create_nbnoise.
function create_nbnoise_Callback(hObject, eventdata, handles)
% hObject    handle to create_nbnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of create_nbnoise



set(handles.const_freq,'String','');

set(handles.const_freq,'enable','off');
set(handles.force_steps,'enable','off');
set(handles.sam_high, 'enable', 'on');
set(handles.bandwidth, 'enable', 'off');
set(handles.octaves_check, 'enable', 'off');
set(handles.step_number, 'enable', 'off');

if get(hObject, 'Value') == 0 
    
    set(handles.const_freq,'enable','on');
    set(handles.force_steps,'enable','on');
    set(handles.bandwidth, 'enable', 'on');
    set(handles.octaves_check, 'enable', 'on');
    set(handles.step_number, 'enable', 'on');

end



function num_repeats_Callback(hObject, eventdata, handles)
% hObject    handle to num_repeats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_repeats as text
%        str2double(get(hObject,'String')) returns contents of num_repeats as a double


% --- Executes during object creation, after setting all properties.
function num_repeats_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_repeats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function const_freq_Callback(hObject, eventdata, handles)
% hObject    handle to const_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of const_freq as text
%        str2double(get(hObject,'String')) returns contents of const_freq as a double


% --- Executes during object creation, after setting all properties.
function const_freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to const_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in force_steps.
function force_steps_Callback(hObject, eventdata, handles)
% hObject    handle to force_steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of force_steps


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.freq_range_low,'String','');
set(handles.freq_range_high,'String','');
set(handles.step_number,'String','');
set(handles.const_freq,'String','');
set(handles.sam,'String','');
set(handles.duration,'String','');
set(handles.ISI,'String','');
set(handles.num_repeats,'String','');
set(handles.bandwidth, 'String', '');
set(handles.sam_high, 'String', '');

set(handles.force_steps,'Value',0);
set(handles.create_nbnoise,'Value',0);
set(handles.create_bbnoise,'Value',0);
set(handles.create_tones,'Value',0);
set(handles.create_puretone,'Value',0);
set(handles.octaves_check, 'Value', 0);
set(handles.vary_nbnoise, 'Value', 0);
set(handles.vary_sam, 'Value', 0);
set(handles.randomize, 'Value', 0);

set(handles.freq_range_low,'enable','on');
set(handles.freq_range_high,'enable','on');
set(handles.step_number,'enable','on');
set(handles.const_freq,'enable','on');
set(handles.force_steps,'enable','on');

clear handles.stim_2_play


% --- Executes on button press in create_puretone.
function create_puretone_Callback(hObject, eventdata, handles)
% hObject    handle to create_puretone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of create_puretone

set(handles.freq_range_low,'String','');
set(handles.freq_range_high,'String','');
set(handles.step_number,'String','');
set(handles.force_steps,'Value',0);
set(handles.const_freq,'String','');

set(handles.freq_range_low,'enable','off');
set(handles.freq_range_high,'enable','off');
set(handles.step_number,'enable','off');
set(handles.force_steps,'enable','off');
set(handles.bandwidth,'enable','off');
set(handles.octaves_check,'enable','off');

if get(hObject, 'Value') == 0 
    
    set(handles.freq_range_low,'enable','on');
    set(handles.freq_range_high,'enable','on');
    set(handles.step_number,'enable','on');
    set(handles.force_steps,'enable','on');
    set(handles.const_freq,'String','');
    set(handles.bandwidth,'enable','on');
    set(handles.octaves_check,'enable','on');
    
    
end



function bandwidth_Callback(hObject, eventdata, handles)
% hObject    handle to bandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bandwidth as text
%        str2double(get(hObject,'String')) returns contents of bandwidth as a double


% --- Executes during object creation, after setting all properties.
function bandwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in octaves_check.
function octaves_check_Callback(hObject, eventdata, handles)
% hObject    handle to octaves_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of octaves_check


% --- Executes on button press in upload_stim.
function upload_stim_Callback(hObject, eventdata, handles)
% hObject    handle to upload_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stim_list()
stimListGUI = getappdata(0,'stim_list');
[wavfiles, dir_name] = uigetfile('*.wav; *.WAV','Select files', 'MultiSelect', 'on');
setappdata(0,'dir_name',dir_name)
 
% 	if(ischar(dir_name))
%     	wavfiles = dir(fullfile(dir_name, '*.wav'));
%     end
    
set(stimListGUI.stim_list, 'String', wavfiles, 'Value',1);
setappdata(0, 'wav_names', wavfiles);


for i=1:numel(wavfiles)
    wavs(i) = cellstr(fullfile(dir_name, char(wavfiles(i))));
end
	
setappdata(0, 'wavs', wavs);
  


% --- Executes on button press in randomize.
function randomize_Callback(hObject, eventdata, handles)
% hObject    handle to randomize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of randomize


% --- Executes on button press in vary_sam.
function vary_sam_Callback(hObject, eventdata, handles)
% hObject    handle to vary_sam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vary_sam
if get(hObject, 'Value') == 1
    set(handles.sam_high, 'enable', 'on');
else
    set(handles.sam_high, 'enable', 'off');
end

function sam_high_Callback(hObject, eventdata, handles)
% hObject    handle to sam_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sam_high as text
%        str2double(get(hObject,'String')) returns contents of sam_high as a double


% --- Executes during object creation, after setting all properties.
function sam_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sam_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in vary_nbnoise.
function vary_nbnoise_Callback(hObject, eventdata, handles)
% hObject    handle to vary_nbnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vary_nbnoise

set(handles.freq_range_high, 'enable', 'off');
set(handles.freq_range_txt, 'String', 'Start Center Freq:');
set(handles.bandwidth, 'enable', 'on');
set(handles.octaves_check, 'enable', 'on');
set(handles.step_number, 'enable', 'on');

if get(hObject, 'Value') == 0
    
    set(handles.freq_range_txt, 'String', 'Frequency Range:');
    set(handles.freq_range_high, 'enable', 'on');
    set(handles.bandwidth, 'enable', 'off');
    set(handles.octaves_check, 'enable', 'off');
    set(handles.step_number, 'enable', 'off');
    
end



function save_filename_Callback(hObject, eventdata, handles)
% hObject    handle to save_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of save_filename as text
%        str2double(get(hObject,'String')) returns contents of save_filename as a double


% --- Executes during object creation, after setting all properties.
function save_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to save_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
