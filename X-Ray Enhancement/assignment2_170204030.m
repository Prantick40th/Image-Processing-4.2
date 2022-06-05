function varargout = assignment2_170204030(varargin)
% ASSIGNMENT2_170204030 MATLAB code for assignment2_170204030.fig
%      ASSIGNMENT2_170204030, by itself, creates a new ASSIGNMENT2_170204030 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT2_170204030 returns the handle to a new ASSIGNMENT2_170204030 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT2_170204030('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT2_170204030.M with the given input arguments.
%
%      ASSIGNMENT2_170204030('Property','Value',...) creates a new ASSIGNMENT2_170204030 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment2_170204030_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment2_170204030_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment2_170204030

% Last Modified by GUIDE v2.5 08-Mar-2022 01:15:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assignment2_170204030_OpeningFcn, ...
                   'gui_OutputFcn',  @assignment2_170204030_OutputFcn, ...
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


% --- Executes just before assignment2_170204030 is made visible.
function assignment2_170204030_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment2_170204030 (see VARARGIN)

% Choose default command line output for assignment2_170204030
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment2_170204030 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment2_170204030_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%-------------------------------------------------------------------
% --- Executes on button press in insert_image.
function insert_image_Callback(hObject, eventdata, handles)
% hObject    handle to insert_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');

% now to read the image we will use the command imread and save it in the variable “a”.
if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
else
      filename=strcat(pathname,filename);
      a=imread(filename);
      axes(handles.axes1);
      imshow(a);
      handles.a = a;
 
% Update handles structure
      guidata(hObject, handles);
end

%---------------------------------------------------------------------
% --- Executes on button press in negetive.
function negetive_Callback(hObject, eventdata, handles)
% hObject    handle to negetive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;
        j = imcomplement(j);
      axes(handles.axes1);
      imshow(j);
       handles.j = j;

%-------------------------------------------------------------------
% --- Executes on button press in power_law.
function power_law_Callback(hObject, eventdata, handles)
% hObject    handle to power_law (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;
j=im2double(j);
gamma=2;
c=1;
j = c*j.^gamma;
axes(handles.axes1);
      imshow(j);
       handles.j = j;

%-------------------------------------------------------------------
% --- Executes on button press in zoom_in.
function zoom_in_Callback(hObject, eventdata, handles)
% hObject    handle to zoom_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;
s=size(j);
c=[];
d=[];
zoom=2;

for n=1:s(1,1)
    for p=1:zoom
        c=[c;j(n,:)];
    end
end

for m=1:s(1,2)
    for p=1:zoom
        d=[d,c(:,m)];
    end
end
imshow(d);
handles.j = j;
 
% Update handles structure
      guidata(hObject, handles);

%------------------------------------------------------------------
% --- Executes on button press in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;
        j = imnoise(j,'salt & pepper', 0.4);
      axes(handles.axes1);
      imshow(j);
       handles.j = j;
 
% Update handles structure
      guidata(hObject, handles);

%----------------------------------------------------------------
% --- Executes on button press in median.
function median_Callback(hObject, eventdata, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;
j = medfilt2(j);
imshow(j);
handles.j = j;
 
% Update handles structure
      guidata(hObject, handles);

%----------------------------------------------------------------
% --- Executes on button press in opening.
function opening_Callback(hObject, eventdata, handles)
% hObject    handle to opening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;

se = strel('disk',10);

j = imopen(j,se);
imshow(j);

       handles.j = j;
 
% Update handles structure
      guidata(hObject, handles);

%---------------------------------------------------------------
% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;

j = mean(j,3);
px = [-1 0 1; -2 0 2; -1 0 1];
j = filter2(px,j);
imshow(j/255)

       handles.j = j;
 
% Update handles structure
      guidata(hObject, handles);

%----------------------------------------------------------------
% --- Executes on button press in positive_laplacian.
function positive_laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to positive_laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.a;

g=[0 1 0;1 -4 1;0 1 0];

output=imfilter(j,g);
imshow(output);

       handles.j = j;
 
% Update handles structure
      guidata(hObject, handles);
