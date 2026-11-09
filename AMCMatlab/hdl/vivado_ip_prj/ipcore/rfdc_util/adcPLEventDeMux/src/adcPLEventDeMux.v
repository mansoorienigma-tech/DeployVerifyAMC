`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2021 02:41:46 PM
// Design Name: 
// Module Name: adcPLEventDeMux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adcPLEventDeMux(
    input PLEvent,
    output PLEvent_I,
    output PLEvent_Q
    );
    
assign PLEvent_I = PLEvent;
assign PLEvent_Q = PLEvent;
endmodule
