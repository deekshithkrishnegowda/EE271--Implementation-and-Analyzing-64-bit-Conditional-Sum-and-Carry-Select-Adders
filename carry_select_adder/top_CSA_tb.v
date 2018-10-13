module top_CSA_tb();

reg [63:0] ope1,ope2;
reg clock,start,add_sub,reset;
wire [63:0] sum;
wire cout,overf,complete;


top_CSA DUT (ope1,ope2,add_sub,clock,reset,start,
		sum,complete,cout,overf);
always
begin
	clock=1'b0;
	#5;clock=1'b1;
	#5;
end

initial
begin
	$dumpfile("CSA_64.vcd");
	$dumpvars(0);

	@(negedge clock);reset=1;start=0;	
	@(negedge clock);reset=0;start=1;
	ope1=$random;
	ope2=$random;
	add_sub=0;
	
	#20;$finish;

end
endmodule
