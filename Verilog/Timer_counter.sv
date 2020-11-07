module timer_counter (input logic clk,
                      input logic reset,
                      input logic enable,
                      input logic [4:0] init,
                      output logic exposure_done );
    logic [4:0] internal_count;
                      
    always @(posedge clk)
        if (reset) 
            begin         
                internal_count <= init; //load q with new values
                exposure_done <= 1;
            end
            
        else if (enable && (internal_count > 0)) 
            begin
                internal_count <= internal_count-1;  
            end
        
        assign check = (internal_count == 0) ? 1 : 0;
endmodule                     

