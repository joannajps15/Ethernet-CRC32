`default_nettype none

module lookup_table (
    input wire i_clk,
    input wire [8:0] i_byte,    // input byte to get related byte
    output reg [31:0] o_lookup  // table lookup result
);

    // On start, initialize table
    reg [31:0] 
    reg [255:0] LUT [0:31];
    wire [31:0] GEN = 32'h04C11DB7;

    // temporary, needs to be fixed
    integer i, j;
    reg [31:0] compute_crc;
    initial begin
        for (i = 0; i < 256; i++) begin
            // compute and store crc value in lut
            compute_crc = {24'b0, i[7:0]};
            for (j = 0; j < 8; j++) begin
                compute_crc = (compute_crc[0] == 1'b1) ? (compute_crc >> 1) ^ GEN : (compute_crc >> 1);
            end
            LUT[i] = compute_crc;
        end
    end

    // Retrieve valid entry from LUT, combinational reads for now
    always @ (*) begin
        o_lookup = LUT[i_byte]
    end

endmodule