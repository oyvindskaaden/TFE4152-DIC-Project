`include "timer_counter.sv"

module timer_counter_tb();

	logic clk, ex_set, ex_start;
	wire ex_done;
	logic [4:0] ex_init;

	timer_counter testbench(clk, ex_set, ex_start, ex_init, ex_done);


	always begin
		#1 clk = !clk;
	end

	initial begin
		$dumpfile("outfiles/timer_counter/timer_counter_tb.vcd");
		$dumpvars(0, testbench);

		{clk, ex_start, ex_set} = 3'b100;
		ex_init = 5'd10;
		#2 {ex_start, ex_set} = 2'b01;
		#2 {ex_start, ex_set} = 2'b10;
	end

	always @(posedge ex_done) begin
		#2 {ex_start, ex_set} = 2'b00;
		#4 {ex_start, ex_set} = 2'b01;
		#4 $finish;
	end
endmodule