function varargout = NIRS_Result_Viewer(varargin)
% NIRS_RESULT_VIEWER MATLAB code for NIRS_Result_Viewer.fig
%      NIRS_RESULT_VIEWER, by itself, creates a new NIRS_RESULT_VIEWER or raises the existing
%      singleton*.
%
%      H = NIRS_RESULT_VIEWER returns the handle to a new NIRS_RESULT_VIEWER or the handle to
%      the existing singleton*.
%
%      NIRS_RESULT_VIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NIRS_RESULT_VIEWER.M with the given input arguments.
%
%      NIRS_RESULT_VIEWER('Property','Value',...) creates a new NIRS_RESULT_VIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NIRS_Result_Viewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NIRS_Result_Viewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NIRS_Result_Viewer

% Last Modified by GUIDE v2.5 15-Nov-2019 16:06:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NIRS_Result_Viewer_OpeningFcn, ...
                   'gui_OutputFcn',  @NIRS_Result_Viewer_OutputFcn, ...
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


% --- Executes just before NIRS_Result_Viewer is made visible.
function NIRS_Result_Viewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NIRS_Result_Viewer (see VARARGIN)

% Choose default command line output for NIRS_Result_Viewer

% default setting for 2D_Hotmap_Plot---------------------------------------
set(handles.isInterpolation,'value',1);

set(handles.tex_size,'visible','off');
set(handles.circle_size,'visible','off');
set(handles.isEdge,'visible','off');
set(handles.tex_bgc,'visible','off');
set(handles.gbc_value,'visible','off');
% -------------------------------------------------------------------------

% default setting for 3D_Hotmap_Plot---------------------------------------


% -------------------------------------------------------------------------

% default setting for FC_Matrix_Plot---------------------------------------
set(handles.advanced_text,'visible','off');
set(handles.subnet_xls_path,'visible','off');
set(handles.add_subnet_xls,'visible','off');
set(handles.tex_subnet_type,'visible','off');
set(handles.subnet_type,'visible','off');
set(handles.is_node_edge,'visible','off');

set(handles.is_adv_opt,'userdata',0);
% -------------------------------------------------------------------------
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NIRS_Result_Viewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NIRS_Result_Viewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inpath_mtx_Callback(hObject, eventdata, handles)
% hObject    handle to inpath_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpath_mtx as text
%        str2double(get(hObject,'String')) returns contents of inpath_mtx as a double


% --- Executes during object creation, after setting all properties.
function inpath_mtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpath_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input_mtx.
function input_mtx_Callback(hObject, eventdata, handles)
% hObject    handle to input_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.mat';'*.txt'});
if ischar(filename)
    inpath_mtx = fullfile(pathname,filename);
    set(handles.inpath_mtx,'String',inpath_mtx);
    if strcmp(filename(end-2:end),'mat')
        set(handles.thres_p,'visible','on');
        set(handles.mtx_thres_p,'visible','on');
        set(handles.mtx_thres_p,'string',[]);
        
        load(inpath_mtx);
        set(handles.min_mtx,'string',min(statdata.stat(:)));
        set(handles.max_mtx,'string',max(statdata.stat(:)));
    elseif strcmp(filename(end-2:end),'txt')
        set(handles.mtx_thres_p,'string',[]);
        set(handles.thres_p,'visible','off');
        set(handles.mtx_thres_p,'visible','off');            
        
        mtx_data=load(inpath_mtx);
        set(handles.min_mtx,'string',min(mtx_data(:)));
        set(handles.max_mtx,'string',max(mtx_data(:)));
    end
end



% --- Executes on button press in input3d.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to input3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function path2d_Callback(hObject, eventdata, handles)
% hObject    handle to path2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path2d as text
%        str2double(get(hObject,'String')) returns contents of path2d as a double


% --- Executes during object creation, after setting all properties.
function path2d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isProbe2d.
function isProbe2d_Callback(hObject, eventdata, handles)
% hObject    handle to isProbe2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of isProbe2d
if get(handles.isProbe2d,'value')
    set(handles.addProbe,'enable','on');
    set(handles.path2d,'enable','on');
else
    set(handles.addProbe,'enable','off');
    set(handles.path2d,'enable','off');
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

if  ischar(filename)
    set(handles.path2d,'userdata',pathname);
    set(handles.path2d,'string',filename);
end

% --- Executes on button press in view2d.
function view2d_Callback(hObject, eventdata, handles)
% hObject    handle to view2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.isProbe2d,'value') && isempty(get(handles.path2d,'string'))
    msgbox({'There is no probeset inf !!!';'Please select ... ...'},'Warning','warn');
