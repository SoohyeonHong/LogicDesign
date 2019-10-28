module    mux2to1_if(     out,
                          in0,
                          in1,
                          sel);
                        
output           out              ;

input            in0              ;
input            in1              ;
input            sel              ;  

reg              out              ;
                      
always @(in0, in1, sel) begin
  if(sel == 1'b0) begin
      out = in0   ;
  end else begin
      out = in1   ;
  end

end               

endmodule                    
