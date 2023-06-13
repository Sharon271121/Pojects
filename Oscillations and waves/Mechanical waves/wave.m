function varargout = onda(varargin)
% ONDA MATLAB code for onda.fig
%      ONDA, by itself, creates a new ONDA or raises the existing
%      singleton*.
%
%      H = ONDA returns the handle to a new ONDA or the handle to
%      the existing singleton*.
%
%      ONDA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ONDA.M with the given input arguments.
%
%      ONDA('Property','Value',...) creates a new ONDA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before onda_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to onda_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help onda

% Last Modified by GUIDE v2.5 08-Sep-2020 18:11:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @onda_OpeningFcn, ...
                   'gui_OutputFcn',  @onda_OutputFcn, ...
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


% --- Executes just before onda is made visible.
function onda_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to onda (see VARARGIN)

% Choose default command line output for onda
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes onda wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = onda_OutputFcn(hObject, eventdata, handles) 
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
n = str2num((sarta{ pos}));
A1 = 1.0;       
A2 = 1.0;       
u = 350;       
l=20;
f=4.375*(2*n+1);
lambda=u/f;   
tf=10/f;
t = 0; x = linspace(0,20, 1000);
%hold on; clf;

x1=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
y_1=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
y_2=[2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
y_3=[3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3];
y_4=[4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4];
%x1=xp;

mytitle = strcat('l=',num2str(l),'; f=',num2str(f),'; t=');
    
while t < tf
        set(handles.popupmenu1, 'enable', 'off');
        y1 = cos(2*pi/lambda*(-u*t + x));
        y2 = cos(2*pi/lambda*(u*t + x));
        y3 = y1 + y2;
        
        xp=[x1(1)+y3(1) x1(2)+y3(50) x1(3)+y3(100) x1(4)+y3(150) x1(5)+y3(200) x1(6)+y3(250) x1(7)+y3(300) x1(8)+y3(350) x1(9)+y3(400) x1(10)+y3(450) x1(11)+y3(500) x1(12)+y3(550) x1(13)+y3(600) x1(14)+y3(650) x1(15)+y3(700) x1(16)+y3(750) x1(17)+y3(800) x1(18)+y3(850) x1(19)+y3(900) x1(20)+y3(950) x1(21)+y3(1000)];

        axes(handles.axes1);
        %subplot(2, 1, 1);
        plot(x,y1,'k-.',x,y2,'c--',x,y3,'b');
        xlabel('Posición') 
        ylabel('Onda armónica estacionaria') 
        set(handles.axes1,'ylim',[-3,3], 'xlim', [-3, 22]); grid on
        legend('Onda viajera', 'Onda reflejada', 'Onda estacionaria')
        
        %title(strcat(mytitle, sprintf('%0.2f',t)));
        
       % 'MarkerFaceColor',[0 0 0]
        
        axes(handles.axes2);
        %subplot(2,1,2);
        plot(xp, y_1, 'co', xp, y_2, 'co', xp, y_3, 'co',xp, y_4, 'co', 'MarkerFaceColor', [0 0 1]);
        xlabel('Longitud del tubo') 
        title('Partículas oscilando dentro de un tubo semiabierto')
        set(handles.axes2,'ylim',[-1,5], 'xlim', [-3, 22]); grid on 
        xp=x1;

        t = t + (tf/100);
        pause(0.08);
end
set(handles.popupmenu1, 'enable', 'on')



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


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
