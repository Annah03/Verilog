module hw6 (output reg [4:0] count_out,
				input wire rst_n, preset, clk, up_down,
				input wire [4:0] count_in);
	always @ (posedge clk or negedge rst_n or posedge preset)
		begin
		if (!rst_n)
			begin
			count_out <= 4'b0000;
			end
		else if (preset)
			begin
			count_out <= count_in;
			end
		else if (up_down)
			begin 
			if (count_out % 2'd2 == 1'b0)
				begin
				count_out <= count_out + 1'd1; 
				end
			else
				begin 
				count_out <= count_out + 2'd2;
				end
			end
		else if (!up_down)
			begin
			if (count_out % 2'd2 == 1'b0)
				begin
				count_out <= count_out - 2'd2;
				end
			else
				begin 
				count_out <= count_out - 1'd1;
				end
			end
		end
endmodule 
				
			