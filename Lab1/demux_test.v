`timescale 1ns / 1ps
module demux_test ;

    reg [1:0]s_in, y_in;
    wire [3:0]z_out;
    
demux demux_1 (
    .s(s_in),
    .y(y_in),
    .z(z_out)
    );
    
    integer i;
    reg [1 : 0]test_s;
    
    initial begin
    
        for (i = 0; i < 4; i = i + 1) begin
			test_s = i;
            s_in = test_s;
			y_in = 1
            
            #10
            
            if ( z_out[i] == y_in ) begin
                $display ( "The adder output is correct!!! a_in=%b, b_in=%b, c_in=%b, c_out=%b, s_out=%b" , a_in , b_in , c_in, c_out, s_out);
            end else begin
                $display ( "The adder output is wrong!!! a_in=%b, b_in=%b, c_in=%b, c_out=%b, s_out=%b, expect=%b", a_in , b_in , c_in, c_out, s_out, expected_val) ;
            end
        end
        #10 $stop;
        
    end
    
endmodule