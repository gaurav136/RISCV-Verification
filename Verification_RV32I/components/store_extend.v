
// store_extend.v - logic for extending the data and addr for storing word, half and byte

module store_extend (
    input   [31:0] y,
    input   [1:0] sel,
    output reg [31:0] data
);

always @(*) begin
    case(sel)
			2'b00: data = {{24{y[7]}}, y[7:0]}; //sb
			2'b01: data = {{16{y[15]}}, y[15:0]}; //sh
			2'b10: data = y; //sw
        default: data = y;
    endcase
end

endmodule
