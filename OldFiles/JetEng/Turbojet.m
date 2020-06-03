function varargout = Turbojet(varargin)
% TURBOJET M-file for Turbojet.fig
%      TURBOJET, by itself, creates a new TURBOJET or raises the existing
%      singleton*.
%
%      H = TURBOJET returns the handle to a new TURBOJET or the handle to
%      the existing singleton*.
%
%      TURBOJET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TURBOJET.M with the given input arguments.
%
%      TURBOJET('Property','Value',...) creates a new TURBOJET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Turbojet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Turbojet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Turbojet

% Last Modified by GUIDE v2.5 20-Jan-2013 12:32:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Turbojet_OpeningFcn, ...
                   'gui_OutputFcn',  @Turbojet_OutputFcn, ...
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


% --- Executes just before Turbojet is made visible.
function Turbojet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Turbojet (see VARARGIN)

% Choose default command line output for Turbojet
handles.output = hObject;

clc
axes(handles.axes4);
jet_eng=imread('gt_eng.jpg');
image(jet_eng);
axis off;
%
%axes(handles.axes5);
%proc=imread('process.png');
%image(proc);
%axis off;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Turbojet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Turbojet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function comp_pr_Callback(hObject, eventdata, handles)
% hObject    handle to comp_pr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comp_pr as text
%        str2double(get(hObject,'String')) returns contents of comp_pr as a double


% --- Executes during object creation, after setting all properties.
function comp_pr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comp_pr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comb_pr_loss_Callback(hObject, eventdata, handles)
% hObject    handle to comb_pr_loss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comb_pr_loss as text
%        str2double(get(hObject,'String')) returns contents of comb_pr_loss as a double


% --- Executes during object creation, after setting all properties.
function comb_pr_loss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comb_pr_loss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run_sim.
function run_sim_Callback(hObject, eventdata, handles)
% hObject    handle to run_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R           = str2num(get(handles.gas_const, 'String')); %287; % [J/Kg.K] Gas Constant
Cp_air      = str2num(get(handles.cp_air, 'String')); %1000; % [J/Kg.K] Specific heat of hot air
Cp_gas      = str2num(get(handles.cp_gas, 'String')); %1150; % [J/Kg.K] Spec . heat of flue gasses
Cp_mix      = str2num(get(handles.cp_mix, 'String')); %1050; % [J/Kg.K] Spec . heat after mixer of turbofan
Gamma_air   = str2num(get(handles.gamma_air, 'String')); %1.4; % [-] Isentropic Coefficient air
Gamma_gas   = str2num(get(handles.gamma_gas, 'String')); %1.33; % [-] Is. Coeff . of flue gasses
Gamma_mix   = str2num(get(handles.gamma_mix, 'String')); %1.38; % [-] Is. Coeff . after mixer of turbofan
H_f         = str2num(get(handles.fuel_hv, 'String')); %4.32E7; % [J/Kg] Fuel Heating value

