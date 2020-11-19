# TFE4152-DIC-Project
Git for project in TFE4152 (Design of integrated circuits) by Øyvind and Einar

The final delivered report can be viewed in the pdf, [TFE4152_Digital_Camera_Module_Group1](./TFE4152_Digital_Camera_Module_Group1.pdf).

## SPICE
All spice code was simulated using [AIM-SPICE](http://www.aimspice.com/) by Trond Ytterdal. 
This was exported to a txt-file, using the AIM-SPICE post-processor, for use with the MATLAB script [`plots.m`](./AIM-Spice/figures/plots.m)

## Verilog
To compile and simulate the SystemVerilog part of the project, [Icarus Verilog](http://iverilog.icarus.com/) was used.

`iverilog` does not automatically chooses the right compiler for SystemVerilog, the flag `-g2005-sv` was used to indicate that the 2005 SystemVerilog standard should be used. 

To view the timing diagrams from the simulation, use [GTKWave](http://gtkwave.sourceforge.net/).

