function varargout = NIRS_Preprocessing(varargin)
% NIRS_Preprocessing MATLAB code for NIRS_Preprocessing.fig
%      NIRS_Preprocessing, by itself, creates a new NIRS_Preprocessing or raises the existing
%      singleton*.
%
%      H = NIRS_Preprocessing returns the handle to a new NIRS_Preprocessing or the handle to
%      the existing singleton*.
%
%      NIRS_Preprocessing('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NIRS_Preprocessing.M with the given addPath arguments.
%
%      NIRS_Preprocessing('Property','Value',...) creates a new NIRS_Preprocessing or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NIRS_Preprocessing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NIRS_Preprocessing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NIRS_Preprocessing

% Last Modified by GUIDE v2.5 21-Aug-2019 14:55:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NIRS_Preprocessing_OpeningFcn, ...
                   'gui_OutputFcn',  @NIRS_Preprocessing_OutputFcn, ...
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


% --- Executes just before NIRS_Preprocessing is made visible.
function NIRS_Preprocessing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NIRS_Preprocessing (see VARARGIN)
% Choose default command line output for NIRS_Preprocessing
handles.output = hObject;

% UIWAIT makes NIRS_Preprocessing wait for user response (see UIRESUME)
% uiwait(handles.NIRS_Preprocessing);

set(handles.step_segment,'value',1);
set(handles.step_detrend,'value',2);
set(handles.step_bandpassfilter,'value',3);
set(handles.step_downsample,'value',5);

set(handles.leftseg,'string','15');
set(handles.rightseg,'string','15');
set(handles.order,'string','1');
set(handles.bandlow,'string','0.01');
set(handles.bandhigh,'string','0.08');
set(handles.newT,'string','','enable','off');

set(handles.outpath,'string',pwd);
% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = NIRS_Preprocessing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inpath_Callback(hObject, eventdata, handles)
% hObject    handle to inpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpath as text
%        str2double(get(hObject,'String')) returns contents of inpath as a double


% --- Executes during object creation, after setting all properties.
function inpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in addPath.
function addPath_Callback(hObject, eventdata, handles)
% hObject    handle to addPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inpath = uigetdir(pwd);
if ischar(inpath)
    set(handles.inpathList,'string',inpath);
    
    sublist=dir(fullfile(inpath,'*.mat'));
    for n=1:length(sublist)
        subname{n}=sublist(n).name(1:end-4);
    end
    set(handles.fileList,'string',subname);   
end

% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outpath = uigetdir;
if ischar(outpath)
    set(handles.outpath,'string',outpath);  % set outpath name
end



function outpath_Callback(hObject, eventdata, handles)
% hObject    handle to outpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outpath as text
%        str2double(get(hObject,'String')) returns contents of outpath as a double



% --- Executes during object creation, after setting all properties.
function outpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stepA = get(handles.step_segment,'value');
stepB = get(handles.step_detrend,'value');
stepC = get(handles.step_bandpassfilter,'value');
stepD = get(handles.step_downsample,'value');
if ~isPreprocessStepValid([stepA,stepB,stepC,stepD])
    errordlg('Wrong step setting', 'Error');
    return;
end

NR_Preprocessing(handles);


% --- Executes during object creation, after setting all properties.
function NIRS_Preprocessing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NIRS_Preprocessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in generateReport.
function generateReport_Callback(hObject, eventdata, handles)
% hObject    handle to generateReport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of generateReport



% --- Executes on selection change in inpathList.
function inpathList_Callback(hObject, eventdata, handles)
% hObject    handle to inpathList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns inpathList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inpathList


% --- Executes during object creation, after setting all properties.
function inpathList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpathList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fileList.
function fileList_Callback(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fileList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fileList


% --- Executes during object creation, after setting all properties.
function fileList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in step_downsample.
function step_downsample_Callback(hObject, eventdata, handles)
% hObject    handle to step_downsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.step_downsample,'value') == 5
    set(handles.newT,'enable','off');
else
    set(handles.newT,'enable','on');
end
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



function bandlow_Callback(hObject, eventdata, handles)
% hObject    handle to bandlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on selection change in step_bandpassfilter.
function step_bandpassfilter_Callback(hObject, eventdata, handles)
% hObject    handle to step_bandpassfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.step_bandpassfilter,'value') == 5
    set(handles.bandlow,'enable','off');
    set(handles.bandhigh,'enable','off');
else
    set(handles.bandlow,'enable','on');
    set(handles.bandhigh,'enable','on');
