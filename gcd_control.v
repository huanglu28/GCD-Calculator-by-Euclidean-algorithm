module gcd_control(
	input wire clk,
	input wire clr,
	input wire go,
	input wire eqflg,
	input wire ltflg,
	output wire xmsel,
	output wire ymsel,
	output wire xld,
	output wire yld,
	output wire gld);

	reg[2:0] current_state,next_state;
	reg xld_temp,yld_temp,gld_temp,xmsel_temp,ymsel_temp;
	assign xld=xld_temp;
	assign yld=yld_temp;
	assign gld=gld_temp;
	assign xmsel=xmsel_temp;
	assign ymsel=ymsel_temp;
	
	parameter start=3'b000,
				 inputl=3'b001,
				 isequ=3'b010,
				 done=3'b011,
				 isless=3'b100,
				 updatex=3'b101,
				 updatey=3'b110;
	always@(posedge clk) begin
		if (clr==1) begin
			current_state=start;
		end
		else begin
			current_state=next_state;
		end
	end
	
	always@(current_state) begin
		xld_temp=0;
		yld_temp=0;
		gld_temp=0;
		xmsel_temp=0;
		ymsel_temp=0;
		case(current_state)
			start:
				if (go==0) begin
					next_state=start;
				end
				else begin
					next_state=inputl;
				end
			inputl:
				begin
				next_state=isequ;
				xld_temp=1;
				yld_temp=1;
				//gld_temp=1;
				xmsel_temp=1;
				ymsel_temp=1;
				end
			isequ:
			begin
				if (eqflg==1) begin
					next_state=done;
				end
				else begin
					next_state=isless;
				end
			end
			isless:
				if (ltflg==1) begin
					next_state=updatey;
				end
				else begin
					next_state=updatex;
				end
			updatey:
			begin
				xld_temp=0;
				yld_temp=1;
				ymsel_temp=0;
				
				next_state=isequ;
			end
			updatex:
			begin
				yld_temp=0;
				xld_temp=1;
				xmsel_temp=0;
				next_state=isequ;
			end
			done:
			begin
				next_state=done;
				gld_temp=1;
			end
		endcase
	end

endmodule