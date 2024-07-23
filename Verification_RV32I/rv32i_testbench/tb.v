`timescale 1 ns/1 ns

module tb;

// registers to send data
reg clk;
reg reset;
reg Ext_MemWrite;
reg [31:0] Ext_WriteData, Ext_DataAdr;

// Wire Ouputs from Instantiated Modules
wire [31:0] WriteData, DataAdr, ReadData;
wire MemWrite;
wire [31:0] PC, Result;

// Initialize Top Module
top_riscv_cpu uut (clk, reset, Ext_MemWrite, Ext_WriteData, Ext_DataAdr, MemWrite, WriteData, DataAdr, ReadData,PC,Result);

integer i = 0, data_1 = 0, data_2 = 0, data_3, cpu_data = 0;
reg flag = 0;

// generate clock to sequence tests
always begin
    clk <= 1; # 5; clk <= 0; # 5;
end

// check results of simple RISC-V CPU (from book)
// performing standard instructions
initial begin
    reset = 1;
    Ext_MemWrite = 0; Ext_DataAdr = 32'b0; Ext_WriteData = 32'b0; #10;
    reset = 0;
end

always @(negedge clk) begin
    # 10;
    if(MemWrite && !reset) begin
        if(DataAdr === 100 & WriteData === 25) begin
            $display("Simulation succeeded");
            $stop;
        end
        else if (DataAdr !== 96) begin
            $display("Simulation failed");
            $stop;
        end
    end
end

endmodule