else
    handles.hot2d=NR_plot2d(handles);
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in input3d.
function input3d_Callback(hObject, eventdata, handles)
% hObject    handle to input3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile(fullfile(pwd,'*.xlsx'));

if ischar(filename)
    inpath_xls = fullfile(pathname,filename);
    
    hi=waitbar(1,'Please wait ... ...');

    set(handles.inpath3d,'String',inpath_xls);
    [~,~,xls_data]=xlsread(inpath_xls,'Sheet1');
    xls_data = xls_data(2:end,:);
    xls_data=cell2mat(xls_data);
    set(handles.climt_min_3d,'string',min(xls_data(:,5)));
    set(handles.climt_max_3d,'string',max(xls_data(:,5)));
    
    delete(hi);
end



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



% --- Executes on button press in isInterpolation.
function isInterpolation_Callback(hObject, eventdata, handles)
% hObject    handle to isInterpolation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of isInterpolation
if get(handles.isInterpolation,'value')
    set(handles.tex_size,'visible','off');
    set(handles.circle_size,'visible','off');
    set(handles.isEdge,'visible','off');
    set(handles.tex_bgc,'visible','off');
    set(handles.gbc_value,'visible','off');
else
    set(handles.tex_size,'visible','on');
    set(handles.circle_size,'visible','on');
    set(handles.isEdge,'visible','on');
    set(handles.tex_bgc,'visible','on');
    set(handles.gbc_value,'visible','on');
    
    set(handles.isEdge,'value',0);
    set(handles.circle_size,'string','1');
    set(handles.gbc_value,'string','255 255 255');
end

% --- Executes on button press in save2d.
function save2d_Callback(hObject, eventdata, handles)
% hObject    handle to save2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inpath=get(handles.inpath2d,'string');
[stat_path,stat_name]=fileparts(inpath);

if isfield(handles,'hot2d')
    if ishandle(handles.hot2d)
        [fn,fp]= uiputfile({'*.tif';'*.eps'},'Save 2D Hotmap',fullfile(stat_path,stat_name));
        if ischar(fn)
            out_type=fn(end-2:end);
            if strcmp(out_type,'tif')
                export_fig(handles.hot2d,fullfile(fp,fn),'-m2.5');
                msgbox('Result Figure has been saved','Success','help');
            elseif strcmp(out_type,'eps')
                % set(handles.hot2d,'Units','inches');
                % screenposition = get(handles.hot2d,'Position');
                % set(handles.hot2d,'PaperPosition',[0 0 screenposition(3:4)],'PaperSize',[screenposition(3:4)]);
                % print(handles.hot2d,'-dpdf','-painters',fullfile(fp,fn));
                print(handles.hot2d,'-depsc','-painters',fullfile(fp,fn));
                msgbox('Result Figure has been saved','Success','help');
            end
        end
    else
        msgbox('The figure handle has been closed','Warning','warn');
    end
end



function min2d_Callback(hObject, eventdata, handles)
% hObject    handle to min2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min2d as text
%        str2double(get(hObject,'String')) returns contents of min2d as a double


% --- Executes during object creation, after setting all properties.
function min2d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max2d_Callback(hObject, eventdata, handles)
% hObject    handle to max2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max2d as text
%        str2double(get(hObject,'String')) returns contents of max2d as a double


% --- Executes during object creation, after setting all properties.
function max2d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function circle_size_Callback(hObject, eventdata, handles)
% hObject    handle to circle_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of circle_size as text
%        str2double(get(hObject,'String')) returns contents of circle_size as a double


% --- Executes during object creation, after setting all properties.
function circle_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to circle_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isEdge.
function isEdge_Callback(hObject, eventdata, handles)
% hObject    handle to isEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isEdge



function gbc_value_Callback(hObject, eventdata, handles)
% hObject    handle to gbc_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gbc_value as text
%        str2double(get(hObject,'String')) returns contents of gbc_value as a double


% --- Executes during object creation, after setting all properties.
function gbc_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gbc_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mtx_thres_p_Callback(hObject, eventdata, handles)
% hObject    handle to mtx_thres_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mtx_thres_p as text
%        str2double(get(hObject,'String')) returns contents of mtx_thres_p as a double


% --- Executes during object creation, after setting all properties.
function mtx_thres_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mtx_thres_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mtx_view.
function mtx_view_Callback(hObject, eventdata, handles)
% hObject    handle to mtx_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.mtx_id,handles.node_edge]=fc_matrix_plot(handles);
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in mtx_save.
function mtx_save_Callback(hObject, eventdata, handles)
% hObject    handle to mtx_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inpath=get(handles.inpath_mtx,'string');
[stat_path,stat_name]=fileparts(inpath);

