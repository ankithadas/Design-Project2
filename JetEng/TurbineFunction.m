function [ m2 , T2 , p2 , PR ] = TurbineFunction (m1 , T1 , p1 , Eff_is , Eff_mech , W ,...
Cpg , gamma )
% Calculates the massflow , temperature and pressure of a turbine with a given
% massflow , pressure , Mechanical and isentropic efficiencies , the work done ,
% the cp of gass and using the gamma of gas
% Calculate temperature difference due to work done
DeltaT =W/( Eff_mech *m1*Cpg);
% Calculate temperature
T2=T1 - DeltaT;
% Calculate pressure using isentropic equations
p2=p1 *(1 -(1 - T2/T1 )/ Eff_is )^( gamma /( gamma -1));
% massflow remains constant
m2=m1;
PR=p2/p1;
end