`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// work
// Create Date:    17:11:40 06/10/2013 
// Design Name: 
// Module Name:    ggame 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ggame(clock, sw, rst, btn, led, player, anodes, cathodes);

	input clock;
	input [4:0] sw;
	input player;
	input rst;
	reg prevrst;
	input [3:0] btn;
	reg [3:0] prevbtns;
	output [7:0] led;
	reg [7:0] led;
	output [3:0] anodes;
	output [6:0] cathodes;
	reg [6:0] cathodes;
	reg [3:0] anodes;
	reg slow_clock;
	reg [5:0] digit;
	reg [23:0] result1=0;
	reg[23:0] result2=0;
	reg [5:0] count = 1;
	reg [7:0] tic=0;
	reg HI,c;
	reg flag=0;
	reg flag1=1;
	reg flag2=1;

	always @(posedge clock) 
	begin
		create_slow_clock(clock, slow_clock);
	end
	always @(posedge slow_clock)
	begin
	if(flag1==0)
	begin
		case(anodes)
		4'b0111: anodes = 4'b1011;
		4'b1011: anodes = 4'b1101;
		4'b1101: anodes = 4'b1110;
		4'b1110: anodes = 4'b1111;
		4'b1111: anodes = 4'b0111;
		default: anodes = 4'b1111;
		endcase
		
			case(sw)
						4'b0001: begin 
										case(btn)
											4'b0001: begin prevbtns=4'b0001;
																c=0;
														end
											4'b0010: begin prevbtns=4'b0010;
																c=0;
														end
											4'b0100: begin prevbtns=4'b0100;
																c=0;
														end
											4'b1000: begin prevbtns=4'b1000;
																c=0;
														end
											endcase
							if(btn==4'b0000 && prevbtns==4'b0001 && c==0) 
							begin
								if(player==0)
								begin
								result1[5:0]=result1[5:0]+1;
								if(result1[5:0] > 15) result1[5:0] = 0;
								end
								if(player==1)
				            begin
								result2[5:0]=result2[5:0]+1;
								if(result2[5:0] > 15) result2[5:0] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0010 && c==0) 
							begin
				            if(player==0)
								begin
								result1[5:0]=result1[5:0]+2;
								if(result1[5:0] > 15) result1[5:0] = 0;
								end
								if(player==1)
								begin
								result2[5:0]=result2[5:0]+2;
								if(result2[5:0] > 15) result2[5:0] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0100 && c==0) 
							begin
								if(player==0)
								begin
				            result1[5:0]=result1[5:0]+4;
								if(result1[5:0] > 15) result1[5:0] = 0;
								end
								if(player==1)
								begin
								 result2[5:0]=result2[5:0]+4;
								if(result2[5:0] > 15) result2[5:0] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b1000 && c==0) 
							begin
								if(player==0)
								begin
				            result1[5:0]=result1[5:0]+8;
								if(result1[5:0] > 15) result1[5:0] = 0;
								end
								if(player==1)
								begin
								 result2[5:0]=result2[5:0]+8;
								if(result2[5:0] > 15) result2[5:0] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
														
						end
						4'b0010: begin 
										case(btn)
											4'b0001: begin prevbtns=4'b0001;
																c=0;
														end
											4'b0010: begin prevbtns=4'b0010;
																c=0;
														end
											4'b0100: begin prevbtns=4'b0100;
																c=0;
														end
											4'b1000: begin prevbtns=4'b1000;
																c=0;
														end				
										endcase
							if(btn==4'b0000 && prevbtns==4'b0001 && c==0) 
							begin
								if(player==0)
								begin
				            result1[11:6]=result1[11:6]+1;
								if(result1[11:6] > 15) result1[11:6] = 0;
								end
								if(player==1)
								begin
								result2[11:6]=result2[11:6]+1;
								if(result2[11:6] > 15) result2[11:6] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0010 && c==0) 
							begin
								if(player==0)
								begin
								result1[11:6]=result1[11:6]+2;
								if(result1[11:6] > 15) result1[11:6] = 0;
								end
								if(player==1)
								begin
								result2[11:6]=result2[11:6]+2;
								if(result2[11:6] > 15) result2[11:6] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0100 && c==0) 
							begin
								if(player==0)
								begin
								result1[11:6]=result1[11:6]+4;
								if(result1[11:6] > 15) result1[11:6] = 0;
								end
								if(player==1)
								begin
								 result2[11:6]=result2[11:6]+4;
								if(result2[11:6] > 15) result2[11:6] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b1000 && c==0) 
							begin
							if(player==0)
							begin
								result1[11:6]=result1[11:6]+8;
								if(result1[11:6] > 15) result1[11:6] = 0;
								end
								if(player==1)
								begin
								result2[11:6]=result2[11:6]+8;
								if(result2[11:6] > 15) result2[11:6] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end		
						end
						4'b0100: begin 
										case(btn)
											4'b0001: begin prevbtns=4'b0001;
																c=0;
														end
											4'b0010: begin prevbtns=4'b0010;
																c=0;
														end
											4'b0100: begin prevbtns=4'b0100;
																c=0;
														end
											4'b1000: begin prevbtns=4'b1000;
																c=0;
														end
														
										endcase
							if(btn==4'b0000 && prevbtns==4'b0001 && c==0) 
							begin
								if(player==0)
								begin
								result1[17:12]=result1[17:12]+1;
								if(result1[17:12] > 15) result1[17:12] = 0;
								end
								if(player==1)
								begin
								result2[17:12]=result2[17:12]+1;
								if(result2[17:12] > 15) result2[17:12] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0010 && c==0) 
							begin
								if(player==0)
								begin
								result1[17:12]=result1[17:12]+2;
								if(result1[17:12] > 15) result1[17:12] = 0;
								end
								if(player==1)
								begin
									result2[17:12]=result2[17:12]+2;
								if(result2[17:12] > 15) result2[17:12] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0100 && c==0) 
							begin
								if(player==0)
								begin
								result1[17:12]=result1[17:12]+4;
								if(result1[17:12] > 15) result1[17:12] = 0;
								end
								if(player==1)
								begin
								  result2[17:12]=result2[17:12]+4;
								if(result2[17:12] > 15) result2[17:12] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b1000 && c==0) 
							begin
								if(player==0)
								begin
								result1[17:12]=result1[17:12]+8;
								if(result1[17:12] > 15) result1[17:12] = 0;
								end
								if(player==1)
								begin
								result2[17:12]=result2[17:12]+8;
								if(result2[17:12] > 15) result2[17:12] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end		
														
						end
						4'b1000: begin 
										case(btn)
											4'b0001: begin prevbtns=4'b0001;
																c=0;
														end
											4'b0010: begin prevbtns=4'b0010;
																c=0;
														end
											4'b0100: begin prevbtns=4'b0100;
																c=0;
														end
											4'b1000: begin prevbtns=4'b1000;
																c=0;
														end				
										endcase
							if(btn==4'b0000 && prevbtns==4'b0001 && c==0) 
							begin
								if(player==0)
								begin
								result1[23:18]=result1[23:18]+1;
								if(result1[23:18] > 15) result1[23:18] = 0;
								end
								if(player==1)
								begin
								result2[23:18]=result2[23:18]+1;
								if(result2[23:18] > 15) result2[23:18] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0010 && c==0) 
							begin
								if(player==0)
								begin
								result1[23:18]=result1[23:18]+2;
								if(result1[23:18] > 15) result1[23:18] = 0;
								end
								if(player==1)
								begin
								result2[23:18]=result2[23:18]+2;
								if(result2[23:18] > 15) result2[23:18] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b0100 && c==0) 
							begin
								if(player==0)
								begin
								result1[23:18]=result1[23:18]+4;
								if(result1[23:18] > 15) result1[23:18] = 0;
								end
								if(player==1)
								begin
								 result2[23:18]=result2[23:18]+4;
								if(result2[23:18] > 15) result2[23:18] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							if(btn==4'b0000 && prevbtns==4'b1000 && c==0) 
							begin
								if(player==0)
								begin
				            result1[23:18]=result1[23:18]+8;
								if(result1[23:18] > 15) result1[23:18] = 0;
								end
								if(player==1)
								begin
								  result2[23:18]=result2[23:18]+8;
								if(result2[23:18] > 15) result2[23:18] = 0;
								end
								c=prevbtns;
								prevbtns=0;
							end
							
						end
					endcase
		
		if(player==0) begin
			if(sw == 4'b0000) begin
				case(anodes)
					4'b0111: begin digit = 1; end
					4'b1011: begin digit = 17; end
					4'b1101: begin digit = 16; end
					4'b1110: begin digit = 20; end
				endcase end
			else begin
				case(anodes)
					4'b0111: begin digit = result1[5:0]; end
					4'b1011: begin digit = result1[11:6]; end
					4'b1101: begin digit = result1[17:12]; end
					4'b1110: begin digit = result1[23:18]; end
				endcase
			end
		end
		
		if(player==1) begin
			if(sw == 4'b0000) begin
				case(anodes)
					4'b0111: begin digit = 2; end
					4'b1011: begin digit = 17; end
					4'b1101: begin digit = 16; end
					4'b1110: begin digit = 20; end
				endcase end
			else begin
				case(anodes)
					4'b0111: begin digit = result2[5:0]; end
					4'b1011: begin digit = result2[11:6]; end
					4'b1101: begin digit = result2[17:12]; end
					4'b1110: begin digit = result2[23:18]; end
				endcase
		
				if(sw[4]==0 && flag==1)
				begin
				flag=0;
				count=count+1;
				end
				
				if(sw[4]==1 &&(result1[5:0]!=result2[5:0] || result1[11:6]!=result2[11:6] || result1[17:12]!=result2[17:12] || result1[23:18]!=result2[23:18])) 
				begin
					flag=1;
					if(result1[5:0]<result2[5:0]) HI=1;
					if(result1[5:0]>result2[5:0]) HI=0;
					if(HI!=1)
					begin if(result1[11:6]<result2[11:6]) HI=1; end
					if(HI!=0)
					begin if(result1[11:6]>result2[11:6]) HI=0; end
					if(HI!=1)
					begin if(result1[17:12]<result2[17:12]) HI=1; end
					if(HI!=0)
					begin if(result1[17:12]>result2[17:12]) HI=0; end
					if(HI!=1)
					begin	if(result1[23:18]<result2[23:18]) HI=1; end
					if(HI!=0)
					begin if(result1[23:18]>result2[23:18]) HI=0; end
						if(HI==1) begin
							case(anodes)
								4'b0111: begin digit = 19; end
								4'b1011: begin digit = 18; end
								4'b1101: begin digit = 2; end
								4'b1110: begin digit = 20; end
							endcase end
						else begin
							case(anodes)
								4'b0111: begin digit = 0; end
								4'b1011: begin digit = 17; end
								4'b1101: begin digit = 2; end
								4'b1110: begin digit = 20; end
							endcase
						end
					end
				
			end
		end
		
		if(result1[23:0]==result2[23:0]&& player==1 && sw[4]==1 && result1!=0) 
		begin 
			tic=tic+1;
			if(tic==200)
			begin
			led = ~led;
			tic=0;
			end
			if(count<10)
			begin
			case(anodes)
				4'b0111: begin digit = count; end
				4'b1011: begin digit = 20; end
				4'b1101: begin digit = 20; end
				4'b1110: begin digit = 20; end
			endcase
			end
			else if(count>=10 && count<20)
			case(anodes)
				4'b0111: begin digit = count-10; end
				4'b1011: begin digit = 1; end
				4'b1101: begin digit = 21; end
				4'b1110: begin digit = 21; end
			endcase
			else if(count>=20 && count<30)
			case(anodes)
				4'b0111: begin digit = count-20; end
				4'b1011: begin digit = 2; end
				4'b1101: begin digit = 21; end
				4'b1110: begin digit = 21; end
			endcase		
		end
		flag2=0;
	end
		
		if(prevrst!=rst)
		begin
			result1=0;
			result2=0;
			count=1;
			c=0;
			HI=0;
			tic=0;
			anodes=4'b1111;
			flag1=0;
			led=8'b00000000;
			prevrst=rst;
		end
		if(btn==4'b1001)
		begin
			result1=0;
			result2=0;
			count=1;
			c=0;
			HI=0;
			tic=0;
			anodes=4'b1111;
			flag1=0;
			led=8'b00000000;
			flag2=1;
		end
	
		cathodes = calc_cathode_value(digit);
		
	end


	function [6:0] calc_cathode_value; 
		input [5:0] digit; 
		begin
			case (digit) 
				0: calc_cathode_value = 7'b1000000; 
				1: calc_cathode_value = 7'b1111001;  
				2: calc_cathode_value = 7'b0100100;  
				3: calc_cathode_value = 7'b0110000;  
				4: calc_cathode_value = 7'b0011001;  
				5: calc_cathode_value = 7'b0010010;  
				6: calc_cathode_value = 7'b0000010;  
				7: calc_cathode_value = 7'b1111000;  
				8: calc_cathode_value = 7'b0000000;  
				9: calc_cathode_value = 7'b0010000; 
				10: calc_cathode_value = 7'b0001000;  
				11: calc_cathode_value = 7'b0000011;  
				12: calc_cathode_value = 7'b1000110;  
				13: calc_cathode_value = 7'b0100001;  
				14: calc_cathode_value = 7'b0000100;  
				15: calc_cathode_value = 7'b0001110;  
				16: calc_cathode_value = 7'b0001100; 
				17: calc_cathode_value = 7'b1000111; 
				18: calc_cathode_value = 7'b0001001;  
				19: calc_cathode_value = 7'b1001111;  
				20: calc_cathode_value = 7'b1111111;     
			endcase 
		end 
	endfunction 
	 
task create_slow_clock;
input clock;
inout slow_clock;
integer count;
begin
if (count > 25000)
begin
count=0;
slow_clock = ~slow_clock;
end
count = count+1;
end
endtask
	
endmodule 