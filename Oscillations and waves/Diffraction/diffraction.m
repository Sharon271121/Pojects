function varargout = fenomena(varargin)
% FENOMENA MATLAB code for fenomena.fig
%      FENOMENA, by itself, creates a new FENOMENA or raises the existing
%      singleton*.
%
%      H = FENOMENA returns the handle to a new FENOMENA or the handle to
%      the existing singleton*.
%
%      FENOMENA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FENOMENA.M with the given input arguments.
%
%      FENOMENA('Property','Value',...) creates a new FENOMENA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fenomena_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fenomena_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fenomena

% Last Modified by GUIDE v2.5 20-Jun-2020 20:40:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fenomena_OpeningFcn, ...
                   'gui_OutputFcn',  @fenomena_OutputFcn, ...
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


% --- Executes just before fenomena is made visible.
function fenomena_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fenomena (see VARARGIN)

% Choose default command line output for fenomena
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fenomena wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fenomena_OutputFcn(hObject, eventdata, handles) 
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
R = str2num(sarta{pos});


x = linspace(-13,13, 300);
y = x;
C = 1 + sqrt(2);
B = sqrt(2) - 1;

Ap = 0.9238795325*R;
Ap1 = 0.9238795325*Ap;


[mx my] = meshgrid(x,y); %matriz cuadrada
dats = mx.*mx + my.*my < R*R; %Primer circulo de radio R
%Ecuaciones para formar<el polígono escritas como matrices
dat1 = (-B.*mx - my + R +1) < dats;
dat2 = (B.*mx - my + R +1) < dats;
dat3 = (C.*mx - my + C*R +1) < dats;
dat4 = (-C.*mx - my - C*R +1) > dats;
dat5 = (-B.*mx - my - R +1) > dats;
dat6 = (B.*mx - my  -R +1) > dats;
dat7 = (C.*mx - my - C*R +1) > dats;
dat8 = (-C.*mx - my + C*R +1) < dats;

%Unión de las matrices anteriores con la matriz de la ecuación de la circunferencia 
dat = mx.*mx + my.*my < R^2; 
datf1= and(dat, dat1);
datf2= and(dat, dat2);
datf3= and(dat, dat3);
datf4= and(dat, dat4);
datf5= and(dat, dat5);
datf6= and(dat, dat6);
datf7= and(dat, dat7);
datf8= and(dat, dat8);

%Intercección de las matrices anteriores

datf11 = or(datf1, datf2);
datf12 = or(datf11, datf3);
datf13 = or(datf12, datf4);
datf14 = or(datf13, datf5);
datf15 = or(datf14, datf6);
datf16 = or(datf15, datf7);
datf17 = or(datf16, datf8);

datsx = mx.*mx + my.*my < Ap*Ap;

dat1x = (-B.*mx - my + Ap +1) < datsx; 
dat2x = (B.*mx - my + Ap +1) < datsx; 
dat3x = (C.*mx - my + C*Ap +1) < datsx;
dat4x = (-C.*mx - my - C*Ap +1) > datsx;
dat5x = (-B.*mx - my - Ap +1) > datsx;
dat6x = (B.*mx - my  -Ap +1) > datsx;
dat7x = (C.*mx - my - C*Ap +1) > datsx;
dat8x = (-C.*mx - my + C*Ap +1) < datsx; 

datf1x= and(datsx, dat1x);
datf2x= and(datsx, dat2x);
datf3x= and(datsx, dat3x);
datf4x= and(datsx, dat4x);
datf5x= and(datsx, dat5x);
datf6x= and(datsx, dat6x);
datf7x= and(datsx, dat7x);
datf8x= and(datsx, dat8x);

datf11x = or(datf1x, datf2x);
datf12x = or(datf11x, datf3x);
datf13x = or(datf12x, datf4x);
datf14x = or(datf13x, datf5x);
datf15x = or(datf14x, datf6x);
datf16x = or(datf15x, datf7x);
datf17x = or(datf16x, datf8x);

imshow(datf17)
%Intersección del primer polígono con el segundo:
todo1 = or(datf17, datf17x);

%TERCERO:
datsy = mx.*mx + my.*my < Ap1*Ap1;

dat1y = (-B.*mx - my + Ap1 +1) < datsy; 
dat2y = (B.*mx - my + Ap1 +1) < datsy; 
dat3y = (C.*mx - my + C*Ap1 +1) < datsy;
dat4y = (-C.*mx - my - C*Ap1 +1) > datsy;
dat5y = (-B.*mx - my - Ap1 +1) > datsy;
dat6y = (B.*mx - my  -Ap1 +1) > datsy;
dat7y = (C.*mx - my - C*Ap1 +1) > datsy;
dat8y = (-C.*mx - my + C*Ap1 +1) < datsy; 


datf1y= and(datsy, dat1y);
datf2y= and(datsy, dat2y);
datf3y= and(datsy, dat3y);
datf4y= and(datsy, dat4y);
datf5y= and(datsy, dat5y);
datf6y= and(datsy, dat6y);
datf7y= and(datsy, dat7y);
datf8y= and(datsy, dat8y);

datf11y = or(datf1y, datf2y);
datf12y = or(datf11y, datf3y);
datf13y = or(datf12y, datf4y);
datf14y = or(datf13y, datf5y);
datf15y = or(datf14y, datf6y);
datf16y = or(datf15y, datf7y);
datf17y = or(datf16y, datf8y);


%intersección de los tres polígonos 
todo2 = or(todo1, datf17y);

uno = fft2(datf17);
dos = fft2(todo1);
tres = fft2(todo2);




if get(handles.popupmenu2,'Value')==1;
    axes(handles.axes1)
    imshow(datf17)  
    axes(handles.axes3)
    imagesc(abs(fftshift(uno))); shading interp 
