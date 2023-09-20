`timescale 1ns / 1ps
module demux(
    input [1:0]s,
    input y,
    output [3:0]z
    );
    
    wire [1:0]ns, ny, ns01, dns01, s01, ds01, f1, f2, df1, df2;
    nor(ns[0], s[0], s[0]);
	nor(ns[1], s[1], s[1]);
	nor(ny, y, y);
	
	nor(s01, s[0], s[1]);
	not(ds01, s01, s01);
	nor(z[0], ny, ds01);
	
	nor(f1, ny, ns[0]);
	nor(df1, f1, f1);
	nor(z[1], s[0], df1);
	
	nor(f2, ny, ns[1]);
	nor(df2, f2, f2);
	nor(z[2], s[1], df2);
	
	not(ns01, ns[0], ns[1]);
	not(dns01, ns01, ns01);
	nor(z[3], ny, dns01));
	
    nor(y1, A, B);
    nor(y2, y1, A);
    nor(y3, y1, B);
    nor(y4, y2, y3);
    nor(y5, y4, CIN);
    nor(y6, y4, y5);
    nor(y7, y5, CIN);
    nor(COUT, y1, y5);
    nor(S, y6, y7);
    
    
endmodule