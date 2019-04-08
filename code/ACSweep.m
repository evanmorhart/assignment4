function ACSweep(G, C, F)
%%DCSweep(G, C, F) Carries out the DC Sweep results on given G, C, F matrices
%		INPUTS:
%			G - Conduction matrix
%			C - Capacitor matrix
%			F - Result vector
%		OUTPUTS:
%			None
	omegaSpace = linspace(1E-6, 100, 10000);

	for i = 1:length(omegaSpace)
		F(6,1) = 1; %Input voltage equal to one
		V(:,i) = (G+ C.*1i.*omegaSpace(i))\F;
		VoutSpace(i) = V(6,i);
	end



	figure("renderer", "Painters", "Position", [10 10 1100 600])
	plot(omegaSpace, VoutSpace);
	title("Voltage at Node 3 of DC Simulation", 'interpreter', 'latex')
	xlabel("Input Voltage (V)", 'interpreter', 'latex')
	ylabel("Node Voltage (V)", 'interpreter', 'latex')
	set(gca, 'FontSize', 17)
	grid on

	% figure("renderer", "Painters", "Position", [10 10 1100 600])
	% plot(inVoltSpace, VoutSpace);
	% title("DC Output Voltage of Provided Circuit Schematic", 'interpreter', 'latex')
	% xlabel("Input Voltage (V)", 'interpreter', 'latex')
	% ylabel("Output Voltage (V)", 'interpreter', 'latex')
	% set(gca, 'FontSize', 17)
	% grid on

end