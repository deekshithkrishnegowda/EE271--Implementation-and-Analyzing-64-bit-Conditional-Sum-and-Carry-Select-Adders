module mux_1(input in0_1,in1_1,input sel_1,output out_1);
assign out_1=(sel_1)?in1_1:in0_1;
endmodule
