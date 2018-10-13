module top_CSA (input [63:0]ope1,ope2,input add_sub,clock,reset,start,
		output [63:0]sum,output complete,cout, output reg overf);

wire    complete_temp0,complete_temp1,complete_temp2,complete_temp3,
	complete_temp4,complete_temp5,complete_temp6,complete_temp7,
	
	complete_temp1_0,complete_temp1_1,	complete_temp2_0,complete_temp2_1,
	complete_temp3_0,complete_temp3_1,	complete_temp4_0,complete_temp4_1,
	complete_temp5_0,complete_temp5_1,	complete_temp6_0,complete_temp6_1,
	complete_temp7_0,complete_temp7_1;
wire i=0;
wire j=1;
wire 	w0,
    	w1_0,w1_1,
    	w2_0,w2_1,
	w3_0,w3_1,	
	w4_0,w4_1,
	w5_0,w5_1,	
	w6_0,w6_1,
	w7_0,w7_1;
wire d1,d2,d3,d4,d5,d6;

wire [7:0] sum1_0,sum1_1,
	   sum2_0,sum2_1,
	   sum3_0,sum3_1,
	   sum4_0,sum4_1,
	   sum5_0,sum5_1,
	   sum6_0,sum6_1,
	   sum7_0,sum7_1;	
//wire [7:0] sum1,sum2,sum3,sum4,sum5,sum6;

assign complete_temp1=complete_temp1_0|complete_temp1_1;
assign complete_temp2=complete_temp2_0|complete_temp2_1;
assign complete_temp3=complete_temp3_0|complete_temp3_1;
assign complete_temp4=complete_temp4_0|complete_temp4_1;
assign complete_temp5=complete_temp5_0|complete_temp5_1;
assign complete_temp6=complete_temp6_0|complete_temp6_1;
assign complete_temp7=complete_temp7_0|complete_temp7_1;

assign complete=(complete_temp0 & complete_temp1 & complete_temp2 & complete_temp3 &
	complete_temp4 & complete_temp5 & complete_temp6 & complete_temp7)?1'b1:1'b0;


ripple_carry_adder RCA0(.a(ope1[7:0]),.b(ope2[7:0]),.add_sub(add_sub),.clock(clock),.reset(reset),
			.start(start),.sum(sum[7:0]),.cout(w0),.complete(complete_temp0));
/////////////////////////////////////0////////////////////////////////////////////////////
			
ripple_carry_adder_zero RCA1_0(.a(ope1[15:8]),.b(ope2[15:8]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum1_0),.cout(w1_0),.complete(complete_temp1_0));
ripple_carry_adder_one RCA1_1(.a(ope1[15:8]),.b(ope2[15:8]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum1_1),.cout(w1_1),.complete(complete_temp1_1));
mux_8 MUX1_8(.in0_8(sum1_0),.in1_8(sum1_1),.sel_8(w0),.out_8(sum[15:8]));
mux_1 MUX1_1(.in0_1(w1_0),.in1_1(w1_1),.sel_1(w0),.out_1(d1));
/////////////////////////////////////1/////////////////////////////////////////////////////////

ripple_carry_adder_zero RCA2_0(.a(ope1[23:16]),.b(ope2[23:16]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum2_0),.cout(w2_0),.complete(complete_temp2_0));
ripple_carry_adder_one RCA2_1(.a(ope1[15:8]),.b(ope2[15:8]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum2_1),.cout(w2_1),.complete(complete_temp2_1));
mux_8 MUX2_8(.in0_8(sum2_0),.in1_8(sum2_1),.sel_8(d1),.out_8(sum[23:16]));
mux_1 MUX2_1(.in0_1(w2_0),.in1_1(w2_1),.sel_1(d1),.out_1(d2));

