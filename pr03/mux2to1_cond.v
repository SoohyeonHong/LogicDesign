module   mux2to1_cond(    out,
                          in0,
                          in1,
                          sel);
                        
output           out              ;

input            in0              ;
input            in1              ;
input            sel              ;                        
                      
assign  out = (sel)? in1 : in0    ;

endmodule