%% Ambient 0
Stage = 1;
StageStr { Stage } = char ('Ambient ');
T( Stage ) = str2num(get(handles.amb_press, 'String')); %288.25; % [K] Temperature
P( Stage ) = str2num(get(handles.amb_temp, 'String')); %101325; % [Pa] Pressure
Rho_0 = str2num(get(handles.amb_rho, 'String')); %1.225; % [kg/m3] Density
m( Stage ) = str2num(get(handles.air_flow_rate, 'String')); %19.900; % [kg/s] Mass flow at stage 1
%%%%%%%%%%%%%%%%%%%%%%%
%% Stage 1 - inlet
Stage = Stage + 1; % Define Engine Stage
StageStr { Stage } = char ('Inlet ');
% Given
PR( Stage ) = str2num(get(handles.inlt_pr, 'String')); %1; % [-] Inlet Pressure Ratio
Eff( Stage ) = str2num(get(handles.eta_inlet, 'String')); %1; % [-] Inlet Efficiency
% Run inlet function
[m_temp , T_temp , P_temp ] = InletFunction (m(Stage -1) ,...
T(Stage -1) ,...
P(Stage -1) ,...
PR( Stage ) ,...
Eff( Stage ) ,...
Gamma_air );
% Store values
m( Stage ) = m_temp;
T( Stage ) = T_temp;
P( Stage ) = P_temp;
%%%%%%%%%%%%%%%%%%
%% Stage 2 - Compressor
Stage = Stage + 1; % Define Engine Stage
StageStr { Stage } = char ('Compressor ');
% Given
RPM( Stage ) = str2num(get(handles.rotor_spd, 'String')); %16540; % [rpm] Design Rotor Speed
PR( Stage ) = str2num(get(handles.comp_pr, 'String')); %6.920; % [-] Pressure Ratio
Eff( Stage ) = str2num(get(handles.eta_comp, 'String')); %0.825; % [-] Efficiency
HeatTransfer ( Stage ) = 0.5; % [-] Heat transfer Fraction
% Run Compressor function
[m_temp , T_temp , P_temp , W_temp ] = CompressorFunction (m(Stage -1) ,...
T(Stage -1) ,...
P(Stage -1) ,...
PR( Stage ) ,...
Eff( Stage ) ,...
Gamma_air ,...
Cp_air );
% Store values
W( Stage ) = W_temp ; % Work produced by compressor
m( Stage ) = m_temp ;
T( Stage ) = T_temp ;
P( Stage ) = P_temp ;
%%%%%%%%%%%%%%%%%%%%%%%%
%% Stage 4 - Combustor
Stage = Stage + 1; % Define Engine Stage
StageStr { Stage } = char ('Combustor ');
% Given
W_f( Stage ) = str2num(get(handles.fuel_flow_rate, 'String')); %0.380; % [Kg/s] Fuel Flow
Eff( Stage ) = str2num(get(handles.eta_burner, 'String')); %0.9950; % [-] Efficiency
PR( Stage ) = 1 - (str2num(get(handles.comb_pr_loss, 'String')))/100.0; %0.0400; % [-] Pressure reduction
% Run Combustor function
[m_temp , T_temp , P_temp ] = CombustorFunction ( m(Stage -1) ,...
T(Stage -1) ,...
P(Stage -1) ,...
W_f( Stage ) ,...
PR( Stage ) ,...
Eff( Stage ) ,...
H_f ,...
Cp_gas ,...
Gamma_gas );
% Store values
m( Stage ) = m_temp ;
T( Stage ) = T_temp ;
P( Stage ) = P_temp ;
%%%%%%%%%%%%%%%%%%%%%%%
%% Stage 5 - Turbine
Stage = Stage + 1; % Define Engine Stage
StageStr { Stage } = char ('Turbine ');
% Given
Eff( Stage ) = str2num(get(handles.eta_turb, 'String')); %0.880; % [-] Efficiency
Eff_mech = str2num(get(handles.eta_mech, 'String')); %0.990; % [-] Spool Mechanical Efficiency
HeatTransfer ( Stage ) = 0.5; % [-] Heat transfer Fraction
SpoolToStage = 3; % [-] Spool coulping to stage 2
% Run Turbine function
[m_temp , T_temp , P_temp , PRt] = TurbineFunction (m(Stage -1) ,...
T(Stage -1) ,...
P(Stage -1) ,...
Eff( Stage ) ,...
Eff_mech ,...
W( SpoolToStage ) ,...
Cp_gas ,...
Gamma_gas );
% Store values
m( Stage ) = m_temp ;
T( Stage ) = T_temp ;
P( Stage ) = P_temp ;
%% Stage 6 - Exhaust
Stage = Stage + 1; % Define Engine Stage
StageStr { Stage } = char ('Exhaust ');
% Given
PR( Stage ) = 1; % [-] Pressure reduction
Eff( Stage ) = str2num(get(handles.eta_nozzle, 'String')); %1; % [-] Jet nozzle Efficiency
%%%%%%%%%%%%%%%
% Run Exhaust function
[m_temp , T_temp , P_temp ] = ExhaustFunction (m(Stage -1) ,...
T(Stage -1) ,...
P(Stage -1) ,...
PR( Stage ) ,...
Eff( Stage ) ,...
Gamma_gas );
% Store values
m( Stage ) = m_temp ;
T( Stage ) = T_temp ;
P( Stage ) = P_temp ;
%%%%%%%%%%%%%%%%%%%%%
%% Calculate Engine thrust
[F] = ThrustFunction (m( Stage ),P( Stage ), P(1) , T( Stage ), T(1) , Eff( Stage ), ...
Cp_gas , Gamma_gas );

