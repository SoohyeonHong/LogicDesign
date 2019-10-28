module dff_syn(q, d, clk, rst_n);
  
  
output                q             ;
input                 d             ;
input                 clk           ;
input                 rst_n         ;


reg                   q             ;
always @ (posedge clk) begin
      if(rst_n == 1'b0) begin
            q <= 1'b0               ;
      end else begin
            q <= d                   ;
      end
end
endmodule