end

if get(handles.popupmenu2,'Value')==2;
    axes(handles.axes1)
    imshow(todo1)
    axes(handles.axes3)
    imagesc(abs(fftshift(dos))); shading interp 
end
   

if get(handles.popupmenu2,'Value')==3;
    axes(handles.axes1)
    imshow(todo2)
    axes(handles.axes3)
    imagesc(abs(fftshift(tres))); shading interp 
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

pos = get(handles.popupmenu1,'Value');
sarta = get(handles.popupmenu1,'string');
R = str2num(sarta{pos});


x = linspace(-110,110, 300);
y = x;
C = 1 + sqrt(2);
B = sqrt(2) - 1;

Ap = 0.9238795325*R;
Ap1 = 0.9238795325*Ap;


[mx my] = meshgrid(x,y); %matriz cuadrada
dats = mx.*mx + my.*my < R*R; %Primer circulo de radio R
%Ecuaciones para formar<el polígono escritas como matrices
dat1 = (-B.*mx - my + R +1) < dats;
dat2 = (B.*mx - my + R +1) < dats;
dat3 = (C.*mx - my + C*R +1) < dats;
dat4 = (-C.*mx - my - C*R +1) > dats;
dat5 = (-B.*mx - my - R +1) > dats;
dat6 = (B.*mx - my  -R +1) > dats;
dat7 = (C.*mx - my - C*R +1) > dats;
dat8 = (-C.*mx - my + C*R +1) < dats;

%Unión de las matrices anteriores con la matriz de la ecuación de la circunferencia 
dat = mx.*mx + my.*my < R^2; 
datf1= and(dat, dat1);
datf2= and(dat, dat2);
datf3= and(dat, dat3);
datf4= and(dat, dat4);
datf5= and(dat, dat5);
datf6= and(dat, dat6);
datf7= and(dat, dat7);
datf8= and(dat, dat8);

%Intercección de las matrices anteriores

datf11 = or(datf1, datf2);
datf12 = or(datf11, datf3);
datf13 = or(datf12, datf4);
datf14 = or(datf13, datf5);
datf15 = or(datf14, datf6);
datf16 = or(datf15, datf7);
datf17 = or(datf16, datf8);

datsx = mx.*mx + my.*my < Ap*Ap;

dat1x = (-B.*mx - my + Ap +1) < datsx; 
dat2x = (B.*mx - my + Ap +1) < datsx; 
dat3x = (C.*mx - my + C*Ap +1) < datsx;
dat4x = (-C.*mx - my - C*Ap +1) > datsx;
dat5x = (-B.*mx - my - Ap +1) > datsx;
dat6x = (B.*mx - my  -Ap +1) > datsx;
dat7x = (C.*mx - my - C*Ap +1) > datsx;
dat8x = (-C.*mx - my + C*Ap +1) < datsx; 

datf1x= and(datsx, dat1x);
datf2x= and(datsx, dat2x);
datf3x= and(datsx, dat3x);
datf4x= and(datsx, dat4x);
datf5x= and(datsx, dat5x);
datf6x= and(datsx, dat6x);
datf7x= and(datsx, dat7x);
datf8x= and(datsx, dat8x);

datf11x = or(datf1x, datf2x);
datf12x = or(datf11x, datf3x);
datf13x = or(datf12x, datf4x);
datf14x = or(datf13x, datf5x);
datf15x = or(datf14x, datf6x);
datf16x = or(datf15x, datf7x);
datf17x = or(datf16x, datf8x);


%Intersección del primer polígono con el segundo:
todo1 = or(datf17, datf17x);

%TERCERO:
datsy = mx.*mx + my.*my < Ap1*Ap1;

dat1y = (-B.*mx - my + Ap1 +1) < datsy; 
dat2y = (B.*mx - my + Ap1 +1) < datsy; 
dat3y = (C.*mx - my + C*Ap1 +1) < datsy;
dat4y = (-C.*mx - my - C*Ap1 +1) > datsy;
dat5y = (-B.*mx - my - Ap1 +1) > datsy;
dat6y = (B.*mx - my  -Ap1 +1) > datsy;
dat7y = (C.*mx - my - C*Ap1 +1) > datsy;
dat8y = (-C.*mx - my + C*Ap1 +1) < datsy; 


datf1y= and(datsy, dat1y);
datf2y= and(datsy, dat2y);
datf3y= and(datsy, dat3y);
datf4y= and(datsy, dat4y);
datf5y= and(datsy, dat5y);
datf6y= and(datsy, dat6y);
datf7y= and(datsy, dat7y);
datf8y= and(datsy, dat8y);

datf11y = or(datf1y, datf2y);
datf12y = or(datf11y, datf3y);
datf13y = or(datf12y, datf4y);
datf14y = or(datf13y, datf5y);
datf15y = or(datf14y, datf6y);
datf16y = or(datf15y, datf7y);
datf17y = or(datf16y, datf8y);


%intersección de los tres polígonos 
todo2 = or(todo1, datf17y);

uno = fft2(datf17);
dos = fft2(todo1);
tres = fft2(todo2);




if get(handles.popupmenu2,'Value')==1;
    axes(handles.axes1)
    imshow(datf17)  
    axes(handles.axes3)
    imagesc(abs(fftshift(uno))); shading interp 
end

if get(handles.popupmenu2,'Value')==2;
    axes(handles.axes1)
    imshow(todo1)
    axes(handles.axes3)
    imagesc(abs(fftshift(dos))); shading interp 
end
   


if get(handles.popupmenu2,'Value')==3;
    axes(handles.axes1)
    imshow(todo2)
    axes(handles.axes3)
    imagesc(abs(fftshift(tres))); shading interp 
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
