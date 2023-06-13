function varargout = oscilador(varargin)
% OSCILADOR MATLAB code for oscilador.fig
%      OSCILADOR, by itself, creates a new OSCILADOR or raises the existing
%      singleton*.
%
%      H = OSCILADOR returns the handle to a new OSCILADOR or the handle to
%      the existing singleton*.
%
%      OSCILADOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OSCILADOR.M with the given input arguments.
%
%      OSCILADOR('Property','Value',...) creates a new OSCILADOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before oscilador_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to oscilador_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help oscilador

% Last Modified by GUIDE v2.5 01-Aug-2020 18:10:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @oscilador_OpeningFcn, ...
                   'gui_OutputFcn',  @oscilador_OutputFcn, ...
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


% --- Executes just before oscilador is made visible.
function oscilador_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to oscilador (see VARARGIN)

% Choose default command line output for oscilador
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes oscilador wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = oscilador_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
one = get(handles.popupmenu1,'Value');
one1 = get(handles.popupmenu1,'string');
R = str2num((one1{ one}));


two = get(handles.popupmenu2,'Value');
two1 = get(handles.popupmenu2,'string');
L = str2num((two1{ two}));


three = get(handles.popupmenu3,'Value');
three1 = get(handles.popupmenu3,'string');
C = str2num((three1{ three}));



V = 1;
x = linspace(-50, 5100);
k = (V*R);
y = 1./(x*C*1e-6);
t = 1./( R^2  + ((x*L)  - y ).^2);
I = k*t;
Q = L/(R*(sqrt(L*C*1e-6)))


if get(handles.popupmenu1,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu2,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
    
end


if get(handles.popupmenu3,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
one = get(handles.popupmenu1,'Value');
one1 = get(handles.popupmenu1,'string');
R = str2num((one1{ one}));


two = get(handles.popupmenu2,'Value');
two1 = get(handles.popupmenu2,'string');
L = str2num((two1{ two}));


three = get(handles.popupmenu3,'Value');
three1 = get(handles.popupmenu3,'string');
C = str2num((three1{ three}));



V = 1;
x = linspace(-50, 5100);
k = (V*R);
y = 1./(x*C*1e-6);
t = 1./( R^2  + ((x*L)  - y ).^2);
I = k*t;
Q = L/(R*(sqrt(L*C*1e-6)))



if get(handles.popupmenu1,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu2,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
    
end


if get(handles.popupmenu3,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
one = get(handles.popupmenu1,'Value');
one1 = get(handles.popupmenu1,'string');
R = str2num((one1{ one}));


two = get(handles.popupmenu2,'Value');
two1 = get(handles.popupmenu2,'string');
L = str2num((two1{ two}));


three = get(handles.popupmenu3,'Value');
three1 = get(handles.popupmenu3,'string');
C = str2num((three1{ three}));



V = 1;
x = linspace(-50, 5100);
k = (V*R);
y = 1./(x*C*1e-6);
t = 1./( R^2  + ((x*L)  - y ).^2);
I = k*t;
Q = L/(R*(sqrt(L*C*1e-6)))



if get(handles.popupmenu1,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu1,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu2,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

if get(handles.popupmenu2,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==1;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==2;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
    
end


if get(handles.popupmenu3,'Value')==3;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==4;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end


if get(handles.popupmenu3,'Value')==5;
    axes(handles.axes1)
    plot(x, I);
    ylim([0 5.5e-3])
    ylabel('I')
    xlabel('ω')
    grid 
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
