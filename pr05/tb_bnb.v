module  tb_bnb        ;

reg               d   ;
reg               clk ;

wire              q1  ;
wire              q2  ;

block             DUT_0(  .q    (   q1    ),
                          .d    (   d     ),
                          .clk  (   clk   ));

nonblock          DUT_1(  .q    (   q2    ),
                          .d    (   d     ),
                          .clk  (   clk   ));

initial           clk = 1'b0;
always            #(20) clk = ~clk;

initial begin  
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b0;
      #50   d = 1'b1;
      #50   d = 1'b1;
      #50   d = 1'b1;
      #50   d = 1'b0;
      #50   d = 1'b1;
      #50   d = 1'b0;
      #50   d = 1'b1;
      $finish       ;
end

endmodule
