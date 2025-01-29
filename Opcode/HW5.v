module HW5 (input wire [0:15] IR,
				input wire clk,
				output reg [0:3] Opcode,
				output reg [0:3] REG1,
				output reg [0:3] REG2,
				output reg [0:3] REG3,
				output reg special);
	reg RST;
	always @ (posedge clk) begin
		if (!RST)
		begin
		Opcode <= 4'b0000;
		REG1 <= 4'b0000;
		REG2 <= 4'b0000;
		REG3 <= 4'b0000;
		end
		else
		begin 
		Opcode <= IR[0:3];
			if (Opcode >= 2'd0 & Opcode <= 2'd3)
				begin
				special <= 1;
				end
		REG1 <= IR[4:7];
		REG2 <= IR[8:11];
		REG3 <= IR[12:15];
		end 
	end
endmodule
	
	