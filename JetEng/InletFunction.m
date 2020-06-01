function [ m2 , T2 , p2 ] = InletFunction ( m1 , T1 , p1 , PR , Eff , gamma )
% Calculates the massflow , temperature and pressure of an inlet with a given
% massflow , pressure , pressure ratio , efficiency and using the gamma of air
% Calculate Pressure
p2=PR*p1;
% Calculate Temperature using Isentropic efficiency
T2=T1 *(1 - Eff *(1 -( p2/p1 )^(( gamma -1)/ gamma )));
% Massflow remains constant during inlet
m2=m1;
end