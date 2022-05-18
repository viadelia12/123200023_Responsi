function varargout = hostel(varargin)
% HOSTEL MATLAB code for hostel.fig
%      HOSTEL, by itself, creates a new HOSTEL or raises the existing
%      singleton*.
%
%      H = HOSTEL returns the handle to a new HOSTEL or the handle to
%      the existing singleton*.
%
%      HOSTEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOSTEL.M with the given input arguments.
%
%      HOSTEL('Property','Value',...) creates a new HOSTEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hostel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hostel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hostel

% Last Modified by GUIDE v2.5 18-May-2022 13:15:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hostel_OpeningFcn, ...
                   'gui_OutputFcn',  @hostel_OutputFcn, ...
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


% --- Executes just before hostel is made visible.
function hostel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hostel (see VARARGIN)

% Choose default command line output for hostel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hostel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hostel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in read_023.
function read_023_Callback(hObject, eventdata, handles)
% hObject    handle to read_023 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'Dataset Hostel Jepang.xlsx';
p = xlsread(filename, 'D2:D51');
d = xlsread(filename, 'E2:E51');
c = xlsread(filename, 'I2:I51');
v = xlsread(filename, 'N2:N51');
data = [p d c v];

set(handles.data_023, 'Data', data, 'ColumnName', {'Price', 'Distance From City Center', 'Cleanliness', 'Value For Money'});

% --- Executes on button press in hasil_023.
function hasil_023_Callback(hObject, eventdata, handles)
% hObject    handle to hasil_023 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w =[1 4 2 3];

filename = 'Dataset Hostel Jepang.xlsx';
p = xlsread(filename, 'D2:D51');
d = xlsread(filename, 'E2:E51');
c = xlsread(filename, 'I2:I51');
v = xlsread(filename, 'N2:N51');
h = xlsread(filename, 'B2:B51');
x = [p d c v];

k = [0 0 1 1];

[m n] = size(x);
w = w./sum(w);

for j=1:n,
 if k(j)==0, w(j)=-1*w(j);
 end;
end;
for i=1:m,
 S(i)=prod(x(i,:).^w);
end;

hasil= S/sum(S);
hasil = hasil.';

readData = [p d c v hasil];
sorting = sortrows(readData, 5, 'descend');

set(handles.data2_023, 'Data', sorting, 'ColumnName', {'Price', 'Distance From City Center', 'Cleanliness', 'Value For Money', 'Score'});
