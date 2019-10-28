module    mux4to1_if(     out,
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

reg              out              ;

always @(in0, in1, in2, in3, sel) begin
    if(sel == 2'b00) begin
       out = in0   ;
    end else if(sel == 2'b01) begin
       out = in1   ;
    end else if(sel == 2'b10) begin
       out = in2   ;
    end else begin
       out = in3   ;
    end
    
end    
endmodule
