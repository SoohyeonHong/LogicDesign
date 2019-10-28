module  dec3to8_shift(    out ,
                          in  ,
                          en  );
                          
output   [7:0]     out                  ;   //8bit
input    [2:0]     in                   ;   //3bit
input              en                   ;  

assign   out = (en==1'b1)? 8'd1<<in : 8'd0    ;


endmodule