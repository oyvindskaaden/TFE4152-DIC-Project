`include "CTRL_ex_time.sv"
`include "FSM_ex_control.sv"
`include "timer_counter.sv"

module re_control(
	input wire clk,
	input wire reset,
	input wire init,

	input wire ex_increase,
	input wire ex_decrease, 

	output wire nre1,
  output wire nre2,
  output wire adc,
  output wire expose,
  output wire erase
);

	wire ex_done;
	wire ex_start;
	wire ex_set;

	wire [4:0] ex_init;


	FSM_ex_control fsm_ex_control(clk, reset, init, ex_done, ex_start, ex_set, nre1, nre2, adc, expose, erase);
	CTRL_ex_time ctrl_ex_time (clk, reset, ex_increase, ex_decrease, ex_init);
	timer_counter ex_timer(clk, ex_set, ex_start, ex_init, ex_done);
	
endmodule // re_control