function [ m2 , T2 , p2 ] = ExhaustFunction ( m1 , T1 , p1 , PR , Eff , gamma )
% Calculates the massflow , temperature and pressure of an exhaust with a given
% massflow , pressure , pressure ratio , efficiency and using the gamma of gas
% Calculate Pressure
p2=PR*p1;
% Calculate Exhaust Temperature using isentropic efficiency
T2=T1 *(1 - Eff *(1 -( p2/p1 )^(( gamma -1)/ gamma )));
% Exhaust massflow is the same as engine massflow
m2=m1;
end