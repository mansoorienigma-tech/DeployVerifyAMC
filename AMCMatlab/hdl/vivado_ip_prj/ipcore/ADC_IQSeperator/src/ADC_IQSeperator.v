// -------------------------------------------------------------
// 
// File Name: ADC_IQSeperator.v
// Created: 2020-08-21
// 
// 
// 
// 


`timescale 1 ns / 1 ns

module ADC_IQSeperator
          #(
            parameter SAMPLESPERCLOCK=16
		   )
          (ADC,
		   ValidIn,
           IOut,
           QOut,
		   ValidOut);


  input  [SAMPLESPERCLOCK*16-1:0] ADC;
  input   ValidIn;
    
  output [SAMPLESPERCLOCK*8-1:0] IOut;
  output [SAMPLESPERCLOCK*8-1:0] QOut;
  output  ValidOut;
  
   genvar n;
   for (n=0;n<SAMPLESPERCLOCK/2;n=n+1) begin: in_loop
         assign IOut[((n+1)*16-1):(n*16)] = ADC[((n*32)+15):(n*32)];
         assign QOut[((n+1)*16-1):(n*16)] = ADC[((n*32)+31):((n*32)+16)];
   end

   assign ValidOut = ValidIn;

endmodule  // ADC_IQSeperator