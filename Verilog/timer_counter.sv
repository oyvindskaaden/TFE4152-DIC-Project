module timer_counter (
	input 	logic					clk,
	input 	logic 				setTime,
	input 	logic 				enable,
	input 	logic [4:0] 	init,
	output	wire 					ex_done 
);

	logic [4:0] internal_count;

	always @(posedge clk)
		if (setTime)
			internal_count = init + 1; //load internal_count with new values, add one because the way it counts
		else if (enable && (internal_count > 0))
			internal_count = internal_count-1;

		assign ex_done = (internal_count == 5'b0) ? 1 : 0;

endmodule



module timer_counter_tb();

	logic clk, setTime, enable;
	wire ex_done;
	logic [4:0] init;

	timer_counter testbench(clk, setTime, enable, init, ex_done);


	always begin
		#1 clk = !clk;
	end

	initial begin
		$dumpfile("outfiles/timer_counter/timer_counter_tb.vcd");
		$dumpvars();

		{clk, enable, setTime} = 3'b100;
		init = 5'd10;
		#2 {enable, setTime} = 2'b01;
		#2 {enable, setTime} = 2'b10;
	end

	always @(posedge ex_done) begin
		#2 {enable, setTime} = 2'b00;
		#4 {enable, setTime} = 2'b01;
		#4 $finish;
	end
endmodule