if isfield(handles,'mtx_id')
    if ishandle(handles.mtx_id)
        [fn,fp]= uiputfile({'*.tif';'*.eps'},'Save FC Matrix Figure',fullfile(stat_path,stat_name));
        if ischar(fn)
            out_type=fn(end-2:end);
            if strcmp(out_type,'tif')
                export_fig(handles.mtx_id,fullfile(fp,fn),'-m2.5');
                msgbox('Result Figure has been saved','Success','help');
            elseif strcmp(out_type,'eps')
                %  set(handles.mtx_id,'Units','inches');
                %  screenposition = get(handles.mtx_id,'Position');
                %  set(handles.mtx_id,'PaperPosition',[0 0 screenposition(3:4)],'PaperSize',[screenposition(3:4)]);
                %  print(handles.mtx_id,'-dpdf','-painters',fullfile(fp,fn));
                print(handles.mtx_id,'-depsc','-painters',fullfile(fp,fn));
                msgbox('Result Figure has been saved','Success','help');
            end
        end
    else
        msgbox('The figure handle has been closed','Warning','warn');
    end
end


if get(handles.is_node_edge,'value')
    [fn,fp]= uiputfile({'*'},'Save Node && Edge Files',fullfile(stat_path,stat_name));
    NodeID = fopen(fullfile(fp,[fn,'.node']),'w');
    formatSpec = '%d %d %d %d %d %s\n';
    [nrows,~] = size(handles.node_edge.Node);
    for row = 1:nrows
        fprintf(NodeID,formatSpec,handles.node_edge.Node{row,:});
    end
    fclose(NodeID);
    
    EgdeID=handles.node_edge.Edge;
    save(fullfile(fp,[fn,'.edge']),'EgdeID','-ascii');
    msgbox('Node and edge files have been saved','Success','help');
end


function subnet_xls_path_Callback(hObject, eventdata, handles)
% hObject    handle to subnet_xls_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnet_xls_path as text
%        str2double(get(hObject,'String')) returns contents of subnet_xls_path as a double


% --- Executes during object creation, after setting all properties.
function subnet_xls_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnet_xls_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in is_adv_opt.
function is_adv_opt_Callback(hObject, eventdata, handles)
% hObject    handle to is_adv_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.is_adv_opt,'value')
    set(handles.advanced_text,'visible','on');
    set(handles.subnet_xls_path,'visible','on');
    set(handles.add_subnet_xls,'visible','on');
else
    set(handles.subnet_xls_path,'string',[]);
    set(handles.subnet_type,'value',1);
    set(handles.advanced_text,'visible','off');
    set(handles.subnet_xls_path,'visible','off');
    set(handles.add_subnet_xls,'visible','off');
    set(handles.tex_subnet_type,'visible','off');
    set(handles.subnet_type,'visible','off');
    set(handles.is_adv_opt,'userdata',0);
    set(handles.is_node_edge,'value',0);
    set(handles.is_node_edge,'visible','off');
end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in add_subnet_xls.
function add_subnet_xls_Callback(hObject, eventdata, handles)
% hObject    handle to add_subnet_xls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile(fullfile(pwd,'*.xlsx'));

if ischar(filename)
    subnet_xls = fullfile(pathname,filename);
    set(handles.subnet_xls_path,'userdata',pathname);
    set(handles.subnet_xls_path,'String',filename);
    [~, ~, mtx_xls] = xlsread(subnet_xls,'Sheet1');
    mtx_xls = mtx_xls(2:end,:);
    mtx_xls(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),mtx_xls)) = {''};
    [mm,nn]=size(mtx_xls);
    if nn >= 6
        set(handles.tex_subnet_type,'visible','on');
        set(handles.subnet_type,'visible','on');
        set(handles.is_adv_opt,'userdata',2);
    elseif nn ==1
        set(handles.is_adv_opt,'userdata',1);
        set(handles.subnet_type,'value',1);
        set(handles.tex_subnet_type,'visible','off');
        set(handles.subnet_type,'visible','off');
    end
    if nn == 10
        set(handles.is_node_edge,'visible','on');
    end
end



function min_mtx_Callback(hObject, eventdata, handles)
% hObject    handle to min_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_mtx as text
%        str2double(get(hObject,'String')) returns contents of min_mtx as a double


% --- Executes during object creation, after setting all properties.
function min_mtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_mtx_Callback(hObject, eventdata, handles)
% hObject    handle to max_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_mtx as text
%        str2double(get(hObject,'String')) returns contents of max_mtx as a double


