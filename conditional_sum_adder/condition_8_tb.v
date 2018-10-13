module conditionalsum_64();

wire [7:0]sum;
wire cout,complete;
reg [7:0]A,B;
reg add_sub,start,reset,clock;

conditional_sum_adder_8 DUT (A,B,Cin,add_sub,reset,clock,start,
       		             sum,cout,complete );

always
begin
	clock=1'b0;
	#5;clock=1'b1;
	#5;
end

initial
begin
	A=$random;
	B=$random;
	add_sub=0;
	@(negedge clock);
	start=1;
	reset=0;
	#12;
	start=0;
	reset=1;
	#10;
	start=1;
	reset=0;
	A=$random;
	B=$random;
	add_sub=0;
	#10;
	$finish;
end
endmodule

