function [ m2 ,T2 ,p2 ] = CombustorFunction ( m1 , T1 , p1 , mfuel , p_eff , Eff , Hf , Cpg , gamma )
% UNTITLED4 Summary of this function goes here
% Detailed explanation goes here
m2=m1+ mfuel ;
p2= p_eff *p1;
DeltaT =Eff* mfuel *Hf /( m1*Cpg );
T2=T1+ DeltaT ;
end