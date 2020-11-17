`include "timer_counter.sv"

module timer_counter_tb();

	logic clk, ex_set, ex_start;
	wire ex_done;
	logic [4:0] ex_init;

	timer_counter testbench(clk, ex_set, ex_start, ex_init, ex_done);

	// Clock
	always begin
		#1 clk = !clk;
	end

	initial begin
		$dumpfile("outfiles/timer_counter/timer_counter_tb.vcd");
		$dumpvars(0, testbench);

		// Start with clock high 
		{clk, ex_start, ex_set} = 3'b100;
		// Set start value for counter, usually controlled by CTRL_ex_time
		// Here we count down from decimal 10
		ex_init = 5'd10;
		// Pulse ex_set to set value to count down from
		#2 {ex_start, ex_set} = 2'b01;
		#2 {ex_start, ex_set} = 2'b10;
	end

	// When the ex_done is set high, stop the simulation
	always @(posedge ex_done) begin
		#2 {ex_start, ex_set} = 2'b00;
		#4 {ex_start, ex_set} = 2'b01;
		#4 $finish;
	end
endmodule