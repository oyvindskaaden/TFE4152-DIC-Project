module FSM_ex_control(
  input logic clk,
  input logic reset,
  input logic init,

  input logic	ex_done,
  output logic ex_start,
  output logic ex_set,

  output logic nre1,
  output logic nre2,
  output logic adc,
  output logic expose,
  output logic erase
);

  enum {IDLE, EXPOSURE, READOUT, ILLEGAL} current_state;

  logic [3:0] read_state = 0;

  always @(posedge clk) begin

    if (init && current_state == 0)begin
      current_state = EXPOSURE;
    end

    if (reset)
      current_state = ILLEGAL;
    
    case (current_state)
      0: begin
        {ex_start, ex_set} = 2'b01;
        {nre1, nre2, adc, expose, erase} = 5'b11001;
      end
      1: begin
        {ex_start, ex_set} = 2'b10;
        {nre1, nre2, adc, expose, erase} = 5'b11010;
      end
      2: begin
        if (reset) begin
          current_state = IDLE;
          {nre1, nre2, adc, expose, erase} = 5'b11001;
        end
          
        
        expose = 0;
        case (read_state)
          0: {nre1, nre2, adc} = 3'b110;
          1: {nre1, nre2, adc} = 3'b010;
          2: {nre1, nre2, adc} = 3'b011;
          3: {nre1, nre2, adc} = 3'b010;
          4: {nre1, nre2, adc} = 3'b110;
          5: {nre1, nre2, adc} = 3'b100;
          6: {nre1, nre2, adc} = 3'b101;
          7: {nre1, nre2, adc} = 3'b100;
          8: begin
            {nre1, nre2, adc} = 3'b110; 
            current_state = IDLE;
          end
          default: {nre1, nre2, adc} = 3'b110;
        endcase

        read_state++;
      end
      3: begin
        current_state = IDLE;
        {ex_start, ex_set} = 2'b01;
        {nre1, nre2, adc, expose, erase} = 5'b11001;
      end
    endcase
  end 


  always @(posedge ex_done)
    if (current_state == 1)
      current_state = READOUT;

  initial begin
    current_state = IDLE;
    {ex_start, ex_set} = 2'b01;
    {nre1, nre2, adc, expose, erase} = 5'b11001;
  end

endmodule