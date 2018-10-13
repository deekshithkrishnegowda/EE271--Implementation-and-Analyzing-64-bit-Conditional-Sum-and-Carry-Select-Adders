module mux_8(input [7:0]in0_8,in1_8,input sel_8,output [7:0]out_8);
assign out_8=(sel_8)? in1_8:in0_8;
endmodule

