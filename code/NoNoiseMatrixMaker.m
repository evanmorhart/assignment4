function [G, C, F] =  NoNiseMatrixMaker(type, resistVals, capVals, indVals, iGain)
%%NoNoiseMatrixMaker() Creates the G, C, and F matrices used to describe
%	the circuit in part 1 of assignment 4 
%		INPUTS:
%			resistVals - column vector of resistor values
%			capVals - column vector of capacitor values
%		OUTPUTS:
%			G - the linear matrix describing the problem
%			C - the time varying matrix
%			F - The solution vector

	conductanceVals = 1./resistVals;

    G = sparse(8,8);
    C = sparse(8,8);
    F = sparse(8,1);
    
    if(strcmp(type, 'AC'))
        %Equation for Node 1
        G(1,1) = conductanceVals(1);
        G(1,2) = -conductanceVals(1);
        G(1,3) = -1;

        C(1,1) = capVals(1);
        C(1,2) = -capVals(1);


        %Equation for Node 2
        G(2,1) = -conductanceVals(1);
        G(2,2) = conductanceVals(1)+conductanceVals(2);

        C(2,1) = -capVals(1);
        C(2,2) = capVals(1)+1./indVals(1);
        C(2,4) = -1./indVals(1);


        %Equation for Node 3
        G(3,4) = 1;

        C(3,2) = -1./indVals(1);
        C(3,4) = 1./indVals(1);

        %Equation for Node 4
        G(4,5) = conductanceVals(4);
        G(4,6) = -conductanceVals(4);
        G(4,7) = -1;

        %Equation for Node 5
        G(5,5) = -conductanceVals(4);
        G(5,6) = conductanceVals(4)+conductanceVals(5);

        %Input Voltage Source Equation
        G(6,1) = 1;

        %Inductor Current Equation
        G(7,4) = iGain.*conductanceVals(3);
        G(7,5) = 1;
    elseif(strcmp(type,'DC'))
        %6 Equations, Inductor is short, cap is open
        %Node 1 
        G(1,1) = conductanceVals(1);
        G(1,2) = -conductanceVals(1);
        G(1,3) = -1;

        %Node 2
        G(2,1) = -conductanceVals(1);
        G(2,2) = conductanceVals(1)+conductanceVals(2)+conductanceVals(3);

        %Node 3
        G(3,4) = conductanceVals(4);
        G(3,5) = -conductanceVals(4);
        G(3,6) = 1;

        %Output node
        G(4,4) = -conductanceVals(4);
        G(4,5) = conductanceVals(4)+conductanceVals(5);

        %Input voltage
        G(5,1) = 1;

        %Voltage source
        G(6,2) = -iGain.*conductanceVals(3);
        G(6,4) = 1;
    end
end