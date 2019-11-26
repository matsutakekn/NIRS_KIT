function varargout = Data_Viewer(varargin)
% DATA_VIEWER MATLAB code for Data_Viewer.fig
%      DATA_VIEWER, by itself, creates a new DATA_VIEWER or raises the existing
%      singleton*.
%
%      H = DATA_VIEWER returns the handle to a new DATA_VIEWER or the handle to
%      the existing singleton*.
%
%      DATA_VIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_VIEWER.M with the given input arguments.
%
%      DATA_VIEWER('Property','Value',...) creates a new DATA_VIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_Viewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_Viewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_Viewer

% Last Modified by GUIDE v2.5 22-Oct-2019 14:52:42

% Begin initialization code - DO NOT EDIT


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_Viewer_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_Viewer_OutputFcn, ...
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


% --- Executes just before Data_Viewer is made visible.
function Data_Viewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_Viewer (see VARARGIN)

% Choose default command line output for Data_Viewer
handles.output = hObject;

global Probe2D;
Probe2D={};

global newaxes;
newaxes={};

global ax2;
ax2=[];

set(handles.add_design_mat,'visible','off');
set(handles.design_mat_path,'visible','off');
set(handles.diffcondbox,'visible','off');

handles.UnitStat=1;
handles.DesTpStat=1;

handles.condi_num=0;
usd=cell(3,1);

set(handles.Task_Opt_Pannel,'userdata',usd);

set(handles.step_segment,'value',1);
set(handles.step_detrend,'value',2);
set(handles.step_bandpassfilter,'value',3);

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes Data_Viewer wait for user response (see UIRESUME)
% uiwait(handles.viewer);


