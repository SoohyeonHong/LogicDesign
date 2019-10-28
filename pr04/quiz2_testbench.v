module quiz2_testbench ; 
  
  
  
reg   [2:0]  in    ;
reg       en    ;


wire  [7:0] out   ;


quiz2 dut(      .out( out  ),
                .in( in    ),
                .en( en    )); 
                        
                        
initial begin
      
      {in, en} = 4'b0001;
      #50
      $display(" out is %d",  out ); 
      $finish ;                          
      
end

endmodule