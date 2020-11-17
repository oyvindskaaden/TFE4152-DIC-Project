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

	always begin
		#1 clk = !clk;
	end

	initial begin
		$dumpfile("outfiles/re_control/re_control_tb.vcd");
		$dumpvars(0, testbench);

		{clk, reset, init, ex_increase, ex_decrease} = 5'b10000;

		#2 reset = 1;
		#2 reset = 0;

		#2 ex_decrease = 1;
		#12 ex_decrease = 0;

		#2 init = 1;
		#2 init = 0;

		#46 $finish; 
	end


endmodule