% --- Executes during object creation, after setting all properties.
function max_mtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_mtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in view_3d_gii.
function view_3d_gii_Callback(hObject, eventdata, handles)
% hObject    handle to view_3d_gii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ~isempty(get(handles.temp_nii_gii_file,'string'))
%     if isfield(handles,'gii3d_id')
%         close(handles.gii3d_id);
%     end
    handles.gii3d_id=NR_plot3dgii(handles);
else
    msgbox({'Brain template has not been selected !!!';'Please select ... ...'},'Warning','warn');
end
% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in save_3d.
function save_3d_Callback(hObject, eventdata, handles)
% hObject    handle to save_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inpath3d=get(handles.inpath3d,'string');
[inputfd_3d,inputname_3d]=fileparts(inpath3d);

if get(handles.shown_type_3d,'value')==1 && isfield(handles,'gii3d_id')
    if ishandle(handles.gii3d_id)
        [fn,fp]= uiputfile({'*.tif';'*.eps'},'Save 3D Surfice Figure',fullfile(inputfd_3d,inputname_3d));
        if ischar(fn)
            out_type=fn(end-2:end);
            if strcmp(out_type,'tif')
                export_fig(handles.gii3d_id,fullfile(fp,fn),'-m2.5');
                msgbox('Result Figure has been saved','Success','help');
            elseif strcmp(out_type,'eps')
                %  set(handles.gii3d_id,'Units','inches');
                %  screenposition = get(handles.gii3d_id,'Position');
                %  set(handles.gii3d_id,'PaperPosition',[0 0 screenposition(3:4)],'PaperSize',[screenposition(3:4)]);
                %  print(handles.gii3d_id,'-dpdf','-painters',fullfile(fp,fn));
                
                % print(handles.gii3d_id,'-depsc','-painters',fullfile(fp,fn));
                saveas(handles.gii3d_id,fullfile(fp,fn),'epsc');
                msgbox('Result Figure has been saved','Success','help');
            end
        end
    else
        msgbox('The figure handle has been closed','Warning','warn');
    end
elseif get(handles.shown_type_3d,'value')==2
    [fn,fp]= uiputfile({'*.nii'},'Save 3D Nifti Figure',fullfile(inputfd_3d,inputname_3d));
    if ischar(fn)
        handles.save_nii_name=fullfile(fp,fn);
        NK_generate_nii(handles);
        msgbox('Result nii file has been saved','Success','help');
    end
end


function temp_nii_gii_file_Callback(hObject, eventdata, handles)
% hObject    handle to temp_nii_gii_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temp_nii_gii_file as text
%        str2double(get(hObject,'String')) returns contents of temp_nii_gii_file as a double


% --- Executes during object creation, after setting all properties.
function temp_nii_gii_file_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temp_nii_gii_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_nii_gii.
function add_nii_gii_Callback(hObject, eventdata, handles)
% hObject    handle to add_nii_gii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
root_path=which('NIRS_KIT');
temp_path=fullfile(fileparts(root_path),'BrainTemplate');
if get(handles.shown_type_3d,'value') == 1
    [filename, pathname] = uigetfile(fullfile(temp_path,'*.mat'));
elseif get(handles.shown_type_3d,'value') == 2
    [filename, pathname] = uigetfile(fullfile(temp_path,'*.nii'));
end

if ischar(filename)
    set(handles.temp_nii_gii_file,'String',filename);
    set(handles.temp_nii_gii_file,'userdata',pathname);
end

% --- Executes on button press in is_node_edge.
function is_node_edge_Callback(hObject, eventdata, handles)
% hObject    handle to is_node_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of is_node_edge


% --- Executes on selection change in subnet_type.
function subnet_type_Callback(hObject, eventdata, handles)
% hObject    handle to subnet_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns subnet_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from subnet_type