% --- Outputs from this function are returned to the command line.
function varargout = Data_Viewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function datasource_Callback(hObject, eventdata, handles)
% hObject    handle to datasource (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of datasource as text
%        str2double(get(hObject,'String')) returns contents of datasource as a double


% --- Executes during object creation, after setting all properties.
function datasource_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datasource (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in savedata.
function selectdata_Callback(hObject, eventdata, handles)
% hObject    handle to savedata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.mat');
dataImformation.source = fullfile(pathname,filename);
if ischar(filename)
    set(handles.viewer,'userdata',dataImformation);
    NR_DataViewer_set(handles);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
end



% freqData=abs(fft(timeData));
% plot(handles.axesfreqspectrum,freqData);

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function system_Callback(hObject, eventdata, handles)
% hObject    handle to system (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of system as text
%        str2double(get(hObject,'String')) returns contents of system as a double


% --- Executes during object creation, after setting all properties.
function system_CreateFcn(hObject, eventdata, handles)
% hObject    handle to system (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in downsample.
function downsample_Callback(hObject, eventdata, handles)
% hObject    handle to downsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of downsample


% --- Executes on button press in detrend.
function detrend_Callback(hObject, eventdata, handles)
% hObject    handle to detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of detrend


% --- Executes on button press in bandpassfilter.
function bandpassfilter_Callback(hObject, eventdata, handles)
% hObject    handle to bandpassfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bandpassfilter


% --- Executes on button press in segment.
function segment_Callback(hObject, eventdata, handles)
% hObject    handle to segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of segment


% --- Executes on selection change in step_segment.
function step_segment_Callback(hObject, eventdata, handles)
% hObject    handle to step_segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns step_segment contents as cell array
%        contents{get(hObject,'Value')} returns selected item from step_segment


% --- Executes during object creation, after setting all properties.
function step_segment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in step_detrend.
function step_detrend_Callback(hObject, eventdata, handles)
% hObject    handle to step_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');

% Hints: contents = cellstr(get(hObject,'String')) returns step_detrend contents as cell array
%        contents{get(hObject,'Value')} returns selected item from step_detrend


% --- Executes during object creation, after setting all properties.
function step_detrend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in step_bandpassfilter.
function step_bandpassfilter_Callback(hObject, eventdata, handles)
% hObject    handle to step_bandpassfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');
% Hints: contents = cellstr(get(hObject,'String')) returns step_bandpassfilter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from step_bandpassfilter


% --- Executes during object creation, after setting all properties.
function step_bandpassfilter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_bandpassfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in step_downsample.
function step_downsample_Callback(hObject, eventdata, handles)
% hObject    handle to step_downsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns step_downsample contents as cell array
%        contents{get(hObject,'Value')} returns selected item from step_downsample


% --- Executes during object creation, after setting all properties.
function step_downsample_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_downsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in view.
function view_Callback(hObject, eventdata, handles)
NR_drawPreprocessed(handles);



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to originalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalT as text
%        str2double(get(hObject,'String')) returns contents of originalT as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function newT_Callback(hObject, eventdata, handles)
% hObject    handle to newT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of newT as text
%        str2double(get(hObject,'String')) returns contents of newT as a double


% --- Executes during object creation, after setting all properties.
function newT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runfilter.
function runfilter_Callback(hObject, eventdata, handles)
% hObject    handle to runfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function bandlow_Callback(hObject, eventdata, handles)
% hObject    handle to bandlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');
% Hints: get(hObject,'String') returns contents of bandlow as text
%        str2double(get(hObject,'String')) returns contents of bandlow as a double


% --- Executes during object creation, after setting all properties.
function bandlow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bandhigh_Callback(hObject, eventdata, handles)
% hObject    handle to bandhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');
% Hints: get(hObject,'String') returns contents of bandhigh as text
%        str2double(get(hObject,'String')) returns contents of bandhigh as a double


% --- Executes during object creation, after setting all properties.
function bandhigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');
% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double


% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rundetrend.
function rundetrend_Callback(hObject, eventdata, handles)
% hObject    handle to rundetrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function leftseg_Callback(hObject, eventdata, handles)
% hObject    handle to leftseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');
% Hints: get(hObject,'String') returns contents of leftseg as text
%        str2double(get(hObject,'String')) returns contents of leftseg as a double


% --- Executes during object creation, after setting all properties.
function leftseg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to leftseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rightseg_Callback(hObject, eventdata, handles)
% hObject    handle to rightseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');
% Hints: get(hObject,'String') returns contents of rightseg as text
%        str2double(get(hObject,'String')) returns contents of rightseg as a double


% --- Executes during object creation, after setting all properties.
function rightseg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rightseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runseg.
function runseg_Callback(hObject, eventdata, handles)
% hObject    handle to runseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function subject_Callback(hObject, eventdata, handles)
% hObject    handle to subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subject as text
%        str2double(get(hObject,'String')) returns contents of subject as a double


% --- Executes during object creation, after setting all properties.
function subject_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in oxy.
function oxy_Callback(hObject, eventdata, handles)
if get(handles.multipleMode,'value') == 1
    set(handles.oxy,'value',1)
    set(handles.dxy,'value',0)
    set(handles.total,'value',0)
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);

% --- Executes on button press in dxy.
function dxy_Callback(hObject, eventdata, handles)
if get(handles.multipleMode,'value') == 1
    set(handles.oxy,'value',0)
    set(handles.dxy,'value',1)
    set(handles.total,'value',0)
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);

% --- Executes on button press in total.
function total_Callback(hObject, eventdata, handles)
if get(handles.multipleMode,'value') == 1
    set(handles.oxy,'value',0)
    set(handles.dxy,'value',0)
    set(handles.total,'value',1)
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on selection change in singleMode.
function singleMode_Callback(hObject, eventdata, handles)
% hObject    handle to singleMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns singleMode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from singleMode
set(handles.singleMode,'value',1);
set(handles.multipleMode,'value',0);
set(handles.mean,'enable','off');
set(handles.meanOnly,'enable','off');
set(handles.increaseCh,'enable','on');
set(handles.decreaseCh,'enable','on');
set(handles.allChannel,'enable','off');
handles_button = get(handles.channelPanel,'userdata');
N = length(handles_button);
if get(handles.singleMode,'value') == 1
    for i=1:N
        set(handles_button(i), 'BackgroundColor',[0.941,0.941,0.941]);
    end
    set(handles_button(1), 'BackgroundColor',[0.7,0.7,1]);
    set(handles.channel, 'string','1');
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function singleMode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to singleMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function channel_Callback(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channel as text
%        str2double(get(hObject,'String')) returns contents of channel as a double
K = str2num(get(handles.channel,'string'));
if 1 == get(handles.singleMode,'value') && length(K) > 1
        errordlg('Cannot draw multiple channels in single mode', 'Error');
else
    handles_button = get(handles.channelPanel,'userdata');
    N = length(handles_button);
    for i=1:N
        set(handles_button(i), 'BackgroundColor',[0.941,0.941,0.941]);
    end
    for i=1:length(K)
        set(handles_button(K(i)), 'BackgroundColor',[0.7,0.7,1]);
    end
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
end


% --- Executes during object creation, after setting all properties.
function channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in preprocessed.
function preprocessed_Callback(hObject, eventdata, handles)
% hObject    handle to preprocessed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.multipleMode,'value')==1
    if get(handles.preprocessed,'value')
        set(handles.raw,'value',0);
    end
    if get(handles.raw,'value') == 0 && get(handles.preprocessed,'value') == 0
        set(handles.mean,'value',0);
        set(handles.meanOnly,'value',0);
    end
end    
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function probeSet_Callback(hObject, eventdata, handles)
% hObject    handle to probeSet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of probeSet as text
%        str2double(get(hObject,'String')) returns contents of probeSet as a double


% --- Executes during object creation, after setting all properties.
function probeSet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to probeSet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nch_Callback(hObject, eventdata, handles)
% hObject    handle to nch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nch as text
%        str2double(get(hObject,'String')) returns contents of nch as a double


% --- Executes during object creation, after setting all properties.
function nch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T_Callback(hObject, eventdata, handles)
% hObject    handle to originalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalT as text
%        str2double(get(hObject,'String')) returns contents of originalT as a double


% --- Executes during object creation, after setting all properties.
function T_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in modeSelect.
function modeSelect_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in modeSelect 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over single.
function single_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on key press with focus on single and none of its controls.
function single_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to single (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function modeSelect_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to modeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over channel.
function channel_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on key press with focus on channel and none of its controls.
function channel_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over oxy.
function oxy_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to oxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in multiple.
function multiple_Callback(hObject, eventdata, handles)
set(handles.channel,'enable','on');
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);



function originalT_Callback(hObject, eventdata, handles)
% hObject    handle to originalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalT as text
%        str2double(get(hObject,'String')) returns contents of originalT as a double


% --- Executes during object creation, after setting all properties.
function originalT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over preprocessed.
function preprocessed_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to preprocessed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in singleCh.
function singleCh_Callback(hObject, eventdata, handles)
% hObject    handle to singleCh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Hints: contents = cellstr(get(hObject,'String')) returns singleCh contents as cell array
%        contents{get(hObject,'Value')} returns selected item from singleCh


% --- Executes during object creation, after setting all properties.
function singleCh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to singleCh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in multipleMode.
function multipleMode_Callback(hObject, eventdata, handles)
% hObject    handle to multipleMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.raw,'value',1);
set(handles.preprocessed,'value',0);
set(handles.singleMode,'value',0);
set(handles.multipleMode,'value',1);
set(handles.oxy,'value',1);
set(handles.dxy,'value',0);
set(handles.total,'value',0);
set(handles.mean,'enable','on');
set(handles.meanOnly,'enable','on');
set(handles.increaseCh,'enable','off');
set(handles.decreaseCh,'enable','off');
set(handles.allChannel,'enable','on');
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
handles_button = get(handles.channelPanel,'UserData');
set(handles_button(end-1),'enable','on');

% Update handles structure
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of multipleMode


% --- Executes on button press in resetAxes.
function resetAxes_Callback(hObject, eventdata, handles)
% hObject    handle to resetAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
multiviewMode = questdlg('Are you sure to reset?','Reset confirm','Yes','No','No');
if strcmp(multiviewMode,'Yes')
    NR_DataViewer_set(handles);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
else
end

% --------------------------------------------------------------------
function gridCon_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to gridCon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mean.
function mean_Callback(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.mean,'value')
    set(handles.meanOnly,'value',0)
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);

