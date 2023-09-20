`timescale 1ns / 1ps
module demux(
    input s0,
    input s1,
    input y,
    output [3:0]z
    );
    
    wire ns0, ns1;
    wire ny, ns01, dns01, s01, ds01, f1, f2, df1, df2;
    nor(ns0, s0, s0);
	nor(ns1, s1, s1);
	nor(ny, y, y);
	
	nor(s01, s0, s1);
	nor(ds01, s01, s01);
	nor(z[0], ny, ds01);
	
	nor(f1, ny, ns0);
	nor(df1, f1, f1);
	nor(z[1], s1, df1);
	
	nor(f2, ny, ns1);
	nor(df2, f2, f2);
	nor(z[2], s0, df2);
	
	nor(ns01, ns0, ns1);
	nor(dns01, ns01, ns01);
    nor(z[3], ny, dns01);
    
    
endmodule