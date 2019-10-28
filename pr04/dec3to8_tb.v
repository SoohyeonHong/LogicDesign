module  dec3to8_tb ;
  
  
reg   [2:0]   in     ;
reg           en     ;


wire  [7:0]   out0   ;
wire  [7:0]   out1   ;
 
dec3to8_shift  dut0(   .in( in    ),
                       .en( en    ),
                      .out( out0  ));
                     
dec3to8_case   dut1(   .in( in    ),
                       .en( en    ),
                      .out( out1  ));                               
                      
           


initial begin
        $display("This is dec3to8 testbench");    
        $display("=============================================================="); 
        $display("  en \tin \tout0 \t\tout1");       
        $display("==============================================================");  
        
        #(50)   {en, in} = 4'b1000;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 );
        #(50)   {en, in} = 4'b1001;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 );
        #(50)   {en, in} = 4'b1010;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 );
        #(50)   {en, in} = 4'b1011;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 );
        #(50)   {en, in} = 4'b1100;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 ); 
        #(50)   {en, in} = 4'b1101;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 ); 
        #(50)   {en, in} = 4'b1110;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 ); 
        #(50)   {en, in} = 4'b1111;   #(50) $display("  %b\t%b\t%b\t%b", en, in, out0, out1 ); 
        #(50)   $finish    ;
        
end

endmodule        
        
                 