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
localparam ADDI_x0  =   32'h8;
localparam ADDI     =   32'h10; 
localparam SLLI     =   32'h14;
localparam SLTI     =   32'h18;
localparam SLTIU    =   32'h1C;
localparam XORI     =   32'h20;
localparam SRLI     =   32'h24;
localparam SRAI     =   32'h28;
localparam ORI      =   32'h2C;
localparam ANDI     =   32'h30;

localparam ADD      =   32'h34; 
localparam SUB      =   32'h38;
localparam SLL      =   32'h3C;
localparam SLT      =   32'h40;
localparam SLTU     =   32'h44;
localparam XOR      =   32'h48;
localparam SRL      =   32'h4C;
localparam SRA      =   32'h50;
localparam OR       =   32'h54;
localparam AND      =   32'h58;

localparam LUI      =   32'h5C;
localparam AUIPC    =   32'h60;

localparam SB       =   32'h64;
localparam SH       =   32'h68;
localparam SW       =   32'h6C;

localparam LB       =   32'h70;
localparam LH       =   32'h74;
localparam LW       =   32'h78;
localparam LBU      =   32'h7C;
localparam LHU      =   32'h80;

localparam BLT_IN   =   32'h90;
localparam BLT_OUT  =   32'h9C;

localparam BGE_IN   =   32'hAC;
localparam BGE_OUT  =   32'hB8;

localparam BLTU_IN  =   32'hC8;
localparam BLTU_OUT =   32'hD4;

localparam BGEU_IN  =   32'hE4;
localparam BGEU_OUT =   32'hF0;

localparam BNE_IN   =   32'h100;
localparam BNE_OUT  =   32'h10C;

localparam BEQ_IN   =   32'h11C;
localparam BEQ_OUT  =   32'h128;