% --- Executes during object creation, after setting all properties.
function subnet_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnet_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in is_gridlines.
function is_gridlines_Callback(hObject, eventdata, handles)
% hObject    handle to is_gridlines (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of is_gridlines


% --- Executes on selection change in shown_type_3d.
function shown_type_3d_Callback(hObject, eventdata, handles)
% hObject    handle to shown_type_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns shown_type_3d contents as cell array
%        contents{get(hObject,'Value')} returns selected item from shown_type_3d
if get(handles.shown_type_3d,'value') == 1
    set(handles.tex_climt,'visible','on');
    set(handles.climt_min_3d,'visible','on');
    set(handles.tex_midlim_3d,'visible','on');
    set(handles.climt_max_3d,'visible','on');
    
    set(handles.temp_nii_gii_file,'string',[]);
    set(handles.temp_nii_gii_file,'userdata',[]);
    
    set(handles.view_3d_gii,'visible','on');
    
elseif get(handles.shown_type_3d,'value') == 2
    set(handles.temp_nii_gii_file,'string',[]);
    set(handles.temp_nii_gii_file,'userdata',[]);
    
    set(handles.tex_climt,'visible','off');
    set(handles.climt_min_3d,'visible','off');
    set(handles.tex_midlim_3d,'visible','off');
    set(handles.climt_max_3d,'visible','off');
    
    set(handles.view_3d_gii,'visible','off');
end


% --- Executes during object creation, after setting all properties.
function shown_type_3d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shown_type_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function circle_size_3d_Callback(hObject, eventdata, handles)
% hObject    handle to circle_size_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of circle_size_3d as text
%        str2double(get(hObject,'String')) returns contents of circle_size_3d as a double


% --- Executes during object creation, after setting all properties.
function circle_size_3d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to circle_size_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function climt_min_3d_Callback(hObject, eventdata, handles)
% hObject    handle to climt_min_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of climt_min_3d as text
%        str2double(get(hObject,'String')) returns contents of climt_min_3d as a double


% --- Executes during object creation, after setting all properties.
function climt_min_3d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to climt_min_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function climt_max_3d_Callback(hObject, eventdata, handles)
% hObject    handle to climt_max_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of climt_max_3d as text
%        str2double(get(hObject,'String')) returns contents of climt_max_3d as a double


% --- Executes during object creation, after setting all properties.
function climt_max_3d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to climt_max_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input2d.
function input2d_Callback(hObject, eventdata, handles)
% hObject    handle to input2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile(fullfile(pwd,'*.mat'));

if ischar(filename)
    load([pathname filename]);
    statpath = fullfile(pathname,filename);
    set(handles.inpath2d,'String',statpath);
    
    if exist('statdata','var')
        if isempty(statdata.probe2d)
            set(handles.isProbe2d,'value',1);
            set(handles.addProbe,'enable','on');
            set(handles.path2d,'enable','on');
        else
            set(handles.isProbe2d,'value',0);
        end
    elseif exist('indexdata','var')
        if isempty(indexdata.probe2d)
            set(handles.isProbe2d,'value',1);
            set(handles.addProbe,'enable','on');
            set(handles.path2d,'enable','on');
        else
            set(handles.isProbe2d,'value',0);
        end
    end
    
    if exist('statdata','var') 
        if isfield(statdata,'roiCh1')
            ex_stat=statdata.stat(setdiff(1:end,statdata.roiCh1));

            set(handles.min2d,'string',num2str(min(ex_stat)));
            set(handles.max2d,'string',num2str(max(ex_stat)));

            set(handles.isInterpolation,'value',0);
            set(handles.tex_size,'visible','on');
            set(handles.circle_size,'visible','on');
            set(handles.isEdge,'visible','on');
            set(handles.tex_bgc,'visible','on');
            set(handles.gbc_value,'visible','on');
        else
            set(handles.min2d,'string',num2str(min(statdata.stat)));
            set(handles.max2d,'string',num2str(max(statdata.stat)));
            
            set(handles.isInterpolation,'value',1);
            set(handles.tex_size,'visible','off');
            set(handles.circle_size,'visible','off');
            set(handles.isEdge,'visible','off');
            set(handles.tex_bgc,'visible','off');
            set(handles.gbc_value,'visible','off');
        end          
    elseif exist('indexdata','var') 
        if isfield(indexdata,'roiCh1')
            ex_stat=indexdata.index(setdiff(1:end,indexdata.roiCh1));
            
            set(handles.min2d,'string',num2str(min(ex_stat)));
            set(handles.max2d,'string',num2str(max(ex_stat)));
            
            set(handles.isInterpolation,'value',0);
            set(handles.tex_size,'visible','on');
            set(handles.circle_size,'visible','on');
            set(handles.isEdge,'visible','on');
            set(handles.tex_bgc,'visible','on');
            set(handles.gbc_value,'visible','on');
        else
            set(handles.min2d,'string',num2str(min(indexdata.index)));
            set(handles.max2d,'string',num2str(max(indexdata.index)));
            
            set(handles.isInterpolation,'value',1);
            set(handles.tex_size,'visible','off');
            set(handles.circle_size,'visible','off');
            set(handles.isEdge,'visible','off');
            set(handles.tex_bgc,'visible','off');
            set(handles.gbc_value,'visible','off');            
        end
    end
end
