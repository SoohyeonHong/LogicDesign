module  mux2to1_tb     ;
// -------------------------------------------
// instances
// -------------------------------------------
reg            sel      ;
reg            in0      ;
reg            in1      ;


wire           out0      ;  
wire           out1      ; 
wire           out2      ; 

mux2to1_cond  dut0(    .out( out0   ),
                       .in0( in0    ),
                       .in1( in1    ),
                       .sel( sel    )); 
                       
mux2to1_if    dut1(    .out( out1   ),
                       .in0( in0    ),
                       .in1( in1    ),
                       .sel( sel    ));   
                       
mux2to1_case  dut2(    .out( out2   ),
                       .in0( in0    ),
                       .in1( in1    ),
                       .sel( sel    ));                                                                     
                     

                    
// -------------------------------------------
// stimulus
// -------------------------------------------                    
initial begin
      $display("Using conditional Expression: sel, in1, in0");
      $display("=============================================================================");
      $display("   sel in1 \tin0 \tout0 \tout1 \tout2");
      $display("=============================================================================");
      #(50)   {sel, in1, in0} = 3'b000;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b001;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b010;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b011;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b100;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b101;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b110;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   {sel, in1, in0} = 3'b111;   #(50) $display("   %d\t%d\t%d\t%d\t%d\t%d", sel, in1, in0, out0, out1, out2);
      #(50)   $finish               ;
end

endmodule   
