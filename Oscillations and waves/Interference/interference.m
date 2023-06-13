function varargout = feninterferencia(varargin)
% FENINTERFERENCIA MATLAB code for feninterferencia.fig
%      FENINTERFERENCIA, by itself, creates a new FENINTERFERENCIA or raises the existing
%      singleton*.
%
%      H = FENINTERFERENCIA returns the handle to a new FENINTERFERENCIA or the handle to
%      the existing singleton*.
%
%      FENINTERFERENCIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FENINTERFERENCIA.M with the given input arguments.
%
%      FENINTERFERENCIA('Property','Value',...) creates a new FENINTERFERENCIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before feninterferencia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to feninterferencia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help feninterferencia

% Last Modified by GUIDE v2.5 10-Jul-2020 14:25:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @feninterferencia_OpeningFcn, ...
                   'gui_OutputFcn',  @feninterferencia_OutputFcn, ...
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


% --- Executes just before feninterferencia is made visible.
function feninterferencia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to feninterferencia (see VARARGIN)

% Choose default command line output for feninterferencia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes feninterferencia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = feninterferencia_OutputFcn(hObject, eventdata, handles) 
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
pos = get(handles.popupmenu1,'Value');
sarta = get(handles.popupmenu1,'string');
angle = str2num((sarta{ pos})); %angulo de propagacion

int=zeros(250,600,3);
int=uint8(int);

x= linspace(-260e-8,260e-8,600);
y= linspace(260e-8,-260e-8,600);

 
l1=670e-9;
l2=520e-9;
l3=420e-9;
B1=2*pi/l1;
B2=2*pi/l2;
B3=2*pi/l3;

onda1=zeros(250,600);
onda2=zeros(250,600);
onda3=zeros(250,600);

for c=1:250
    
    wave1=(cos((-B1*sin(deg2rad (angle))*x(c))+(B1*cos(deg2rad (angle))*y)))*255;
    wave2=(cos((-B2*sin(deg2rad (angle))*x(c))+(B2*cos(deg2rad (angle))*y)))*255;
    wave3=(cos((-B3*sin(deg2rad (angle))*x(c))+(B3*cos(deg2rad (angle))*y)))*255;
    
    onda1(c,:)= wave1;
    onda2(c,:)=wave2;
    onda3(c,:)=wave3;
    
end

int(:,:,1)=onda1;
int(:,:,2)=onda2;
int(:,:,3)=onda3;

%figure(1);imshow(int)

intg=rgb2gray(int);

%figure(2); plot(intg(125, :))
if get(handles.popupmenu1,'Value')==1;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :), 'k')
end

if get(handles.popupmenu1,'Value')==2;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :),'k')
end
   

if get(handles.popupmenu1,'Value')==3;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :),'k') 
end
if get(handles.popupmenu1,'Value')==4;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :),'k')
end
if get(handles.popupmenu1,'Value')==5;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :),'k')
end

if get(handles.popupmenu1,'Value')==6;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :),'k')
end
if get(handles.popupmenu1,'Value')==7;
    axes(handles.axes1)
    imshow(int)  
    axes(handles.axes2)
    plot(intg(125, :),'k')
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