% --- Executes on button press in meanOnly.
function meanOnly_Callback(hObject, eventdata, handles)
% hObject    handle to meanOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.meanOnly,'value')
    set(handles.mean,'value',0);
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Hint: get(hObject,'Value') returns toggle state of meanOnly

function timeLeft_Callback(hObject, eventdata, handles)
% hObject    handle to timeLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawTimeseries(handles);
% Hints: get(hObject,'String') returns contents of timeLeft as text
%        str2double(get(hObject,'String')) returns contents of timeLeft as a double


% --- Executes during object creation, after setting all properties.
function timeLeft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rangeLeft_Callback(hObject, eventdata, handles)
% hObject    handle to rangeLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawTimeseries(handles);
% Hints: get(hObject,'String') returns contents of rangeLeft as text
%        str2double(get(hObject,'String')) returns contents of rangeLeft as a double


% --- Executes during object creation, after setting all properties.
function rangeLeft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rangeLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in timeMode.
function timeMode_Callback(hObject, eventdata, handles)
% hObject    handle to timeMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.timeMode,'value',1);
set(handles.timeLeft,'enable','on');
set(handles.timeRight,'enable','on');
set(handles.scanMode,'value',0);
set(handles.rangeLeft,'enable','off');
set(handles.rangeRight,'enable','off');
NR_drawTimeseries(handles);
% Hint: get(hObject,'Value') returns toggle state of timeMode


% --- Executes on button press in scanMode.
function scanMode_Callback(hObject, eventdata, handles)
% hObject    handle to scanMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.timeMode,'value',0);
set(handles.timeLeft,'enable','off');
set(handles.timeRight,'enable','off');
set(handles.scanMode,'value',1);
set(handles.rangeLeft,'enable','on');
set(handles.rangeRight,'enable','on');
NR_drawTimeseries(handles);
% Update handles structure
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of scanMode



function timeRight_Callback(hObject, eventdata, handles)
% hObject    handle to timeRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawTimeseries(handles);
% Update handles structure
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of timeRight as text
%        str2double(get(hObject,'String')) returns contents of timeRight as a double


