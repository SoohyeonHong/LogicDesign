module    mux2to1_case(    out,
                           in0,
                           in1,
                           sel);
                        
output           out              ;

input            in0              ;
input            in1              ;
input            sel              ;          


reg            out                ;

always @(sel, in0, in1) begin
    case( sel )
          1'b0 : out = in0     ;
          1'b1 : out = in1     ;
  
    endcase
end
endmodule