function varargout = DataConvert(varargin)
% DATACONVERT MATLAB code for DataConvert.fig
%      DATACONVERT, by itself, creates a new DATACONVERT or raises the existing
%      singleton*.
%
%      H = DATACONVERT returns the handle to a new DATACONVERT or the handle to
%      the existing singleton*.
%
%      DATACONVERT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATACONVERT.M with the given inputData arguments.
%
%      DATACONVERT('Property','Value',...) creates a new DATACONVERT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataConvert_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataConvert_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataConvert

% Last Modified by GUIDE v2.5 16-Aug-2019 13:48:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataConvert_OpeningFcn, ...
                   'gui_OutputFcn',  @DataConvert_OutputFcn, ...
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


% --- Executes just before DataConvert is made visible.
function DataConvert_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataConvert (see VARARGIN)

% Choose default command line output for DataConvert
handles.output = hObject;

% Update handles structure
% guidata(hObject, handles);
set(handles.isProbe2d,'value',1);
set(handles.addProbe,'enable','on');
set(handles.inpath2d,'enable','on');


% UIWAIT makes DataConvert wait for user response (see UIRESUME)
% uiwait(handles.NR_DataManager);


% --- Outputs from this function are returned to the command line.
function varargout = DataConvert_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in datatype.
function datatype_Callback(hObject, eventdata, handles)
% hObject    handle to datatype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns datatype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from datatype


% --- Executes during object creation, after setting all properties.
function datatype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datatype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inpathData_Callback(hObject, eventdata, handles)
% hObject    handle to inpathData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpathData as text
%        str2double(get(hObject,'String')) returns contents of inpathData as a double


% --- Executes during object creation, after setting all properties.
function inpathData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpathData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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


% --- Executes on button press in inputData.
function inputData_Callback(hObject, eventdata, handles)
% hObject    handle to inputData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% inpathData = uigetdir;
% if ischar(inpathData)
%     set(handles.inpathData,'string',inpathData);  % set input path name
% end
inpathData = get(handles.inpathData,'userdata');
if ~isempty(inpathData)
    inpathData = uigetdir(inpathData);
else
    inpathData = uigetdir;
end
if ischar(inpathData)
    set(handles.inpathData,'string',inpathData);  % set input path name
    set(handles.inpathData,'userdata',inpathData);
end

% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% outpath = uigetdir;
% if ischar(outpath)
%     set(handles.outpath,'string',outpath);  % set input path name
% end
outpath = get(handles.outpath,'userdata');
if ~isempty(outpath)
    outpath = uigetdir(outpath);
else
    outpath = uigetdir;
end
if ischar(outpath)
    set(handles.outpath,'string',outpath);  % set input path name
    set(handles.outpath,'userdata',outpath);
end


% --- Executes on button press in convert.
function convert_Callback(hObject, eventdata, handles)
% hObject    handle to convert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.isProbe2d,'value') && isempty(get(handles.inpath2d,'string'))
    msgbox({'There is no probeset inf !!!';'Please select ... ...'},'Warning','warn');
else
    NR_convert(handles);
end


% --- Executes on button press in isProbe2d.
function isProbe2d_Callback(hObject, eventdata, handles)
% hObject    handle to isProbe2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.isProbe2d,'value')
    set(handles.addProbe,'enable','on');
    set(handles.inpath2d,'enable','on');
else
    set(handles.addProbe,'enable','off');
    set(handles.inpath2d,'enable','off');
    set(handles.inpath2d,'string',[]);
end
% Hint: get(hObject,'Value') returns toggle state of isProbe2d


% --- Executes during object creation, after setting all properties.
function NR_DataManager_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NR_DataManager (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function currentDir_Callback(hObject, eventdata, handles)
% hObject    handle to currentDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of currentDir as text
%        str2double(get(hObject,'String')) returns contents of currentDir as a double


% --- Executes during object creation, after setting all properties.
function currentDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to currentDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inpath3d_Callback(hObject, eventdata, handles)
% hObject    handle to inpath3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpath3d as text
%        str2double(get(hObject,'String')) returns contents of inpath3d as a double


% --- Executes during object creation, after setting all properties.
function inpath3d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpath3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input3d.
function input3d_Callback(hObject, eventdata, handles)
% hObject    handle to input3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RootDirectory = which('NIRS_REST');
index_dir=fileparts(RootDirectory);
defaultDemoDir=fullfile(index_dir,'Sample_Data');
inpath3d = uigetdir(defaultDemoDir);
if ischar(inpath3d)
    set(handles.inpath3d,'string',inpath3d);  % set input path name
end


% --- Executes on button press in diy.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to diy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of diy



function inpath2d_Callback(hObject, eventdata, handles)
% hObject    handle to inpath2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpath2d as text
%        str2double(get(hObject,'String')) returns contents of inpath2d as a double


% --- Executes during object creation, after setting all properties.
function inpath2d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpath2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in addProbe.
function addProbe_Callback(hObject, eventdata, handles)
% hObject    handle to addProbe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RootDirectory = which('NIRS_KIT');
index_dir=fileparts(RootDirectory);
defaultSetDir=fullfile(index_dir,'Sample_Data','Temp_2D_ProbeSet');
[filename, pathname] = uigetfile(fullfile(defaultSetDir,'*.mat'));

if ischar(filename)    
    set(handles.inpath2d,'string',[pathname,filename]);     
end


function inpath2dDiy_Callback(hObject, eventdata, handles)
% hObject    handle to inpath3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpath3d as text
%        str2double(get(hObject,'String')) returns contents of inpath3d as a double


% --- Executes during object creation, after setting all properties.
function inpath2dDiy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpath3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in diy.
function isProbe3d_Callback(hObject, eventdata, handles)
% hObject    handle to diy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.isProbe3d,'value')
    set(handles.add3d,'enable','on');
    set(handles.inpath3d,'enable','on');
else
    set(handles.add3d,'enable','off');
    set(handles.inpath3d,'enable','off');
    set(handles.inpath3d,'string',[]);
end


% --- Executes on button press in add3d.
function add3d_Callback(hObject, eventdata, handles)
% hObject    handle to add3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inpath3d = uigetdir();
if ischar(inpath3d)
    set(handles.inpath3d,'String',inpath3d);
end


% --- Executes on button press in diy.
function diy_Callback(hObject, eventdata, handles)
% hObject    handle to diy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_REST_generate2D(handles);

% Hint: get(hObject,'Value') returns toggle state of diy


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in topoMaker.
function topoMaker_Callback(hObject, eventdata, handles)
% hObject    handle to topoMaker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TopoMaker;


% --- Executes when user attempts to close NR_DataManager.
function NR_DataManager_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to NR_DataManager (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