% --- Executes during object creation, after setting all properties.
function timeRight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rangeRight_Callback(hObject, eventdata, handles)
% hObject    handle to rangeRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawTimeseries(handles);
% Update handles structure
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of rangeRight as text
%        str2double(get(hObject,'String')) returns contents of rangeRight as a double


% --- Executes during object creation, after setting all properties.
function rangeRight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rangeRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function viewer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to viewer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function axesfreqspectrum_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axesfreqspectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in rangeType.
function rangeType_Callback(hObject, eventdata, handles)
% hObject    handle to rangeType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.axestimeseries,'userdata');
T = data.raw.T;
global rangeType;
if get(handles.rangeType,'value') == 1
    if(rangeType == 1)
        return;
    end
    if ~isempty(get(handles.rangeLeft,'string'))
        set(handles.rangeLeft,'string',num2str(str2num(get(handles.rangeLeft,'string'))*T));
    end
    if ~isempty(get(handles.rangeRight,'string'))
        set(handles.rangeRight,'string',num2str(str2num(get(handles.rangeRight,'string'))*T));
    end
    rangeType=1;
else
    if(rangeType == 2)
        return;
    end
    if ~isempty(get(handles.rangeLeft,'string'))
        set(handles.rangeLeft,'string',num2str(str2num(get(handles.rangeLeft,'string'))/T));
    end
    if ~isempty(get(handles.rangeRight,'string'))
        set(handles.rangeRight,'string',num2str(str2num(get(handles.rangeRight,'string'))/T));
    end   
    rangeType=2;
end
NR_drawTimeseries(handles);
% Update handles structure
guidata(hObject, handles);

% Hints: contents = cellstr(get(hObject,'String')) returns rangeType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from rangeType


% --- Executes during object creation, after setting all properties.
function rangeType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rangeType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeOnset_Callback(hObject, eventdata, handles)
% hObject    handle to timeOnset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeOnset as text
%        str2double(get(hObject,'String')) returns contents of timeOnset as a double


% --- Executes during object creation, after setting all properties.
function timeOnset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeOnset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeDuration_Callback(hObject, eventdata, handles)
% hObject    handle to timeDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeDuration as text
%        str2double(get(hObject,'String')) returns contents of timeDuration as a double


% --- Executes during object creation, after setting all properties.
function timeDuration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in design.
function design_Callback(hObject, eventdata, handles)
% hObject    handle to design (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of design



% --- Executes on button press in fullLength.
function fullLength_Callback(hObject, eventdata, handles)
% hObject    handle to fullLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.axestimeseries,'userdata');
nirsdataRaw = data.raw;
T = nirsdataRaw.T;
dataLength = size(nirsdataRaw.oxyData,1);
if get(handles.rangeType,'value') == 1  % time range
    set(handles.rangeLeft,'string',T);
    set(handles.rangeRight,'string',dataLength*T);
else  % scan range
    set(handles.rangeLeft,'string',1);
    set(handles.rangeRight,'string',dataLength);
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in applyBlock.
function applyBlock_Callback(hObject, eventdata, handles)
% hObject    handle to applyBlock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.design,'value',1);
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in preprocess.
function preprocess_Callback(hObject, eventdata, handles)
% hObject    handle to preprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

stepA = get(handles.step_segment,'value');
stepB = get(handles.step_detrend,'value');
stepC = get(handles.step_bandpassfilter,'value');
if ~isPreprocessStepValid([stepA,stepB,stepC])
    errordlg('Wrong step setting', 'Error');
else
    set(handles.preprocess,'enable','off');
    set(handles.preprocessed,'enable','on','value',1);
    if 1 == get(handles.multipleMode,'value');
        set(handles.raw,'value',0);
    end
    NR_generate_preprossedData(handles);
    if 1 == get(handles.preprocessed,'value');
        NR_drawTimeseries(handles);
        NR_drawFreqspectrum(handles);
    end
end
% Update handles structure
guidata(hObject, handles);



% --------------------------------------------------------------------
function utilities_Callback(hObject, eventdata, handles)
% hObject    handle to utilities (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in preprocessedOnly.
function preprocessedOnly_Callback(hObject, eventdata, handles)
% hObject    handle to preprocessedOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.preprocessedOnly,'value')
    set(handles.preprocessed,'value',0);
    set(handles.mean,'value',0);
    set(handles.meanOnly,'value',0);
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Hint: get(hObject,'Value') returns toggle state of preprocessedOnly


