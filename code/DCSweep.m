function DCSweep(G, C, F)
%%DCSweep(G, C, F) Carries out the DC Sweep results on given G, C, F matrices
%		INPUTS:
%			G - Conduction matrix
%			C - Capacitor matrix
%			F - Result vector
%		OUTPUTS:
%			None
	inVoltSpace = linspace(-10, 10, 1000);

	for i = 1:length(inVoltSpace)
		F(5,1) = inVoltSpace(i);
		V(:,i) = G\F;
		V3Space(i) = V(2,i);
		VoutSpace(i) = V(5,i);
	end

	figure("renderer", "Painters", "Position", [10 10 1100 600])
	plot(inVoltSpace, V3Space);
	title("Voltage at Node 3 of DC Simulation", 'interpreter', 'latex')
	xlabel("Input Voltage (V)", 'interpreter', 'latex')
	ylabel("Node Voltage (V)", 'interpreter', 'latex')
	set(gca, 'FontSize', 17)
	grid on

	figure("renderer", "Painters", "Position", [10 10 1100 600])
	plot(inVoltSpace, VoutSpace);
	title("DC Output Voltage of Provided Circuit Schematic", 'interpreter', 'latex')
	xlabel("Input Voltage (V)", 'interpreter', 'latex')
	ylabel("Output Voltage (V)", 'interpreter', 'latex')
	set(gca, 'FontSize', 17)
	grid on

end