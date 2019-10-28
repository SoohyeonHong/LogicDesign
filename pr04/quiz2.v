module    quiz2(     out ,
                     in  ,
                     en  );
                          
output   [7:0]     out                  ;   //8bit
input    [2:0]     in                   ;   //3bit
input              en                   ;  

assign   out = (en==1'b1)? 8'd2<<7 : 8'd0    ;


endmodule