module gcd_module(
		input clk,
		input clr,
		input go,
		input [3:0] xin,
		input [3:0] yin,
		output [3:0] gcd);
	wire xmsel,ymsel,xld,yld,gld,eqflg,ltflg;
	gcd_datapath gd(.clk(clk),
			          .clr(clr),
						 .xmsel(xmsel),
						 .ymsel(ymsel),
						 .xld(xld),
						 .yld(yld),
						 .gld(gld),
						 .xin(xin),
						 .yin(yin),
						 .eqflg(eqflg),
						 .ltflg(ltflg),
						 .gcd(gcd)
						 );
	gcd_control gc(.clk(clk),
						.clr(clr),
						.go(go),
						.eqflg(eqflg),
						.ltflg(ltflg),
						.xmsel(xmsel),
						.ymsel(ymsel),
						.xld(xld),
						.yld(yld),
						.gld(gld)
						);
endmodule