localparam JALR     =   32'h134;
localparam JAL      =   32'h138; 

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
            if(Result === -3 )
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
            if(Result === 9 )
            begin
                $display("addi is correct ");
            end
            else
            begin
                $display("Verify addi");
            end
        end

        SLLI    :
        begin
            if(Result === 64 )
            begin
                $display("slli is correct ");
            end
            else
            begin
                $display("Verify slli");
            end
        end

        SLTI    :
        begin
            if(Result === 0 )
            begin
                $display("slti is correct ");
            end
            else
            begin
                $display("Verify slti");
            end
        end

        SLTIU    :
        begin
            if(Result === 1 )
            begin
                $display("sltiu is correct ");
            end
            else
            begin
                $display("Verify sltiu");
            end
        end

        XORI    :
        begin
            if(Result === 2 )
            begin
                $display("xori is correct ");
            end
            else
            begin
                $display("Verify xori");
            end
        end

        SRLI    :
        begin
            if(Result === 536870911)
            begin
                $display("srli is correct ");
            end
            else
            begin
                $display("Verify srli");
            end
        end


        SRAI    :
        begin
            if(Result === -1 )
            begin
                $display("srai is correct ");
            end
            else
            begin
                $display("Verify srai");
            end
        end

        ORI    :
        begin
            if(Result === -1 )
            begin
                $display("ori is correct ");
            end
            else
            begin
                $display("Verify ori");
            end
        end

        ANDI    :
        begin
            if(Result === 1 )
            begin
                $display("andi is correct ");
            end
            else
            begin
                $display("Verify andi");
            end
        end

        ADD    :
        begin
            if(Result === 17 )
            begin
                $display("add is correct ");
            end
            else
            begin
                $display("Verify add");
            end
        end

        SUB    :
        begin
            if(Result === 15 )
            begin
                $display("sub is correct ");
            end
            else
            begin
                $display("Verify sub");
            end
        end


        SLL    :
        begin
            if(Result === 32 )
            begin
                $display("sll is correct ");
            end
            else
            begin
                $display("Verify sll");
            end
        end

        SLT    :
        begin
            if(Result === 0 )
            begin
                $display("slt is correct ");
            end
            else
            begin
                $display("Verify slt");
            end
        end

        SLTU    :
        begin
            if(Result === 1 )
            begin
                $display("sltu is correct ");
            end
            else
            begin
                $display("Verify sltu");
            end
        end

        XOR    :
        begin
            if(Result === 17 )
            begin
                $display("xor is correct ");
            end
            else
            begin
                $display("Verify xor");
            end
        end

        SRL    :
        begin
            if(Result === 8)
            begin
                $display("srl is correct ");
            end
            else
            begin
                $display("Verify srl");
            end
        end


        SRA    :
        begin
            if(Result === 8 )
            begin
                $display("sra is correct ");
            end
            else
            begin
                $display("Verify sra");
            end
        end

        OR    :
        begin
            if(Result === 17 )
            begin
                $display("or is correct ");
            end
            else
            begin
                $display("Verify or");
            end
        end

        AND    :
        begin
            if(Result === 0 )
            begin
                $display("and is correct ");
            end
            else
            begin
                $display("Verify and");
            end
        end

        LUI    :
        begin
            if(Result === 32'h02000000 )
            begin
                $display("lui is correct ");
            end
            else
            begin
                $display("Verify lui");
            end
        end

        AUIPC    :
        begin
            if(Result === 32'h02000060 )
            begin
                $display("auipc is correct ");
            end
            else
            begin
                $display("Verify auipc");
            end
        end

        
        SB      :
        begin
            if(MemWrite && !reset) begin
                if(DataAdr === 32 & WriteData === 1) begin
                    $display ("sb is correct");
                    //$display("Simulation succeeded");
                    //$stop;
                end
                else begin
                    $display("verify sb");
                    //$stop;
                end
            end
        end


        SH      :
        begin
            if(MemWrite && !reset) begin
                if(DataAdr === 36 & WriteData === -3) begin
                    $display ("sh is correct");
                    //$display("Simulation succeeded");
                    //$stop;
                end
                else begin
                    $display("verify sh");
                    //$stop;
                end
            end
        end


        SW      :
        begin
            if(MemWrite && !reset) begin
                if(DataAdr === 40 & WriteData === 16) begin
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

        LB      :
        begin
            if(DataAdr === 32 & Result === 1 ) begin
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

        LH      :
        begin
            if(DataAdr === 36 & Result === -3 ) begin
                     $display ("lh is correct");
                    //$display("Simulation succeeded");
                    //$stop;
            end
            else begin
                    $display("verify lh");
                    //$display("Simulation failed");
                    //$stop;
            end
        end

        LW      :
        begin
            if(DataAdr === 40 & Result === 16) begin
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

        LBU      :
        begin
            if(DataAdr === 32 & Result === 1) begin
                     $display ("lbu is correct");
                    //$display("Simulation succeeded");
                    //$stop;
            end
            else begin
                    $display("verify lbu");
                    //$display("Simulation failed");
                    //$stop;
            end
        end

        LHU     :
        begin
            if(DataAdr === 36 & Result === 32'h0000FFFD) begin
                     $display ("lhu is correct");
                    //$display("Simulation succeeded");
                    //$stop;
            end
            else begin
                    $display("verify lhu");
                    //$display("Simulation failed");
                    //$stop;
            end
        end

        BLT_IN :
        begin
            if(Result <= 32'hA)
            begin
                $display("blt is executing");
            end
            else
            begin
                $display("blt struck in loop");
                $stop;
            end
        end
        
        BLT_OUT :
        begin
            if(Result === 5)
            begin
                $display("blt is correct ");
            end
            else
            begin
                $display("Verify blt");
            end
        end

        BGE_IN :
        begin
            if(Result <= 32'hB)
            begin
                $display("beg is executing");
            end
            else
            begin
                $display("bge struck in loop");
                $stop;
            end
        end
        
        BGE_OUT :
        begin
            if(Result === -6)
            begin
                $display("bge is correct");
            end
            else
            begin
                $display("Verify bge");
            end
        end

        BLTU_IN :
        begin
            if(Result <= 4)
            begin
                $display("bltu is executing");
            end
            else
            begin
                $display("bltu struck in loop");
                $stop;
            end
        end
        
        BLTU_OUT :
        begin
            if(Result === 5)
            begin
                $display("bltu is correct ");
            end
            else
            begin
                $display("Verify bltu");
            end
        end

        BGEU_IN :
        begin
            if(Result <= 5)
            begin
                $display("begu is executing");
            end
            else
            begin
                $display("begu struck in loop");
                $stop;
            end
        end
        
        BGEU_OUT :
        begin
            if(Result === 0)
            begin
                $display("begu is correct ");
            end
            else
            begin
                $display("Verify begu");
            end
        end

        BNE_IN :
        begin
            if(Result <= 5)
            begin
                $display("bne is executing");
            end
            else
            begin
                $display("bne struck in loop");
                $stop;
            end
        end
        
        BNE_OUT :
        begin
            if(Result === 5)
            begin
                $display("bne is correct ");
            end
            else
            begin
                $display("Verify bne");
            end
        end

        BEQ_IN :
        begin
            if(Result <=2)
            begin
                $display("beq is executing");
            end
            else
            begin
                $display("beq struck in loop");
                $stop;
            end
        end
        
        BEQ_OUT :
        begin
            if(Result === 4)
            begin
                $display("beq is correct ");
            end
            else
            begin
                $display("Verify beq");
            end
        end

        JALR     :
        begin
            if(Result === 32'h130 )
            begin
                $display("jalr is correct ");
            end
            else
            begin
                $display("Verify jalr");
            end
        end
        
        JAL     :
        begin
            if(Result === 32'h13C )
            begin
                $display("jal is correct ");
                $display("Simulation succeeded");
                $stop;
            end
            else
            begin
                $display("Verify jal");
                $stop;
            end
        end
        
        // default :
        // begin
        //     $display("I don't know");       
        // end

    endcase
end

endmodule