assignin('base','Stage',Stage);
assignin('base','StageStr',StageStr);
assignin('base','Press',P);
assignin('base','Tmpr',T);
assignin('base','mf',m);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function gas_const_Callback(hObject, eventdata, handles)
% hObject    handle to gas_const (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gas_const as text
%        str2double(get(hObject,'String')) returns contents of gas_const as a double


% --- Executes during object creation, after setting all properties.
function gas_const_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gas_const (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cp_air_Callback(hObject, eventdata, handles)
% hObject    handle to cp_air (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cp_air as text
%        str2double(get(hObject,'String')) returns contents of cp_air as a double


% --- Executes during object creation, after setting all properties.
function cp_air_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cp_air (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cp_gas_Callback(hObject, eventdata, handles)
% hObject    handle to cp_gas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cp_gas as text
%        str2double(get(hObject,'String')) returns contents of cp_gas as a double


% --- Executes during object creation, after setting all properties.
function cp_gas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cp_gas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cp_mix_Callback(hObject, eventdata, handles)
% hObject    handle to cp_mix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cp_mix as text
%        str2double(get(hObject,'String')) returns contents of cp_mix as a double


% --- Executes during object creation, after setting all properties.
function cp_mix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cp_mix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_air_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_air (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma_air as text
%        str2double(get(hObject,'String')) returns contents of gamma_air as a double


% --- Executes during object creation, after setting all properties.
function gamma_air_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma_air (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_gas_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_gas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma_gas as text
%        str2double(get(hObject,'String')) returns contents of gamma_gas as a double


% --- Executes during object creation, after setting all properties.
function gamma_gas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma_gas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_mix_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_mix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma_mix as text
%        str2double(get(hObject,'String')) returns contents of gamma_mix as a double


% --- Executes during object creation, after setting all properties.
function gamma_mix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma_mix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fuel_hv_Callback(hObject, eventdata, handles)
% hObject    handle to fuel_hv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fuel_hv as text
%        str2double(get(hObject,'String')) returns contents of fuel_hv as a double


% --- Executes during object creation, after setting all properties.
function fuel_hv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fuel_hv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amb_rho_Callback(hObject, eventdata, handles)
% hObject    handle to amb_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amb_rho as text
%        str2double(get(hObject,'String')) returns contents of amb_rho as a double


% --- Executes during object creation, after setting all properties.
function amb_rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amb_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amb_temp_Callback(hObject, eventdata, handles)
% hObject    handle to amb_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amb_temp as text
%        str2double(get(hObject,'String')) returns contents of amb_temp as a double


% --- Executes during object creation, after setting all properties.
function amb_temp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amb_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amb_press_Callback(hObject, eventdata, handles)
% hObject    handle to amb_press (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amb_press as text
%        str2double(get(hObject,'String')) returns contents of amb_press as a double


% --- Executes during object creation, after setting all properties.
function amb_press_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amb_press (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_inlet_Callback(hObject, eventdata, handles)
% hObject    handle to eta_inlet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta_inlet as text
%        str2double(get(hObject,'String')) returns contents of eta_inlet as a double


% --- Executes during object creation, after setting all properties.
function eta_inlet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta_inlet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_burner_Callback(hObject, eventdata, handles)
% hObject    handle to eta_burner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta_burner as text
%        str2double(get(hObject,'String')) returns contents of eta_burner as a double


% --- Executes during object creation, after setting all properties.
function eta_burner_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta_burner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_comp_Callback(hObject, eventdata, handles)
% hObject    handle to eta_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta_comp as text
%        str2double(get(hObject,'String')) returns contents of eta_comp as a double


% --- Executes during object creation, after setting all properties.
function eta_comp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_nozzle_Callback(hObject, eventdata, handles)
% hObject    handle to eta_nozzle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta_nozzle as text
%        str2double(get(hObject,'String')) returns contents of eta_nozzle as a double


% --- Executes during object creation, after setting all properties.
function eta_nozzle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta_nozzle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_turb_Callback(hObject, eventdata, handles)
% hObject    handle to eta_turb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta_turb as text
%        str2double(get(hObject,'String')) returns contents of eta_turb as a double


% --- Executes during object creation, after setting all properties.
function eta_turb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta_turb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_mech_Callback(hObject, eventdata, handles)
% hObject    handle to eta_mech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta_mech as text
%        str2double(get(hObject,'String')) returns contents of eta_mech as a double


% --- Executes during object creation, after setting all properties.
function eta_mech_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta_mech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in press_var.
function press_var_Callback(hObject, eventdata, handles)
% hObject    handle to press_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of press_var
% --- P vs. Stage ---

% Create plot in axes 1
%var = 1;
%plot(handles.axes1,evalin('base','time'),evalin('base','deltae'))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes during object creation, after setting all properties.
function press_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to press_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in temp_var.
function temp_var_Callback(hObject, eventdata, handles)
% hObject    handle to temp_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of temp_var


% --- Executes during object creation, after setting all properties.
function temp_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temp_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function mass_flow_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mass_flow_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in mass_flow_var.
function mass_flow_var_Callback(hObject, eventdata, handles)
% hObject    handle to mass_flow_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mass_flow_var


% --- Executes on button press in show_graph.
function show_graph_Callback(hObject, eventdata, handles)
% hObject    handle to show_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_press_var = get(handles.press_var, 'Value');
show_temp_var = get(handles.temp_var, 'Value');
show_mass_flow_var = get(handles.mass_flow_var, 'Value');
%%%%%%%%% Pressure Variation %%%%%%%%%%%%%%%%
if(show_press_var == 1)
    figure (1)
    hold on
    p_plot = plot (evalin('base','Press'));
    set(p_plot ,'Color','blue','LineWidth',2)
    set(gca ,'XTick' ,1: evalin('base','Stage') ,'XTickLabel',evalin('base','StageStr'))
    title ('Pressure variation');
    xlabel ('Stage [-]');
    ylabel ('Pressure [Pa]');
    plot (0);
    axis auto
    grid on
    %imSaver.saveImage (gcf , 'PvsStage ');
    hold off
end
%%%%%%%% Temperature Variation %%%%%%%%%%%%%%%%%
if(show_temp_var == 1)
    figure (2)
    hold on
    t_plot = plot (evalin('base','Tmpr'));
    set(t_plot ,'Color','blue','LineWidth' ,2)
    set(gca ,'XTick' ,1: evalin('base','Stage') ,'XTickLabel',evalin('base','StageStr'))
    title ('Temperature variation ');
    xlabel ('Stage [-] ');
    ylabel ('Temperature [K]');
    plot (0);
    axis auto
    grid on
    %imSaver.saveImage (gcf , 'TvsStage ');
    hold off
end
%%%%%%%%%%%Mass Flow Variation %%%%%%%%%%%%%%
if(show_mass_flow_var == 1)
    figure (3)
    hold on
    mflow_plot = plot (1:1: length (evalin('base','mf')),evalin('base','mf'));
    set(mflow_plot ,'Color','blue','LineWidth' ,2)
    set(gca ,'XTick' ,1: evalin('base','Stage') ,'XTickLabel',evalin('base','StageStr'))
    title ('Massflow variation');
    xlabel ('Stage [-]');
    ylabel ('Massflow [Kg/s]');
    plot (19);
    axis auto
    grid on
    %imSaver.saveImage (gcf , 'TvsStage ');
    hold off
end

    
        
    

% --- Executes during object creation, after setting all properties.
function show_graph_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function air_flow_rate_Callback(hObject, eventdata, handles)
% hObject    handle to air_flow_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of air_flow_rate as text
%        str2double(get(hObject,'String')) returns contents of air_flow_rate as a double


% --- Executes during object creation, after setting all properties.
function air_flow_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to air_flow_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inlt_pr_Callback(hObject, eventdata, handles)
% hObject    handle to inlt_pr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inlt_pr as text
%        str2double(get(hObject,'String')) returns contents of inlt_pr as a double


% --- Executes during object creation, after setting all properties.
function inlt_pr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inlt_pr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotor_spd_Callback(hObject, eventdata, handles)
% hObject    handle to rotor_spd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotor_spd as text
%        str2double(get(hObject,'String')) returns contents of rotor_spd as a double


% --- Executes during object creation, after setting all properties.
function rotor_spd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotor_spd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fuel_flow_rate_Callback(hObject, eventdata, handles)
% hObject    handle to fuel_flow_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fuel_flow_rate as text
%        str2double(get(hObject,'String')) returns contents of fuel_flow_rate as a double


% --- Executes during object creation, after setting all properties.
function fuel_flow_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fuel_flow_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
