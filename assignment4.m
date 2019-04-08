clear
close all
clc
addpath(strcat(fileparts(mfilename('fullpath')), '\code'));
format compact

%Index corresponds to resist value so resistVals(1) is R1
resistVals = [1; 2; 10; 0.1; 1000];
capVals = [0.25];
indVals = [0.2];
iGain = 100;

%Generate the problem matrices 
[Gdc, Cdc, Fdc] = NoNoiseMatrixMaker('DC', resistVals, capVals, indVals, iGain);
[Gac, Cac, Fac] = NoNoiseMatrixMaker('AC', resistVals, capVals, indVals, iGain);

DCSweep(Gdc,Cdc,Fdc);
ACSweep(Gac,Cac,Fac);