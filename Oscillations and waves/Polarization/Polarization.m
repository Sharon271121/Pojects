function varargout = Pol(varargin)
% POL MATLAB code for Pol.fig
%      POL, by itself, creates a new POL or raises the existing
%      singleton*.
%
%      H = POL returns the handle to a new POL or the handle to
%      the existing singleton*.
%
%      POL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POL.M with the given input arguments.
%
%      POL('Property','Value',...) creates a new POL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pol_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pol_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pol

% Last Modified by GUIDE v2.5 07-Jun-2020 15:15:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pol_OpeningFcn, ...
                   'gui_OutputFcn',  @Pol_OutputFcn, ...
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


% --- Executes just before Pol is made visible.
function Pol_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pol (see VARARGIN)

% Choose default command line output for Pol
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global t
global t2
t= linspace(-1, 1, 50);
t2= linspace(-25, 25, 30);





% UIWAIT makes Pol wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pol_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
axes(handles.axes2)
axes(handles.axes3)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

global y1
global y2
global y3
global y4
global y5
global y6
global t2
global t
global A


if get(handles.popupmenu1,'Value')==1
    A = 1   
end

if get(handles.popupmenu1,'Value')==2
    A = 2
   
end

if get(handles.popupmenu1,'Value')==3
    A =3
end

if get(handles.popupmenu1,'Value')==4
    A =4
end

if get(handles.popupmenu1,'Value')==5
    A =5
end


global B

if get(handles.popupmenu2,'Value')==1
    B =1
end

if get(handles.popupmenu2,'Value')==2
    B =2
end

if get(handles.popupmenu2,'Value')==3
    B =3
end

if get(handles.popupmenu2,'Value')==4
    B =4
end

if get(handles.popupmenu2,'Value')==5
    B =5
end

global desf 

if get(handles.popupmenu3,'Value')==1
     desf =-pi/2
end

if get(handles.popupmenu3,'Value')==2
     desf =0
end

if get(handles.popupmenu3,'Value')==3
    desf =pi/6
end

if get(handles.popupmenu3,'Value')==4
    desf =pi/4
end
if get(handles.popupmenu3,'Value')==5
    desf =pi/3
end
if get(handles.popupmenu3,'Value')==6
    desf =pi/2
end

if get(handles.popupmenu3,'Value')==7
    desf =2*pi/3
end

if get(handles.popupmenu3,'Value')==8
    desf =pi
end

global y1
global y2
global y3
global y4
global y5
global y6


y1= A*sin(2*pi*t);
y2= B*sin(2*pi*t + desf);
y3 = A*sin(2*pi*t2);
y4 = B*sin(2*pi*t2 + desf);
y5 = A*cos(2*pi*t2);
y6 = B*cos(2*pi*t2 + desf);



axes(handles.axes1)
%plot(t,y1)
plot(t,y1);
xlabel('Tiempo'); 
ylabel('Campo eléctrico 1');
ylim([-8, 8]);
%yticks([ -5 -4 -3 -2 -1 0 1, 2, 3, 4 ,5,])


grid

%axes(handles.axes2)
    %plot(t,y2)
%grid
%axes(handles.axes3)
    %plot(y1,y2)
%grid

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

global y1
global y2
global y3
global y4
global y5
global y6
global t2
global t
global A


if get(handles.popupmenu1,'Value')==1
    A = 1   
end

if get(handles.popupmenu1,'Value')==2
    A = 2
   
end

if get(handles.popupmenu1,'Value')==3
    A =3
end

if get(handles.popupmenu1,'Value')==4
    A =4
end

if get(handles.popupmenu1,'Value')==5
    A =5
end


global B

if get(handles.popupmenu2,'Value')==1
    B =1
end

if get(handles.popupmenu2,'Value')==2
    B =2
end

if get(handles.popupmenu2,'Value')==3
    B =3
end

if get(handles.popupmenu2,'Value')==4
    B =4
end

if get(handles.popupmenu2,'Value')==5
    B =5
end

global desf 


if get(handles.popupmenu3,'Value')==1
     desf =-pi/2
end
if get(handles.popupmenu3,'Value')==2
     desf =0
end

if get(handles.popupmenu3,'Value')==3
    desf =pi/6
end

if get(handles.popupmenu3,'Value')==4
    desf =pi/4
end
if get(handles.popupmenu3,'Value')==5
    desf =pi/3
end
if get(handles.popupmenu3,'Value')==6
    desf =pi/2
end

if get(handles.popupmenu3,'Value')==7
    desf =2*pi/3
end

if get(handles.popupmenu3,'Value')==8
    desf =pi
end


global y1
global y2
global y3
global y4
global y5
global y6

y1= A*sin(2*pi*t);
y2= B*sin(2*pi*t + desf);
y3 = A*sin(2*pi*t2);
y4 = B*sin(2*pi*t2 + desf);
y5 = A*cos(2*pi*t2);
y6 = B*cos(2*pi*t2 + desf);

axes(handles.axes2)


plot(t,y2,'g');
xlabel('Tiempo'); 
ylabel('Campo eléctrico 2');
ylim([-8, 8]);
%yticks([ -5 -4 -3 -2 -1 0 1, 2, 3, 4 ,5,])

grid

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

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


global y1
global y2
global y3
global y4
global y5
global y6
global t2
global t
global A



if get(handles.popupmenu1,'Value')==1
    A = 1   
end

if get(handles.popupmenu1,'Value')==2
    A = 2
   
end

if get(handles.popupmenu1,'Value')==3
    A =3
end

if get(handles.popupmenu1,'Value')==4
    A =4
end

if get(handles.popupmenu1,'Value')==5
    A =5
end


global B

if get(handles.popupmenu2,'Value')==1
    B =1
end

if get(handles.popupmenu2,'Value')==2
    B =2
end

if get(handles.popupmenu2,'Value')==3
    B =3;
end

if get(handles.popupmenu2,'Value')==4
    B =4;
end

if get(handles.popupmenu2,'Value')==5
    B =5;
end

global desf 


if get(handles.popupmenu3,'Value')==1
     desf =-pi/2;
end
if get(handles.popupmenu3,'Value')==2
     desf =0;
end

if get(handles.popupmenu3,'Value')==3
    desf =pi/6;
end

if get(handles.popupmenu3,'Value')==4
    desf =pi/4;
end
if get(handles.popupmenu3,'Value')==5
    desf =pi/3;
end
if get(handles.popupmenu3,'Value')==6
    desf =pi/2;
end

if get(handles.popupmenu3,'Value')==7
    desf =2*pi/3;
end

if get(handles.popupmenu3,'Value')==8
    desf =pi;
end

global y1
global y2
global y3
global y4
global y5
global y6

y1= A*sin(2*pi*t);
y2= B*sin(2*pi*t + desf);
y3 = A*sin(2*pi*t2);
y4 = B*sin(2*pi*t2 + desf);
y5 = A*cos(2*pi*t2);
y6 = B*cos(2*pi*t2 + desf);

axes(handles.axes3)

xlabel('Campo eléctrico 1'); 
ylabel('Campo eléctrico 2');
plot(y1,y2,'k')
hold
quiver(y3, y4, y5, y6,0.5);

grid
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
