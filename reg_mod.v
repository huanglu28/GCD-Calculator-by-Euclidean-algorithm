module reg_mod(
			input clk,
			input clr,
			input ld,
			input [3:0] data,
			output reg [3:0] outdata);	
	always @(posedge clk) begin
		if (clr==1) begin
			outdata=0;
		end
		else begin	
			if(ld==1) begin
				outdata=data;
			end
			else begin
				outdata=outdata;
			end
		end
	end
endmodule