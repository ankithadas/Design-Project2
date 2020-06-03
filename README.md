This repository contains all files used for Design Project 2

nonLinear.m : The full non-linear inverted pendulum function

jacobA.m: Computes the jacobian matrices at a given state

placeA.m : modified place function compatible for C++ code generation 

Main simulink models are found at DP2Model. Please run dp2script.m before running the simulink files.
Code for reference generator and pole placer is embedded in Simulink Files. 

If solver crashes due to convergence error, try running using ode45. 

All mathematical calculations can be found at Calculation.nb. If you don't use Mathematica, a pdf version is also available. 
