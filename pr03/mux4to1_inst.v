module   mux4to1_inst(    out,
                          in0,
                          in1,
                          in2,
                          in3,                          
                          sel);
                          
output           out              ;

input            in0              ;
input            in1              ; 
input            in2              ; 
input            in3              ; 
input   [1:0]    sel              ;  

wire    [1:0]    o_mux2           ;

mux2to1_case       MUX_u0(    .out       ( o_mux2[0]  ),
                              .in0       ( in0        ),
                              .in1       ( in1        ),
                              .sel       ( sel[0]     ));

mux2to1_case       MUX_u1(    .out       ( o_mux2[1]  ),
                              .in0       ( in2        ),
                              .in1       ( in3        ),
                              .sel       ( sel[0]     ));
                           
mux2to1_case       MUX_u2(    .out       ( out        ),
                              .in0       ( o_mux2[0]  ),
                              .in1       ( o_mux2[1]  ),
                              .sel       ( sel[1]     ));                           
endmodule
