module conditional_sum_adder_8(input [7:0] A,B,input Cin,add_sub,reset,clock,start,
       		             output [7:0] sum,output cout,complete);
wire c1;
wire com1,com2;

conditional_sum_adder CSA_4_1( .A(A[3:0]),.B(B[3:0]),.add_sub(add_sub),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[3:0]), .cout(c1),.complete(com1));
conditional_sum_adder_1 CSA_4_2( .A(A[7:4]),.B(B[7:4]),.add_sub(add_sub),.Cin(c1),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[7:4]), .cout(cout),.complete(com2));

assign complete=(com1 && com2)?1:0;

endmodule

module conditional_sum_adder_8_1(input [7:0] A,B,input Cin,add_sub,reset,clock,start,
       		             output [7:0] sum,output cout,complete);
wire c1;
wire com1,com2;

conditional_sum_adder_1 CSA_4_1( .A(A[3:0]),.B(B[3:0]),.add_sub(add_sub),.Cin(Cin),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[3:0]), .cout(c1),.complete(com1));
conditional_sum_adder_1 CSA_4_2( .A(A[7:4]),.B(B[7:4]),.add_sub(add_sub),.Cin(c1),.reset(reset),.clock(clock),.start(start),
       		             .sum(sum[7:4]), .cout(cout),.complete(com2));

assign complete=(com1 && com2)?1:0;

endmodule
