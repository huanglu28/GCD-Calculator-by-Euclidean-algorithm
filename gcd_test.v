`timescale 1ns/1ps  
module gcd_test;
	reg clk,clr,go;
	wire [3:0] gcd;
	reg [3:0] xin;
	reg [3:0] yin;
	always begin
	#5 clk<=~clk;
	end
	gcd_module gcd1(.clk(clk),.clr(clr),.go(go),.xin(xin),.yin(yin),.gcd(gcd));
	initial begin
		clk<=0;
		clr<=1;
		go<=0;
		xin<=4'b0001;
		yin<=4'b0001;
		#15;
		clr<=0;
		#10;
		go<=1;
		#10;
		xin<=4'b1111;
		yin<=4'b0011;
	end
	
endmodule