module  mux4to1_tb     ;
// -------------------------------------------
// instances
// -------------------------------------------
reg   [1:0]    sel      ;
reg            in0      ;
reg            in1      ;
reg            in2      ;
reg            in3      ;


wire           out0      ;  
wire           out1      ; 
wire           out2      ; 

mux4to1_case  dut4_0(    .out( out0   ),
                         .in0( in0    ),
                         .in1( in1    ),
                         .in2( in2    ),
                         .in3( in3    ),
                         .sel( sel    )); 
                       
mux4to1_if    dut4_1(    .out( out1   ),
                         .in0( in0    ),
                         .in1( in1    ),
                         .in2( in2    ),
                         .in3( in3    ),
                         .sel( sel    ));    
                       
mux4to1_inst  dut4_2(    .out( out2   ),
                         .in0( in0    ),
                         .in1( in1    ),
                         .in2( in2    ),
                         .in3( in3    ),                         
                         .sel( sel    ));                                                                      
                     

                    
// -------------------------------------------
// stimulus
// -------------------------------------------                    
initial begin
      $display("Using conditional Expression: sel, in1, in0");
      $display("=============================================================================");
      $display("   sel in3 \tin2  \tin1 \tin0 \tout0 \tout1 \tout2");
      $display("=============================================================================");
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   {sel, in3, in2, in1, in0} = $random();  #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", sel, in3, in2, in1, in0, out0, out1, out2);
      #(50)   $finish               ;
end

endmodule   

