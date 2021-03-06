module gcd(
		input clk,
		input clr,
		input go,
		input [3:0] xin,
		input [3:0] yin,
		output [3:0] gcd,
		inout wire xmsel,
		inout wire ymsel,
		inout wire xld,
		inout wire yld,
		inout wire gld,
		inout wire eqflg,
		inout wire ltflg);
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
