module lfsr (
    input wire in_clk,
    input wire in_rst,
    output reg [DATA_WIDTH-1:0] out_rnd_data
);
    parameter INIT_VALUE = 16'hAAAA;  // Başlangıç değeri

    reg [DATA_WIDTH-1:0] r_rnd_data = INIT_VALUE;

    always @(posedge in_clk or posedge in_rst) begin
        if (in_rst) begin
            r_rnd_data <= INIT_VALUE;
        end else begin
            r_rnd_data <= f_lfsr(r_rnd_data, c_POLYNOM);
        end
    end

    assign out_rnd_data = r_rnd_data;

endmodule
