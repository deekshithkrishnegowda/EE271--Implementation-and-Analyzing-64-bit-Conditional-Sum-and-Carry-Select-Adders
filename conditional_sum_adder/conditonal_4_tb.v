module conditionalsum_64();

wire [63:0]sum;
wire cout,complete,overf;
reg [63:0]ope1,ope2;
reg add_sub,start,reset,clock;

conditional_sum_adder_64 DUT (ope1,ope2,Cin,add_sub,reset,clock,start,
       		             sum,cout,complete,overf );

always
begin
	clock=1'b0;
	#5;clock=1'b1;
	#5;
end

initial
begin
	ope1=64'd2;
	ope2=64'd2;
	add_sub=0;
	@(negedge clock);
	start=1;
	reset=0;
	#10;
	ope1=64'd25;
	ope2=64'd25;
	add_sub=0;
	#20;
	$finish;
end
endmodule


