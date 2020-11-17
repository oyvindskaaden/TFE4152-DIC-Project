`include "CTRL_ex_time.sv" 

module CTRL_ex_time_tb();
  
  logic clk, reset, ex_increase, ex_decrease;
  wire [4:0] ex_init;

  CTRL_ex_time testbench(clk, reset, ex_increase, ex_decrease, ex_init);

  always begin
    #1 clk = !clk;
  end

  initial begin
    $dumpfile("outfiles/CTRL_ex_time/CTRL_ex_time_tb.vcd");
    $dumpvars(0, testbench);

    {clk, reset, ex_increase, ex_decrease} = 4'b1000; // Start with clock on

    // Test counting;
    #4 ex_increase = 1;
    #10 ex_increase = 0;
    #4 ex_decrease = 1;
    #20 ex_decrease = 0;

    // Test if both buttons is high
    #4 {ex_increase, ex_decrease} = 2'b11;
    #4 {ex_increase, ex_decrease} = 2'b00;

    // Test reset
    #2 reset = 1;
    #2 reset = 0;

    // Test of the upper limit
    #2 ex_increase = 1;
    #30 ex_increase = 0; 

    // Reset before testing lower limit
    #2 reset = 1;
    #2 reset = 0;

    // Test of the lower limit
    #2 ex_decrease = 1;
    #30 ex_decrease = 0; 

    // Check if all is high
    #4 {reset, ex_increase, ex_decrease} = 3'b111;
    #4 {reset, ex_increase, ex_decrease} = 3'b000;
    #2 $finish;
  end


endmodule