`default_nettype none


module CRC_core (

    input wire i_clk,
    input wire i_rstn,
    input wire [63:0] i_8xframe,    //frame data arriving in 8-byte bus per clock cycle
  
    input wire i_valid,             //marks the start of transition and MUST remain high until the very last 8-bytes of your frame are received. 
                                    //If it's de-asserted before i_last is asserted, frame is invalid and both CRC and all internal registers must be reset.
  
    input wire i_last,              //marks the end of payload + FCS
  
    input wire i_corrupt,           //marks corrupted frame and stops processing transaction, remains high as long as the i_8xframe data on wire belongs to a corrupted frame

    output reg [31:0] o_crc         //32-bit CRC output updated per new 8-byte input until i_last is asserted
);



endmodule
