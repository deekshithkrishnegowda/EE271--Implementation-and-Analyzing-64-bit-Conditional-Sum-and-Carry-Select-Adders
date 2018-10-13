module ripple_carry_adder_tb();

wire [7:0] sum;
wire cout,complete;

reg [7:0] a,b;
reg add_sub,clock,start,reset;

ripple_carry_adder DUT(a,b,add_sub,clock,start,reset,sum,cout,
		      complete);

always
begin
	clock=1'b0;
	#5;clock=1'b1;
	#5;
end

initial
begin
	$dumpfile("ripple_carry_adder_8.vcd");
	$dumpvars(0);

	@(negedge clock);reset=1;start=0;	
	@(negedge clock);reset=0;start=1;
	a=8'd12;
	b=8'd127;
	add_sub=0;
	@(negedge clock);reset=0;start=1;
	a=8'd12;
	b=8'd127;
	add_sub=1;

	#20;$finish;
end
endmodule
