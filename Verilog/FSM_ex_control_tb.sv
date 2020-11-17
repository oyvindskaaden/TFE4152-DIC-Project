`include "FSM_ex_control.sv"

module FSM_ex_control_tb();

  logic clk, reset, init;
  logic	ex_done;
  wire ex_start, ex_set;

  wire nre1, nre2, adc, expose, erase;

  FSM_ex_control testbench(clk, reset, init, ex_done, ex_start, ex_set, nre1, nre2, adc, expose, erase);


  always begin
    #1 clk = !clk;
  end

  initial begin
    $dumpfile("outfiles/FSM_ex_control/FSM_ex_control_tb.vcd");
    $dumpvars(0, testbench);

    {clk, reset, init, ex_done} = 4'b1000;

    #2 reset = 1;
    #2 reset = 0;

    #2 init = 1;
    #2 init = 0;

    // Simulate exposure time, set it to exposure time * 2 - 2
    #8 ex_done = 1;
    #2 ex_done = 0;

    #20 // Time of readout
    #2 $finish;


  end


endmodule

