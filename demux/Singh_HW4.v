module Singh_HW4 (output reg d0, d1, d2, d3,
						input wire a, b, muxsel, clk,
						input wire [1:0]demuxsel);
	wire out1, sel;
	wire [0:3]out2;
	
assign out1 = (a && ~muxsel) || (b && muxsel);

assign out2[0] = out1 && ~demuxsel[0] && ~demuxsel[1],
		 out2[1] = out1 && demuxsel[0] && ~demuxsel[1],
		 out2[2] = out1 && ~demuxsel[0] && demuxsel[1],
		 out2[3] = out1 && demuxsel[0] && demuxsel[1];
		
		
//specified clock edge as negedge since none given		 
always @ (negedge clk) begin
		d0 <= out2[0];
		d1 <= out2[1];
		d2 <= out2[2];
		d3 <= out2[3];
end
endmodule