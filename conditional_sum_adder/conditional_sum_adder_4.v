module conditional_sum_adder(input [3:0] A,B,input add_sub,reset,clock,start,
       		             output reg [3:0] sum,output cout,output reg complete);

reg [3:0]A_temp,B_temp;
wire [3:0]sum_temp;
wire temp;

always@(posedge clock)
begin
	if(start && !reset)
	begin
	A_temp<=A;
	B_temp<=B;
	end
else
	begin
	A_temp<=4'bx;
	B_temp<=4'bx;
	end
end

always@(negedge clock)
begin
	if(!reset && start)
	sum<=sum_temp;
	else
	sum<=4'bx;
end

always@(negedge clock)
begin
	if(start)
	complete<=0;
	else
	complete<=1'bx;

	if(start&&((|sum_temp) | (!sum_temp)))
		complete<=1;

	else
		complete<=0;

end


wire d0,d1,d2,d3;
wire c0,c1;
wire s1_0,s2_0,s3_0,
     s1_1,s2_1,s3_1;
wire c1_0,c2_0,
     c1_1,c2_1;
wire t2_0,t2_1;
wire z2_0,z2_1; 

wire [1:0]  y2_0,y2_1;

assign d0=B_temp[0]^add_sub;
assign d1=B_temp[1]^add_sub;
assign d2=B_temp[2]^add_sub;
assign d3=B_temp[3]^add_sub;

wire i=0;
wire j=1;

fulladder FA1( .A(A_temp[0]),.B(d0),.Cin(add_sub),.sum(sum_temp[0]),.carry(c0));

//////////////////////1//////////////////////////////////////////////////

fulladder FA2_0( .A(A_temp[1]),.B(d1),.Cin(i),.sum(s1_0),.carry(c1_0));
fulladder FA2_1( .A(A_temp[1]),.B(d1),.Cin(j),.sum(s1_1),.carry(c1_1));
mux1 MUX2_SUM(.one(s1_1),.zero(s1_0),.sel(c0),.out(sum_temp[1]));
mux1 MUX2_CARRY(.one(c1_1),.zero(c1_0),.sel(c0),.out(c1));

///////////////////////2/////////////////////////////////////////////////
fulladder FA3_0( .A(A_temp[2]),.B(d2),.Cin(i),.sum(s2_0),.carry(c2_0));
fulladder FA3_1( .A(A_temp[2]),.B(d2),.Cin(j),.sum(s2_1),.carry(c2_1));


////////////////////////3////////////////////////////////////////////////

fulladder FA4_0( .A(A_temp[3]),.B(d3),.Cin(i),.sum(s3_0),.carry(c3_0));
fulladder FA4_1( .A(A_temp[3]),.B(d3),.Cin(j),.sum(s3_1),.carry(c3_1));
mux1 MUX3_SUM_0(.one(s3_1),.zero(s3_0),.sel(c2_0),.out(t2_0));
mux1 MUX3_SUM_1(.one(s3_1),.zero(s3_0),.sel(c2_1),.out(t2_1));
assign y2_0={t2_0,s2_0};
assign y2_1={t2_1,s2_1};
mux2 MUX8(.one(y2_1),.zero(y2_0),.sel(c1),.out(sum_temp[3:2]));

mux1 MUX3_CARRY_0(.one(c3_1),.zero(c3_0),.sel(c2_0),.out(z2_0));
mux1 MUX3_CARRY_1(.one(c3_1),.zero(c3_0),.sel(c2_1),.out(z2_1));
mux1 MUX3_CARRY_2(.one(z2_1),.zero(z2_0),.sel(c1),.out(cout));

endmodule


module mux1(input one,zero,sel,output out);
assign out=(sel)?one:zero;
endmodule
module mux2(input [1:0]one,zero,input sel,output [1:0]out);
assign out=(sel)?one:zero;
endmodule


module conditional_sum_adder_1(input [3:0] A,B,input Cin, add_sub,reset,clock,start,
       		             output reg [3:0] sum,output cout,output reg complete);

reg [3:0]A_temp,B_temp;
wire [3:0]sum_temp;
wire temp;

always@(posedge clock)
begin
	if(start && !reset)
	begin
	A_temp<=A;
	B_temp<=B;
	end
else
	begin
	A_temp<=4'bx;
	B_temp<=4'bx;
	end
end

always@(negedge clock)
begin
	if(!reset && start)
	sum<=sum_temp;
	else
	sum<=4'bx;
end

always@(negedge clock)
begin
	if(start)
	complete<=0;
	else
	complete<=1'bx;

	if(start&&((|sum_temp) | (!sum_temp)))
		complete<=1;

	else
		complete<=0;

end


wire d0,d1,d2,d3;
wire c0,c1;
wire s1_0,s2_0,s3_0,
     s1_1,s2_1,s3_1;
wire c1_0,c2_0,
     c1_1,c2_1;
wire t2_0,t2_1;
wire z2_0,z2_1; 

wire [1:0]  y2_0,y2_1;

assign d0=B_temp[0]^add_sub;
assign d1=B_temp[1]^add_sub;
assign d2=B_temp[2]^add_sub;
assign d3=B_temp[3]^add_sub;

wire i=0;
wire j=1;

fulladder FA1( .A(A_temp[0]),.B(d0),.Cin(Cin),.sum(sum_temp[0]),.carry(c0));

//////////////////////1//////////////////////////////////////////////////

fulladder FA2_0( .A(A_temp[1]),.B(d1),.Cin(i),.sum(s1_0),.carry(c1_0));
fulladder FA2_1( .A(A_temp[1]),.B(d1),.Cin(j),.sum(s1_1),.carry(c1_1));
mux1 MUX2_SUM(.one(s1_1),.zero(s1_0),.sel(c0),.out(sum_temp[1]));
mux1 MUX2_CARRY(.one(c1_1),.zero(c1_0),.sel(c0),.out(c1));

///////////////////////2/////////////////////////////////////////////////
fulladder FA3_0( .A(A_temp[2]),.B(d2),.Cin(i),.sum(s2_0),.carry(c2_0));
fulladder FA3_1( .A(A_temp[2]),.B(d2),.Cin(j),.sum(s2_1),.carry(c2_1));


////////////////////////3////////////////////////////////////////////////

fulladder FA4_0( .A(A_temp[3]),.B(d3),.Cin(i),.sum(s3_0),.carry(c3_0));
fulladder FA4_1( .A(A_temp[3]),.B(d3),.Cin(j),.sum(s3_1),.carry(c3_1));
mux1 MUX3_SUM_0(.one(s3_1),.zero(s3_0),.sel(c2_0),.out(t2_0));
mux1 MUX3_SUM_1(.one(s3_1),.zero(s3_0),.sel(c2_1),.out(t2_1));
assign y2_0={t2_0,s2_0};
assign y2_1={t2_1,s2_1};
mux2 MUX8(.one(y2_1),.zero(y2_0),.sel(c1),.out(sum_temp[3:2]));

mux1 MUX3_CARRY_0(.one(c3_1),.zero(c3_0),.sel(c2_0),.out(z2_0));
mux1 MUX3_CARRY_1(.one(c3_1),.zero(c3_0),.sel(c2_1),.out(z2_1));
mux1 MUX3_CARRY_2(.one(z2_1),.zero(z2_0),.sel(c1),.out(cout));

endmodule
