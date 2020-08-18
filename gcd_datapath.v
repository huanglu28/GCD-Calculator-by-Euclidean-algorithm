module gcd_datapath(
		input wire clk, //时钟信号
		input wire clr, //清零信号
		input wire xmsel, //控制x值
		input wire ymsel, //控制y值
		input wire xld,   //控制x寄存器
		input wire yld,   //控制y寄存器
		input wire gld,   //控制输出寄存器
		input wire [3:0] xin, //输入x
		input wire [3:0] yin, //输入y
		output wire eqflg, //判断xy是否相等
		output wire ltflg,  //判断x是否小于y
		output wire [3:0] gcd
		);
		
	wire [3:0] xmy,ymx,xl,yl,x,y;
	reg lt,eq;
	
	assign xmy=x-y;
	assign ymx=y-x;


	//xmux
	mux xmux(.sel(xmsel),.data1(xmy),.data2(xin),.data_out(xl));
	//ymux
	mux ymux(.sel(ymsel),.data1(ymx),.data2(yin),.data_out(yl));
	
	//xreg
   reg_mod xreg(.clk(clk),.clr(clr),.ld(xld),.data(xl),.outdata(x));	
	//yreg
	reg_mod yreg(.clk(clk),.clr(clr),.ld(yld),.data(yl),.outdata(y));	
	
	//equal and less than
	always @(x or y) begin
		if (x==y) begin
			eq=1;
		end
		else begin
			eq=0;
		end
	end
	always @(x or y) begin
		if (x<y) begin
			lt=1;
		end
		else begin
			lt=0;
		end
	end
	
	assign ltflg=lt;
	assign eqflg=eq;
	

	//greg
	reg_mod greg(.clk(clk),.clr(clr),.ld(gld),.data(x),.outdata(gcd));	
	
	//assign gcd=gcd_out;
endmodule