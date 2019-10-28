module fa4_mbit(      s,
                      co,
                      a,
                      b,
                      ci     );
                    
output [3:0]   s      ;     // sum
output         co     ;     // carry out

input  [3:0]   a      ;     // input a
input  [3:0]   b      ;     // input b
input          ci     ;     // carry in

assign         {co, s} = a + b + ci   ;

endmodule