% --- Executes on button press in rMap.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to rMap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in showPannel.
function showPannel_Callback(hObject, eventdata, handles)
% hObject    handle to showPannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% NIRS_REST_DataViewer_control;
% viewer_control=findobj('Tag','viewer_control');
% viewer_control=guihandles(viewer_control);
% viewer_control_bottonPannel = viewer_control.channelPanel;
% N = str2num(get(handles.nch,'string'));
% Row = floor(N/10);
% ButtonSize=[3/41,0.15];
% LeftbottomPositon=[];
% for i = 1:Row
%     for j = 1:10
%         LeftbottomPositon=[LeftbottomPositon;  (1/41+ButtonSize(1))*(j-1)+ 1/41, 1-0.015-ButtonSize(2)*i];
%     end
% end
% i = Row+1;
% for j = 1:N-10*Row;
%     LeftbottomPositon=[LeftbottomPositon;  (1/41+ButtonSize(1))*(j-1)+ 1/41, 1-0.015-ButtonSize(2)*i];
% end
% handles_button = NR_buttons_create(viewer_control_bottonPannel, viewer_control, LeftbottomPositon, ButtonSize, @NR_viewerControl);
% viewer_control = findobj('Tag','viewer_control');
% if ~isempty(viewer_control)
%     set(handles.singleCh,'enable','off');
%     set(handles.channel,'enable','off');
%     set(handles.mean,'enable','off');
%     set(handles.meanOnly,'enable','off');
%     viewer_control = guihandles(viewer_control);
%     set(viewer_control.oxy,'value',get(handles.oxy,'value'));
%     set(viewer_control.dxy,'value',get(handles.dxy,'value'));
%     set(viewer_control.total,'value',get(handles.total,'value'));
%     set(viewer_control.singleMode,'value',get(handles.singleMode,'value'));
%     set(viewer_control.multipleMode,'value',get(handles.multipleMode,'value'));
%     set(viewer_control.mean,'value',get(handles.mean,'value'));
%     set(viewer_control.meanOnly,'value',get(handles.meanOnly,'value'));
%     set(viewer_control.channelPanel,'UserData',handles_button);
%     if get(handles.singleMode,'value') == 1
%         K = get(handles.singleCh,'value');
%         if ~isempty(K)
%             set(handles_button(K),'ForegroundColor',[1,0,0]);    
%         end
%     else
%         K = str2num(get(handles.channel,'string'));
%         if ~isempty(K)
%             for i=1:length(K)
%                 set(handles_button(i),'ForegroundColor',[1,0,0]);    
%             end
%         end
%     end
% end


% --------------------------------------------------------------------
function saveData_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to saveData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function selectData_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to selectData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentDir = get(handles.selectData,'userdata');
if isempty(currentDir)
    [filename,pathname] = uigetfile('*.mat');
else
    [filename,pathname] = uigetfile(fullfile(currentDir,'*.mat'));
end
dataSource = [pathname filename];
if ischar(filename)
    set(handles.selectData,'userdata',pathname);
    set(handles.viewer,'userdata',dataSource);
    NR_DataViewer_set(handles);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
    set(handles.increaseCh,'enable','on');
    set(handles.decreaseCh,'enable','on');
    set(handles.allChannel,'enable','off');
    if(strcmp(get(handles.axestimeseries,'XGrid'),'on'))
        grid(handles.axestimeseries,'on');
        grid(handles.axesfreqspectrum,'on');
    else 
        grid(handles.axestimeseries,'off');
        grid(handles.axesfreqspectrum,'off');
    end
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in raw.
function raw_Callback(hObject, eventdata, handles)
% hObject    handle to raw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.multipleMode,'value')==1
    if get(handles.raw,'value') == 1
        set(handles.preprocessed,'value',0);
    end
    if get(handles.raw,'value') == 0 && get(handles.preprocessed,'value') == 0
        set(handles.mean,'value',0);
        set(handles.meanOnly,'value',0);
    end
end
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Hint: get(hObject,'Value') returns toggle state of raw
% Update handles structure
guidata(hObject, handles);


% --- Executes on mouse press over figure background.
function viewer_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to viewer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axestimeseries_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axestimeseries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function viewerHelp_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to viewerHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --------------------------------------------------------------------
function gridControl_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to gridControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.axestimeseries,'XGrid'),'on'))
    grid(handles.axestimeseries,'off');
    grid(handles.axesfreqspectrum,'off');
else
    set(handles.axestimeseries,'XGrid','on');
    set(handles.axesfreqspectrum,'XGrid','on','XMinorGrid','on','XMinorTick','on');
end


