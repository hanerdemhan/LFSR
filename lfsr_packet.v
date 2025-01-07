module lfsr_packet;
    parameter DATA_WIDTH = 16;
    parameter PLOY_LENGTH = 3;

    // Polinom sabiti
    integer c_POLYNOM [0:PLOY_LENGTH-1] = {13, 12, 10};

    // LFSR fonksiyonu
    function [DATA_WIDTH-1:0] f_lfsr;
        input [DATA_WIDTH-1:0] data;
        input [PLOY_LENGTH-1:0] POLYNOM;
        integer i;
        reg [DATA_WIDTH-1:0] v_data;
        reg v_zero;
    begin
        v_data = data;
        v_zero = v_data[0];
        v_data = {v_data[DATA_WIDTH-2:0], v_zero};  // Shift left
        
        // Polinomla geri besleme işlemi
        for (i = 0; i < PLOY_LENGTH; i = i + 1) begin
            v_data[POLYNOM[i]] = v_data[POLYNOM[i]] ^ v_zero;  // XOR işlemi
        end

        f_lfsr = v_data;  // Sonucu döndür
    end
    endfunction
endmodule
