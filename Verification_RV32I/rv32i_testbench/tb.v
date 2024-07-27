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


// Test the RISC-V processor:
// ADDI, OR, AND, ADD, BEQ, SLT, SUB, SW, SL, JAL 

reg [32:0] PC_NEXT; 
localparam ADDI_x0  =   32'h0;
localparam ADDI     =   32'h8; 
localparam OR       =   32'hC;
localparam AND      =   32'h10;
localparam ADD      =   32'h14;
localparam BEQ      =   32'h18;
localparam SLT      =   32'h1C;
localparam SUB      =   32'h30;
localparam SW       =   32'h34;
localparam LW       =   32'h38;
localparam JAL      =   32'h40;
localparam SW_100   =   32'h4C;

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

// always @(negedge clk) begin
//     # 10;
//     if(MemWrite && !reset) begin
//         if(DataAdr === 100 & WriteData === 25) begin
//             $display("Simulation succeeded");
//             $stop;
//         end
//         else if (DataAdr !== 96) begin
//             $display("Simulation failed");
//             $stop;
//         end
//     end
// end

// Test the RISC-V processor:
// ADDI, OR, AND, ADD, BEQ, SLT, SUB, SW, SL, JAL 



always @(negedge clk) begin
//    # 10;
    case(PC)
        ADDI_x0 :
        begin
            if(Result == 32'd5 )
            begin
                $display("addi is correct for x0 ");
            end
            else
            begin
                $display("Verify addi for x0");
            end
        end

        ADDI    :
        begin
            if(Result == 32'd3 )
            begin
                $display("addi is correct ");
            end
            else
            begin
                $display("Verify addi");
            end
        end

        OR      :
        begin
            if(Result == 32'd7 )
            begin
                $display("or is correct ");
            end
            else
            begin
                $display("Verify or");
            end
        end

        AND     :
        begin
            if(Result == 32'd4 )
            begin
                $display("and is correct ");
            end
            else
            begin
                $display("Verify and");
            end
        end

        BEQ     :
        begin
            $display("working on it");
        end

        SLT     :
        begin
            if(Result == 32'd0 )
            begin
                $display("slti is correct ");
            end
            else
            begin
                $display("Verify slt");
            end
        end

        SUB     :
        begin
            if(Result == 32'd7 )
            begin
                $display("sub is correct ");
            end
            else
            begin
                $display("Verify sub");
            end
        end

        SW      :
        begin
            if(MemWrite && !reset) begin
                if(DataAdr === 96 & WriteData === 7) begin
                    $display ("sw is correct");
                    //$display("Simulation succeeded");
                    //$stop;
                end
                else begin
                    $display("verify sw");
                    //$stop;
                end
            end
        end

        LW      :
        begin
            if(DataAdr === 96 & Result === 7) begin
                     $display ("lw is correct");
                    //$display("Simulation succeeded");
                    //$stop;
            end
            else begin
                    $display("verify lw");
                    //$display("Simulation failed");
                    //$stop;
            end
        end

        
        JAL     :
        begin
            if(Result === 32'h44 )
            begin
                $display("Jal is correct ");
            end
            else
            begin
                $display("Verify Jal");
            end
        end
        
        // default :
        // begin
        //     $display("I don't know");       
        // end

        SW_100      :
        begin
            if(MemWrite && !reset) begin
                if(DataAdr === 100 & WriteData === 25) begin
                    $display ("sw is correct");
                    //$display("Simulation succeeded");
                    //$stop;
                end
                else begin
                    $display("verify sw");
                    //$stop;
                end
            end
        end

    endcase
end

endmodule
