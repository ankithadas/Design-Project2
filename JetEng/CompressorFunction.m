function [ m2 , T2 , p2 , W] = CompressorFunction ( m1 , T1 , p1 ,PR , Eff , gamma , Cpa )
% Calculates the massflow , temperature and pressure of a compressor with a
% given massflow , pressure , pressure ratio , efficiency and using the gamma
% and CP of air.
% Calculate Pressure
p2=PR*p1;
% Calculate Temperature using Isentropic efficiency
T2=T1 *(1+(1/ Eff )*(( p2/p1 )^(( gamma -1)/ gamma ) -1));
% Massflow remains constant during compression
m2=m1;
% Calculate work done by the compressor
W=m1*Cpa *(T2 -T1 );
end