% --- Executes on key press with focus on rangeRight and none of its controls.
function rangeRight_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to rangeRight (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over rangeRight.
function rangeRight_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to rangeRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on order and none of its controls.
function order_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');


% --- Executes on key press with focus on rangeLeft and none of its controls.
function rangeLeft_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to rangeLeft (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');


% --- Executes on key press with focus on bandlow and none of its controls.
function bandlow_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to bandlow (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');


% --- Executes on key press with focus on bandhigh and none of its controls.
function bandhigh_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to bandhigh (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.preprocess,'enable','on');


% --------------------------------------------------------------------
function reColor_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to reColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if 1 == get(handles.multipleMode,'value')
    data = get(handles.axestimeseries,'userdata');
    color = data.color;
    n = size(color,1);
    s = randperm(n);
    for i = 1:n
        newcolor(i,:) = color(s(i),:);
    end
    data.color = newcolor;
    set(handles.axestimeseries,'UserData',data);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in allChannel.
function allChannel_Callback(hObject, eventdata, handles)
% hObject    handle to allChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_channelControl_all(handles);
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in clearChannel.
function clearChannel_Callback(hObject, eventdata, handles)
% hObject    handle to clearChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
usd=get(handles.Task_Opt_Pannel,'userdata');
usercond=usd{1,1};

if ~isempty(usercond)
    usd{1,1}=[];
    set(handles.Task_Opt_Pannel,'userdata',usd);
    set(handles.cond_listbox,'value',[]);
    set(handles.diffcondbox,'value',[]);
end
NR_channelControl_clear(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in increaseCh.
function increaseCh_Callback(hObject, eventdata, handles)
% hObject    handle to increaseCh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_channelControl_increase(handles);

% --- Executes on button press in decreaseCh.
function decreaseCh_Callback(hObject, eventdata, handles)
% hObject    handle to decreaseCh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_channelControl_decrease(handles);



function ylimAxesf_Callback(hObject, eventdata, handles)
% hObject    handle to ylimAxesf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NR_drawFreqspectrum(handles);
% Hints: get(hObject,'String') returns contents of ylimAxesf as text
%        str2double(get(hObject,'String')) returns contents of ylimAxesf as a double


% --- Executes during object creation, after setting all properties.
function ylimAxesf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylimAxesf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in step_segment.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to step_segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns step_segment contents as cell array
%        contents{get(hObject,'Value')} returns selected item from step_segment


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close viewer.
function viewer_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to viewer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global Probe2D;
% Hint: delete(hObject) closes the figure
delete(hObject);


% --------------------------------------------------------------------
function legnedControl_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to legnedControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
legend(handles.axestimeseries,'toggle');
global newaxes;
legend(newaxes,'toggle');


% --- Executes on button press in addpath.
function addpath_Callback(hObject, eventdata, handles)
% hObject    handle to addpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% =========================================================================
inpath=uigetdir; 

if ischar(inpath)
    sublist=dir(fullfile(inpath,'*.mat'));
    for n=1:length(sublist)
        subname{n}=sublist(n).name(1:end-4);
    end
    set(handles.addpath,'userdata',inpath);
    set(handles.sublistbox,'string',subname);
    
    subfile=fullfile(inpath,[subname{1},'.mat']);
    set(handles.viewer,'UserData',subfile);
    
    NR_DataViewer_set(handles);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
end
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sublistbox.
function sublistbox_Callback(hObject, eventdata, handles)
% hObject    handle to sublistbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns sublistbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sublistbox

% =========================================================================
subid=get(handles.sublistbox,'value');
subname=get(handles.sublistbox,'string');

inpath=get(handles.addpath,'userdata');

if ischar(inpath)
    if subid
        subfile=fullfile(inpath,[subname{subid},'.mat']);
        set(handles.viewer,'UserData',subfile);
        
        NR_DataViewer_set(handles);
        NR_drawTimeseries(handles);
        NR_drawFreqspectrum(handles);
    end
end
% Update handles structure
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sublistbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sublistbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function channelPanel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in addprobeset.
function addprobeset_Callback(hObject, eventdata, handles)
% hObject    handle to addprobeset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% =========================================================================
defaultSaveDir = which('NIRS_KIT');
index_dir=fileparts(defaultSaveDir);
defaultSetDir=fullfile(index_dir,'Sample_Data','Temp_2D_ProbeSet');
[filename, pathname] = uigetfile(fullfile(defaultSetDir,'*.mat'));

if ischar(filename)
    probepath=fullfile(pathname,filename); 
    load(probepath);
    global Probe2D;
    Probe2D=probeSets;
    
    NR_DataViewer_set(handles);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in clearprobeset.
function clearprobeset_Callback(hObject, eventdata, handles)
% hObject    handle to clearprobeset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Probe2D;
 Probe2D={};
 
NR_DataViewer_set(handles);
NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes when uipanel25 is resized.
function uipanel25_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function axestimeseries_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axestimeseries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axestimeseries


% --- Executes on button press in addcondition.
function addcondition_Callback(hObject, eventdata, handles)
% hObject    handle to addcondition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  inpath=get(handles.addpath,'userdata');
  sublist=get(handles.sublistbox,'string');
  if isempty(sublist)
      msgbox('There is no data!  Please add your data folder', 'Lock of subdata');
  elseif ~isempty(sublist)
       
       condi_num=handles.condi_num+1;
       [name,onset,duration]=inputcondinf(condi_num);
       
       if ~isempty(name) && ~isempty(onset) && ~isempty(duration)
           userdata{1,1}=['Condition (',num2str(condi_num),')'];
           userdata{2,1}=['......Name       ',name];
           userdata{3,1}=['......Onset       [',num2str(onset),']'];
           userdata{4,1}=['......Duration    [',num2str(duration),']'];

           cond_userdata=get(handles.cond_listbox,'userdata');
           if isempty(cond_userdata)
               cond_userdata=userdata;
               usd=get(handles.Task_Opt_Pannel,'userdata');
               usd{2,1}={onset};
               usd{3,1}={duration};
               set( handles.Task_Opt_Pannel,'userdata',usd);

               set(handles.cond_listbox,'userdata',cond_userdata);
               set(handles.cond_listbox,'string',cond_userdata);
               handles.condi_num=handles.condi_num+1;
           else     
               cond_userdata=[cond_userdata;userdata];
               usd=get(handles.Task_Opt_Pannel,'userdata');
               usd{2,1}=[usd{2,1};{onset}];
               usd{3,1}=[usd{3,1};{duration}];
               set( handles.Task_Opt_Pannel,'userdata',usd);
               
               set(handles.cond_listbox,'userdata',cond_userdata);
               set(handles.cond_listbox,'string',cond_userdata);
               handles.condi_num=handles.condi_num+1;
           end
       end
  end
   
% Update handles structure
guidata(hObject, handles);


% --- Executes on selection change in cond_listbox.
function cond_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to cond_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns cond_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cond_listbox
user_id=get(handles.cond_listbox,'value');

if mod(user_id-1,4)==0
    set(handles.cond_listbox,'UIContextMenu',handles.condition_right);
    usd=get(handles.Task_Opt_Pannel,'userdata');
    usd{1,1}=(user_id-1)/4+1;
    set(handles.Task_Opt_Pannel,'userdata',usd); 

    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);        
else
    set(handles.cond_listbox,'UIContextMenu',[]);
end
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function cond_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cond_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DesignType.
function DesignType_Callback(hObject, eventdata, handles)
% hObject    handle to DesignType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns DesignType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DesignType
desigtp=get(handles.DesignType,'value');
usd=cell(3,1);
set(handles.Task_Opt_Pannel,'userdata',usd);


if desigtp==2
    set(handles.addcondition,'visible','off');
    set(handles.cond_listbox,'visible','off');
    set(handles.cond_listbox,'string',[]);

    set(handles.add_design_mat,'visible','on');
    set(handles.design_mat_path,'visible','on');
    set(handles.diffcondbox,'visible','on');
else
    set(handles.add_design_mat,'visible','off');
    set(handles.design_mat_path,'visible','off');
    set(handles.diffcondbox,'visible','off');
    set(handles.design_mat_path,'string',[]);
    set(handles.diffcondbox,'string',[]);
    
    set(handles.addcondition,'visible','on');
    set(handles.cond_listbox,'visible','on');
end

    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function DesignType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DesignType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Units.
function Units_Callback(hObject, eventdata, handles)
% hObject    handle to Units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
% Hints: contents = cellstr(get(hObject,'String')) returns Units contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Units
    global newaxes;
    if ~isempty(newaxes)
        legend(newaxes,'off');
    end
    usd=get(handles.Task_Opt_Pannel,'userdata');
    usd{1,1}=[];
    set(handles.Task_Opt_Pannel,'userdata',usd);
    set(handles.diffcondbox,'value',[]);
    set(handles.cond_listbox,'value',[]);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Units_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_design_mat.
function add_design_mat_Callback(hObject, eventdata, handles)
% hObject    handle to add_design_mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname,fpath] = uigetfile('.mat','Select your Design Inf mat file');
if ischar(fname)
    design_mat=fullfile(fpath,fname);
    load(design_mat);
    
    [n_designmat,~]=size(design_inf);
    n_sublist=get(handles.sublistbox,'string');
    if n_designmat-1==length(n_sublist)
        set(handles.design_mat_path,'string',design_mat);
        conddifstr=design_inf(1,2:end)';
        set(handles.diffcondbox,'string',conddifstr);
        
        subid=get(handles.sublistbox,'value');
        [~,condn]=size(design_inf);
        for jj=1:condn-1
            usd=get(handles.Task_Opt_Pannel,'userdata');
            usd{2,1}{jj,1}=design_inf{subid+1,jj+1}(:,1)';
            usd{3,1}{jj,1}=design_inf{subid+1,jj+1}(:,2)';
            set(handles.Task_Opt_Pannel,'userdata',usd);
        end
    else
        errordlg('The length of your design_inf.mat is unequal to the sub num !!!    Please check !!!','Design inf is wrong!');
    end
end
% Update handles structure
guidata(hObject, handles);


function design_mat_path_Callback(hObject, eventdata, handles)
% hObject    handle to design_mat_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of design_mat_path as text
%        str2double(get(hObject,'String')) returns contents of design_mat_path as a double


% --- Executes during object creation, after setting all properties.
function design_mat_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to design_mat_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function cond_rm_Callback(hObject, eventdata, handles)
% hObject    handle to cond_rm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
userdata=get(handles.cond_listbox,'userdata');
user_id=get(handles.cond_listbox,'value');

    userdata=userdata(setdiff(1:length(userdata),user_id:user_id+3));
    usd=get(handles.Task_Opt_Pannel,'userdata');
    usd{2,1}=usd{2,1}(setdiff(1:handles.condi_num,(user_id-1)./4+1))
    usd{3,1}=usd{3,1}(setdiff(1:handles.condi_num,(user_id-1)./4+1))
    
    if ~isempty(userdata)
        for i=1:handles.condi_num-1
            userdata{(i-1)*4+1,1}=['Condition (',num2str(i),')'];
        end
    end
    handles.condi_num=handles.condi_num-1;
    
    
    set(handles.cond_listbox,'userdata',userdata);
    set(handles.cond_listbox,'value',1);
    set(handles.cond_listbox,'string',userdata);
    

    usd{1,1}=1;
    set(handles.Task_Opt_Pannel,'userdata',usd);
    NR_drawTimeseries(handles);
    NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);

% --------------------------------------------------------------------
function condition_right_Callback(hObject, eventdata, handles)
% hObject    handle to condition_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function [name,onset,duration]=inputcondinf(condi_num)

    condstr=['Design Inf for Condition',num2str(condi_num)];
    condinf=inputdlg({'Condition Name:','Onset:input 5:5:20 or 5 10 15 20','Duration: input a scalar or a vector with the same length of onset'},condstr);
    if isempty(condinf)
        name = '';
        onset = '';
        duration = '';  
    elseif ~isempty(condinf{1}) && ~isempty(condinf{2}) && ~isempty(condinf{3})
        name=condinf{1};

        if ~isempty(strfind(condinf{2},']'))
            condinf{2}=condinf{2}(2:end-1);
        end
        if isempty(strfind(condinf{2},':'))
            onset=str2num(condinf{2});
        else
            onset=eval(condinf{2});
        end
        
        if ~isempty(strfind(condinf{3},']'))
            condinf{3}=condinf{3}(2:end-1);
        end
        if isempty(strfind(condinf{3},':'))
            duration=str2num(condinf{3});
            if length(duration)==1
               duration=ones(1,length(onset))*duration;
            end
        else
            duration=eval(condinf{3});
        end

        if length(duration)~=length(onset)
           errordlg('The num of onset and duration is unequal !!!    Please re-enter !!!','Design inf is wrong!');
           [name,onset,duration]=inputcondinf(condi_num);
        end 
    else
        errordlg('Missing input value !!!    Please re-enter !!!','Design inf is wrong!');
        [name,onset,duration]=inputcondinf(condi_num);
    end
    


% --- Executes on button press in showDesign.
function showDesign_Callback(hObject, eventdata, handles)
% hObject    handle to showDesign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of showDesign

NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);

