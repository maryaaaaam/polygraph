`timescale 1ns / 1ps
module detector(	input clk,
		input[9:0] bloodP,
		input[9:0] breathR,
		input[9:0] heartB,
		input[9:0] age,
		output reg alarm,
		output reg BP,
		output reg BR,
		output reg HB);
		
	always @(posedge clk)
	begin
		alarm =0;
		BP=0;
		BR=0;
		HB=0;
		if (age < 20)
		begin
			if (bloodP > 123)
			begin
				BP = 1;
				if(breathR > 20) begin
					alarm = 1;
					BR=1;
				end
				if(heartB > 85) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if (breathR > 20) begin
				BR=1;
				if(heartB > 85) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if (heartB > 85) begin
				HB=1;
			end
		end		
		
		else if (age <= 30)
		begin
			if (bloodP > 128)
			begin
				BP = 1;
				if(breathR > 18) begin
					alarm = 1;
					BR=1;
				end
				if(heartB > 75) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if (breathR > 18) begin
				BR=1;
				if(heartB > 75) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if(heartB > 75) HB=1;
		end


		else if (age <= 60)
		begin
			if (bloodP > 130)
			begin
				BP = 1;
				if(breathR > 16) begin
					alarm = 1;
					BR=1;
				end
				if(heartB > 70) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if (breathR > 16) begin
				BR=1;
				if(heartB > 70) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if(heartB > 70) HB=1;
		end
		
		else begin
			if (bloodP > 134)
			begin
				BP = 1;
				if(breathR > 18) begin
					alarm = 1;
					BR=1;
				end
				if(heartB > 65) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if (breathR > 18) begin
				BR=1;
				if(heartB > 65) begin
					alarm = 1;
					HB = 1;
				end
			end
			else if(heartB>65) HB=1;
		end
	end
endmodule
			
