`include "re_control.sv"

module re_control_tb();
	logic clk;
	logic reset;
	logic init;

	logic ex_increase;
	logic ex_decrease; 

	wire nre1;
  wire nre2;
  wire adc;
  wire expose;
  wire erase;

	re_control testbench(clk, reset, init, ex_increase, ex_decrease, nre1, nre2, adc, expose, erase);

	// Clock
	always begin
		#1 clk = !clk;
	end

	initial begin
		$dumpfile("outfiles/re_control/re_control_tb.vcd");
		$dumpvars(0, testbench);

		// Starting with clock high
		{clk, reset, init, ex_increase, ex_decrease} = 5'b10000;

		// Reset after one pulse
		#2 reset = 1;
		#2 reset = 0;

		// Decrease exposure from 16 down to 10
		#2 ex_decrease = 1;
		#12 ex_decrease = 0;

		// Start sequence with init pulse
		#2 init = 1;
		#2 init = 0;

		// Stop simulation
		#46 $finish; 
	end


endmodule