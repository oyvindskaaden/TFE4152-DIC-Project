module CTRL_ex_time(
  input logic clk,
  input logic reset,
  input logic ex_increase,
  input logic  ex_decrease,
  output logic [4:0] ex_init
);

  always @(posedge clk)
    if (reset)
      ex_init <= 5'd16; // If reset, set it to the middle of range [2,30]
    else if (ex_increase && !ex_decrease && ex_init < 5'd30)
      ex_init <= ex_init + 1; // Increase if ex_increase and ex_init < 30
    else if (ex_decrease && !ex_increase && ex_init > 5'd2)
      ex_init <= ex_init - 1; // Decrease if ex_decrease and ex_init > 2

  initial begin
    ex_init <= 5'd16;
  end

endmodule