module ripple_carry_adder_zero(input [7:0] a,b,input add_sub,clock,start,reset, output reg [7:0] sum,output cout,
				output reg complete);

reg [7:0] A_temp,B_temp;
wire [7:0]sum_temp;
wire d=1'b0;
wire cout0,cout1,cout2,cout3,cout4,cout5,cout6;
wire d0,d1,d2,d3,d4,d5,d6,d7;

assign d0=B_temp[0]^add_sub;
assign d1=B_temp[1]^add_sub;
assign d2=B_temp[2]^add_sub;
assign d3=B_temp[3]^add_sub;
assign d4=B_temp[4]^add_sub;
assign d5=B_temp[5]^add_sub;
assign d6=B_temp[6]^add_sub;
assign d7=B_temp[7]^add_sub;

fulladder FA0(.A(A_temp[0]),.B(d0),.Cin(d),.sum(sum_temp[0]),.carry(cout0));
fulladder FA1(.A(A_temp[1]),.B(d1),.Cin(cout0),.sum(sum_temp[1]),.carry(cout1));
fulladder FA2(.A(A_temp[2]),.B(d2),.Cin(cout1),.sum(sum_temp[2]),.carry(cout2));
fulladder FA3(.A(A_temp[3]),.B(d3),.Cin(cout2),.sum(sum_temp[3]),.carry(cout3));
fulladder FA4(.A(A_temp[4]),.B(d4),.Cin(cout3),.sum(sum_temp[4]),.carry(cout4));
fulladder FA5(.A(A_temp[5]),.B(d5),.Cin(cout4),.sum(sum_temp[5]),.carry(cout5));
fulladder FA6(.A(A_temp[6]),.B(d6),.Cin(cout5),.sum(sum_temp[6]),.carry(cout6));
fulladder FA7(.A(A_temp[7]),.B(d7),.Cin(cout6),.sum(sum_temp[7]),.carry(cout));


always@(posedge clock)                                //inputs will be sampled only when start is high and reset is low
begin
	if(start && !reset)
		begin
			A_temp<=a;
			B_temp<=b;
			complete<=0;
		end
	else 
		begin
			A_temp<=8'bx;
			B_temp<=8'bx;
//			complete<=1'bx;
		end
		
end

always@(negedge clock )
begin
	sum<=sum_temp;
end

always@(negedge clock)
begin
		if((|sum_temp)| (!sum_temp))		//complete signal is made high by reduction operation on sum_temp
		complete<=1'b1;
	else
		complete<=1'b0;

end

						
endmodule


