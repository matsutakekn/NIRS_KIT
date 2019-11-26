function varargout = NIRS_KIT(varargin)
%NIRS_KIT M-file for NIRS_KIT.fig
%      NIRS_KIT, by itself, creates a new NIRS_KIT or raises the existing
%      singleton*.
%
%      H = NIRS_KIT returns the handle to a new NIRS_KIT or the handle to
%      the existing singleton*.
%
%      NIRS_KIT('Property','Value',...) creates a new NIRS_KIT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to NIRS_KIT_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      NIRS_KIT('CALLBACK') and NIRS_KIT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in NIRS_KIT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NIRS_KIT

% Last Modified by GUIDE v2.5 19-Oct-2019 13:16:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NIRS_KIT_OpeningFcn, ...
                   'gui_OutputFcn',  @NIRS_KIT_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before NIRS_KIT is made visible.
function NIRS_KIT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for NIRS_KIT

% Release='NIRS_KIT_Beta 15-Nov-2019';

disp('----------------------------------------------------------------------------------------------------------');
disp('   Thank you for using NIRS_KIT.');
disp('   NIRS_KIT: A toolbox for Task && Resting-State fNIRS Data Analysis');
disp('   Copyright 2019. All Rights Reserved');
disp('   It is only for academic use! Any unauthorized commercial use is prohibited.'); 
disp('   Programers: Hou Xin; Zhang Zong; Zhao Chen; Zhu Chaozhe.');
disp('   Mail to Initiator: houxin195776@mail.bnu.edu.cn');
disp('   State Key Laboratory of Cognitive Neuroscience and Learning, Beijing Normal University, Beijing, China');
%disp('   Citing Information:');
disp('----------------------------------------------------------------------------------------------------------');

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NIRS_KIT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NIRS_KIT_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in DataManager.
function DataManager_Callback(hObject, eventdata, handles)
% hObject    handle to DataManager (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DataConvert


% --- Executes on button press in DataViewer.
function DataViewer_Callback(hObject, eventdata, handles)
% hObject    handle to DataViewer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data_Viewer


% --- Executes on button press in DataAnalysis.
function DataAnalysis_Callback(hObject, eventdata, handles)
% hObject    handle to DataAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_Rest_Analysis;


% --- Executes during object creation, after setting all properties.
function DataAnalysis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ResultsViewer.
function ResultsViewer_Callback(hObject, eventdata, handles)
% hObject    handle to ResultsViewer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_Result_Viewer;


% --- Executes on button press in preprocess.
function preprocess_Callback(hObject, eventdata, handles)
% hObject    handle to preprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_Preprocessing;


% --- Executes on button press in taskanalysis.
function taskanalysis_Callback(hObject, eventdata, handles)
% hObject    handle to taskanalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_TaskAnalysis;
