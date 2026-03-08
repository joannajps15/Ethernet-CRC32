module CRC_core (

input wire i_clk,
input wire i_rstn,
input wire [63:0] i_8xframe,
input wire i_valid,
input wire i_last,
input wire i_corrupt,

output reg [31:0] o_crc
);



endmodule