end
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



function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on selection change in step_detrend.
function step_detrend_Callback(hObject, eventdata, handles)
% hObject    handle to step_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.step_detrend,'value') == 5
    set(handles.order,'enable','off');
else
    set(handles.order,'enable','on');
end
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



function leftseg_Callback(hObject, eventdata, handles)
% hObject    handle to leftseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on selection change in step_segment.
function step_segment_Callback(hObject, eventdata, handles)
% hObject    handle to step_segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.step_segment,'value') == 5
    set(handles.leftseg,'enable','off');
    set(handles.rightseg,'enable','off');
else
    set(handles.leftseg,'enable','on');
    set(handles.rightseg,'enable','on');
end
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


% --- Executes on key press with focus on step_segment and none of its controls.
function step_segment_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to step_segment (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function roichannel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roichannel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to outpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outpath as text
%        str2double(get(hObject,'String')) returns contents of outpath as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in output.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outpath = uigetdir;
if ischar(outpath)
    set(handles.outpath,'string',outpath);  % set outpath name
end

% --- Executes on selection change in inpathList.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to inpathList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns inpathList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inpathList


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpathList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileList as text
%        str2double(get(hObject,'String')) returns contents of fileList as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in alffset.
function alffset_Callback(hObject, eventdata, handles)
% hObject    handle to alffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.alffset,'value')   
    set(handles.fcset,'enable','off');
    set(handles.taskset,'enable','off');
    set(handles.customset,'enable','off');
    
    set(handles.step_bandpassfilter,'value',5);
    set(handles.bandlow,'string','');
    set(handles.bandhigh,'string','');
    set(handles.bandlow,'enable','off');
    set(handles.bandhigh,'enable','off');
else
    set(handles.fcset,'enable','on');
    set(handles.taskset,'enable','on');
    set(handles.customset,'enable','on');
    
    set(handles.step_bandpassfilter,'value',3);
    set(handles.bandlow,'enable','on');
    set(handles.bandhigh,'enable','on');
    set(handles.bandlow,'string','0.01');
    set(handles.bandhigh,'string','0.08');
end

% Hint: get(hObject,'Value') returns toggle state of alffset


% --- Executes on button press in fcset.
function fcset_Callback(hObject, eventdata, handles)
% hObject    handle to fcset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.fcset,'value')
    set(handles.alffset,'enable','off');
    set(handles.taskset,'enable','off');
    set(handles.customset,'enable','off');
else
    set(handles.alffset,'enable','on');
    set(handles.taskset,'enable','on'); 
    set(handles.customset,'enable','on');
end

% Hint: get(hObject,'Value') returns toggle state of fcset


% --- Executes on button press in taskset.
function taskset_Callback(hObject, eventdata, handles)
% hObject    handle to taskset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.taskset,'value')
    set(handles.alffset,'enable','off');
    set(handles.fcset,'enable','off');
    set(handles.customset,'enable','off');
    
    set(handles.step_segment,'value',5);
    set(handles.leftseg,'string','');
    set(handles.rightseg,'string','');
    set(handles.leftseg,'enable','off');
    set(handles.rightseg,'enable','off');
    
    set(handles.step_detrend,'value',1);
    set(handles.step_bandpassfilter,'value',2);
    
    set(handles.bandlow,'string',[]);
    set(handles.bandhigh,'string',[]);
else
    set(handles.alffset,'enable','on');
    set(handles.fcset,'enable','on');
    set(handles.customset,'enable','on');
    
    set(handles.step_segment,'value',1);
    set(handles.leftseg,'enable','on');
    set(handles.rightseg,'enable','on');
    set(handles.leftseg,'string','15');
    set(handles.rightseg,'string','15');
    set(handles.step_detrend,'value',2);
    set(handles.step_bandpassfilter,'value',3);
    set(handles.bandlow,'string','0.01');
    set(handles.bandhigh,'string','0.08');
end

% Hint: get(hObject,'Value') returns toggle state of taskset


% --- Executes on button press in customset.
function customset_Callback(hObject, eventdata, handles)
% hObject    handle to customset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.customset,'value')
    set(handles.alffset,'enable','off');
    set(handles.fcset,'enable','off');
    set(handles.taskset,'enable','off');
else
    set(handles.alffset,'enable','on');
    set(handles.fcset,'enable','on');
    set(handles.taskset,'enable','on'); 
end
% Hint: get(hObject,'Value') returns toggle state of customset
