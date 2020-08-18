module mux(
			input sel,
			input [3:0] data1,data2,
			output[3:0] data_out);
	assign data_out=(sel==0)?data1:data2;
endmodule