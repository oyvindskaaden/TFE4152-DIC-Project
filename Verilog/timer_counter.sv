module timer_counter (
  input logic clk,
  input logic ex_set,
  input logic ex_start,
  input logic [4:0] ex_init,
  output wire ex_done 
);

  logic [4:0] internal_count;

  always @(posedge clk)
    if (ex_set)
      internal_count = ex_init; //load internal_count with new values, add one because the way it counts
    else if (ex_start && (internal_count > 0))
      internal_count = internal_count - 1; // For each clock and ex_start, decrement one

    // Set the ex_done output to 1 if the counter is 0
    assign ex_done = (internal_count == 5'b0) ? 1 : 0;

endmodule