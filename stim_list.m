function varargout = stim_list(varargin)
% STIM_LIST MATLAB code for stim_list.fig
%      STIM_LIST, by itself, creates a new STIM_LIST or raises the existing
%      singleton*.
%
%      H = STIM_LIST returns the handle to a new STIM_LIST or the handle to
%      the existing singleton*.
%
%      STIM_LIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STIM_LIST.M with the given input arguments.
%
%      STIM_LIST('Property','Value',...) creates a new STIM_LIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stim_list_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stim_list_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stim_list

% Last Modified by GUIDE v2.5 28-Aug-2015 14:09:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stim_list_OpeningFcn, ...
                   'gui_OutputFcn',  @stim_list_OutputFcn, ...
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


% --- Executes just before stim_list is made visible.
function stim_list_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stim_list (see VARARGIN)

% Choose default command line output for stim_list
handles.output = hObject;


setappdata(0,'stim_list', handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stim_list wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stim_list_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in stim_list.
function stim_list_Callback(hObject, eventdata, handles)
% hObject    handle to stim_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns stim_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from stim_list


% --- Executes during object creation, after setting all properties.
function stim_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stim_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in randomize_stim.
function randomize_stim_Callback(hObject, eventdata, handles)
% hObject    handle to randomize_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

wavfiles = getappdata(0, 'wav_names');
dir_name = getappdata(0, 'dir_name');
  len = length(wavfiles);
    rand_list = cell(1,len);
	for i=1:len
    	index = ceil(rand*length(wavfiles));
        rand_list{i} = wavfiles{index};
        wavfiles(index) = [];
	end
set(handles.stim_list, 'String', rand_list, 'Value',1);

for i=1:numel(rand_list)
    wavs(i) = cellstr(fullfile(dir_name, char(rand_list(i))));
end

setappdata(0, 'wavs', wavs);

set(handles.randomize_stim, 'enable', 'off');


% --- Executes on button press in broadcast.
function broadcast_Callback(hObject, eventdata, handles)
% hObject    handle to broadcast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs =44100;
wavs = getappdata(0, 'wavs');
wavnames = getappdata(0, 'wav_names');
logGUI = getappdata(0, 'logGUI');
ISI = str2double(get(handles.ISI_box, 'String'));
if isnan(ISI)
    ISI=0;
end
for i = 1:length(wavs)
            y = wavread(wavs{i});
            time_stamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');       
            sound(y,fs);
            pause((length(y)/fs)+(ISI/1000));
            dur = (length(y)/fs)*1000; %ms
            data = get(logGUI.log, 'String');
            stim_str = sprintf('%s: [%d ms dur / %d ms ISI] ', char(wavnames(i)), dur, ISI);
            set(logGUI.log, 'String', [data; {[stim_str time_stamp]}]); 
end



function ISI_box_Callback(hObject, eventdata, handles)
% hObject    handle to ISI_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ISI_box as text
%        str2double(get(hObject,'String')) returns contents of ISI_box as a double


% --- Executes during object creation, after setting all properties.
function ISI_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ISI_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