% Update handles structure
guidata(hObject, handles);



% --- Executes on selection change in diffcondbox.
function diffcondbox_Callback(hObject, eventdata, handles)
% hObject    handle to diffcondbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns diffcondbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from diffcondbox
usd=get(handles.Task_Opt_Pannel,'userdata');
usd{1,1}=get(handles.diffcondbox,'value');
set(handles.Task_Opt_Pannel,'userdata',usd);

NR_drawTimeseries(handles);
NR_drawFreqspectrum(handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function diffcondbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diffcondbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    


% --------------------------------------------------------------------
function zoom_in_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to zoom_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zoom_stat=get(handles.zoom_in,'stat');
global ax2 newaxes;
if strcmp(zoom_stat,'on')
    if ~isempty(ax2) && ~isempty(newaxes)
        linkaxes([handles.axestimeseries,ax2,newaxes],'x');
    end
    zoom on;
else
    if ~isempty(ax2) && ~isempty(newaxes)
        linkaxes([handles.axestimeseries,ax2,newaxes],'off');
    end
    zoom off;
end


% --------------------------------------------------------------------
function hand_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to hand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hand_stat=get(handles.hand,'stat');
global ax2 newaxes;
if strcmp(hand_stat,'on')
    if ~isempty(ax2) && ~isempty(newaxes)
        linkaxes([handles.axestimeseries,ax2,newaxes],'x');
    end
    pan on;
else
    if ~isempty(ax2) && ~isempty(newaxes)
        linkaxes([handles.axestimeseries,ax2,newaxes],'off');
    end
    pan off;
end
