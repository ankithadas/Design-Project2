function [ F ] = ThrustFunction (m,P1 , P_0 , T, T_0 , Eff , Cp_gas , gamma )
% Calculates the thrust of an engine
% Calculate temperature variation
DeltaT = Eff*T *(1 -1/( P1/P_0 )^(( gamma -1)/ gamma ));
% Calculate exhaust velocity
C= (2* Cp_gas *( DeltaT ))^0.5;
% Calculate thrust
F = C * m;
end