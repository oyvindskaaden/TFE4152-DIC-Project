module timer_counter (
	input logic clk,
	input logic ex_set,
	input logic enable,
	input logic [4:0] init,
	output wire ex_done 
);

	logic [4:0] internal_count;

	always @(posedge clk)
		if (ex_set)
			internal_count = init + 1; //load internal_count with new values, add one because the way it counts
		else if (enable && (internal_count > 0))
			internal_count = internal_count-1;

		assign ex_done = (internal_count == 5'b0) ? 1 : 0;

endmodule



module timer_counter_tb();

	logic clk, ex_set, enable;
	wire ex_done;
	logic [4:0] init;

	timer_counter testbench(clk, ex_set, enable, init, ex_done);


	always begin
		#1 clk = !clk;
	end

	initial begin
		$dumpfile("outfiles/timer_counter/timer_counter_tb.vcd");
		//$dumpvars();

		{clk, enable, ex_set} = 3'b100;
		init = 5'd10;
		#2 {enable, ex_set} = 2'b01;
		#2 {enable, ex_set} = 2'b10;
	end

	always @(posedge ex_done) begin
		#2 {enable, ex_set} = 2'b00;
		#4 {enable, ex_set} = 2'b01;
		#4 $finish;
	end
endmodule