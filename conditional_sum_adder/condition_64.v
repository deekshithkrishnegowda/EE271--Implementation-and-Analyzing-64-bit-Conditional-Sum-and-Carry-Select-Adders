module conditional_sum_adder_64(input [63:0] ope1,ope2,input Cin,add_sub,reset,clock,start,
       		             output [63:0] sum,output cout,complete,output reg overf);

wire c0,c1,c2,c3,c4,c5,c6;
wire com0,com1,com2,com3,com4,com5,com6,com7;
wire i=0;

always@(negedge clock)
begin
	if(start)
	begin
		if(sum<((2**63)-1) && sum<(2**63) )
		overf<=0;
	else
		overf<=1;
	end
	else
		overf<=1'bx;

end

assign complete=(com0 &&com1 &&com2 &&com3 &&com4 &&com5 &&com6 &&com7 )? 1:0;

conditional_sum_adder_8 CSA_0( .A(ope1[7:0]),.B(ope2[7:0]),.Cin(i),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[7:0]),.cout(c0),.complete(com0));

conditional_sum_adder_8_1 CSA_1( .A(ope1[15:8]),.B(ope2[15:8]),.Cin(c0),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[15:8]),.cout(c1),.complete(com1));

conditional_sum_adder_8_1 CSA_2( .A(ope1[23:16]),.B(ope2[23:16]),.Cin(c1),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[23:16]),.cout(c2),.complete(com2));

conditional_sum_adder_8_1 CSA_3( .A(ope1[31:24]),.B(ope2[31:24]),.Cin(c2),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[31:24]),.cout(c3),.complete(com3));

conditional_sum_adder_8_1 CSA_4( .A(ope1[39:32]),.B(ope2[39:32]),.Cin(c3),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[39:32]),.cout(c4),.complete(com4));

conditional_sum_adder_8_1 CSA_5( .A(ope1[47:40]),.B(ope2[47:40]),.Cin(c4),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[47:40]),.cout(c5),.complete(com5));

conditional_sum_adder_8_1 CSA_6( .A(ope1[55:48]),.B(ope2[55:48]),.Cin(c5),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[55:48]),.cout(c6),.complete(com6));

conditional_sum_adder_8_1 CSA_7( .A(ope1[63:56]),.B(ope2[63:56]),.Cin(c6),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[63:56]),.cout(cout),.complete(com7));

		     
endmodule

