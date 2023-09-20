`timescale 1ns / 1ps
module demux_test ;

    reg s_in0, s_in1;
    reg y_in;
    wire [3:0]z_out;
    
demux demux_1 (
    .s0(s_in0),
    .s1(s_in1),
    .y(y_in),
    .z(z_out)
    );
    
    integer i, j;
    reg [2 : 0]test_s;
    integer is_correct;
    
    initial begin
    
        for (i = 0; i < 8; i = i + 1) begin
			test_s = i;
            s_in0 = test_s[0];
            s_in1 = test_s[1];
			y_in  = test_s[2];
			is_correct = 0;
            # 10
            for (j = 0; j < 4; j = j + 1) begin
                if (j == i)
                    if (z_out[j] != y_in) is_correct = is_correct + 1;
                else
                    if (z_out[j] != 0) is_correct = is_correct + 1;
            end
            if (is_correct > 1)
                $display ( "The adder output is wrong!!! y=%b, s_0=%b, s_1=%b, z_out_0=%b, z_out_1=%b, z_out_2=%b, z_out_3=%b", y_in, s_in1, s_in0, z_out[0], z_out[1], z_out[2], z_out[3]) ;
            else
                $display ( "The adder output is correct!!! y=%b, s_0=%b, s_1=%b, z_out_0=%b, z_out_1=%b, z_out_2=%b, z_out_3=%b" , y_in, s_in1, s_in0, z_out[0], z_out[1], z_out[2], z_out[3]);
        end
        #10 $stop;
        
    end
    
endmodule