///////////////////////////////////2////////////////////////////////////////////////////////////
ripple_carry_adder_zero RCA3_0(.a(ope1[31:24]),.b(ope2[31:24]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum3_0),.cout(w3_0),.complete(complete_temp3_0));
ripple_carry_adder_one RCA3_1(.a(ope1[31:24]),.b(ope2[31:24]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum3_1),.cout(w3_1),.complete(complete_temp3_1));
mux_8 MUX3_8(.in0_8(sum3_0),.in1_8(sum3_1),.sel_8(d2),.out_8(sum[31:24]));
mux_1 MUX3_1(.in0_1(w3_0),.in1_1(w3_1),.sel_1(d2),.out_1(d3));

///////////////////////////////////3/////////////////////////////////////////////////////////////

ripple_carry_adder_zero RCA4_0(.a(ope1[39:32]),.b(ope2[39:32]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum4_0),.cout(w4_0),.complete(complete_temp4_0));
ripple_carry_adder_one RCA4_1(.a(ope1[39:32]),.b(ope2[39:32]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum4_1),.cout(w4_1),.complete(complete_temp4_1));
mux_8 MUX4_8(.in0_8(sum4_0),.in1_8(sum4_1),.sel_8(d3),.out_8(sum[39:32]));
mux_1 MUX4_1(.in0_1(w4_0),.in1_1(w4_1),.sel_1(d3),.out_1(d4));

//////////////////////////////////4////////////////////////////////////////////////////////////////

ripple_carry_adder_zero RCA5_0(.a(ope1[47:40]),.b(ope2[47:40]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum5_0),.cout(w5_0),.complete(complete_temp5_0));
ripple_carry_adder_one RCA5_1(.a(ope1[47:40]),.b(ope2[47:40]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum5_1),.cout(w5_1),.complete(complete_temp5_1));
mux_8 MUX5_8(.in0_8(sum5_0),.in1_8(sum5_1),.sel_8(d4),.out_8(sum[47:40]));
mux_1 MUX5_1(.in0_1(w5_0),.in1_1(w5_1),.sel_1(d4),.out_1(d5));

//////////////////////////////////////6///////////////////////////////////////////////////////////

ripple_carry_adder_zero RCA6_0(.a(ope1[55:48]),.b(ope2[55:48]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum6_0),.cout(w6_0),.complete(complete_temp6_0));
ripple_carry_adder_one RCA6_1(.a(ope1[55:48]),.b(ope2[55:48]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum6_1),.cout(w6_1),.complete(complete_temp6_1));
mux_8 MUX6_8(.in0_8(sum6_0),.in1_8(sum6_1),.sel_8(d5),.out_8(sum[55:48]));
mux_1 MUX6_1(.in0_1(w6_0),.in1_1(w6_1),.sel_1(d5),.out_1(d6));

/////////////////////////////////////7////////////////////////////////////////////////////////////

ripple_carry_adder_zero RCA7_0(.a(ope1[63:56]),.b(ope2[63:56]),.add_sub(i),.clock(clock),.reset(reset),
			.start(start),.sum(sum7_0),.cout(w7_0),.complete(complete_temp7_0));
ripple_carry_adder_one RCA7_1(.a(ope1[63:56]),.b(ope2[63:56]),.add_sub(j),.clock(clock),.reset(reset),
			.start(start),.sum(sum7_1),.cout(w7_1),.complete(complete_temp7_1));
mux_8 MUX7_8(.in0_8(sum7_0),.in1_8(sum7_1),.sel_8(d6),.out_8(sum[63:56]));
mux_1 MUX7_1(.in0_1(w7_0),.in1_1(w7_1),.sel_1(d6),.out_1(cout));

always@(negedge clock)
begin
	if(start)
	begin
		if(sum<=((2**63)-1) || sum>=(2**63) )
		overf<=1;
	else
		overf<=0;
	end
	else
		overf<=1'bx;

end

always @(posedge clock or negedge clock)
	$monitor("ope1=%d,ope2=%d,sum=%d",ope1,ope2,sum);
endmodule




