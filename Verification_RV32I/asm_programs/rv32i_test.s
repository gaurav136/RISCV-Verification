

#Instructions                               #Calculation                    #PC         #Machine Code           #Note

# I type instruction related to register file
main:       addi    x1, x0, 1               # x1 = 1                        0                                   #initialized reg 1
            addi    x2, x0, 16              # x2 = 16                       4                                   #initialized reg 2
            addi    x3, x0, -3              # x3 = -3                       8                                   #initialized reg 3
            addi    x4, x0, 0               # x4 = 0                        C                                   #reg for status

            addi    x5, x3, 12              # x5 = (-3+12) = 9              10
            slli    x6, x2, 2               # x6 = (16 << 2) = 64           14
            slti    x7, x2, -16             # x7 = (16 > -16) = 0           18
            sltiu   x8, x2, -16             # x8 = (u(16) < u(-16))= 1      1C
            xori    x9, x2, 18              # x9 = (16 XOR 18) = 2          20
            srli    x10,x3, 3               # x10= (-3 >>3) = 536870911     24                                  #sign changed
            srai    x11,x3, 3               # x11= (-3 >>> 3) = -1          28                                  #sign not changed
            ori     x12,x3, 3               # x12= (-3 | 3) = -1            2c
            andi    x13,x3, 3               # x13= (-3 & 3) = 1             30

            # R type instructions  
            add     x14, x2, x1             # x14= (16 + 1) = 17            34
            sub     x15, x2, x1             # x15= (16 - 1) = 15            38
            sll     x16, x2, x1             # x16= (16 << 1) = 32           3c
            slt     x17, x2, x3             # x17= (16 > -3) = 0            40
            sltu    x18, x2, x3             # x18= (u(16) < u(-3)) = 1      44
            xor     x19, x2, x1             # x19= (16 XOR 1) = 17          48
            srl     x20, x2, x1             # x20= (16 >> 1) = 8            4C
            sra     x21, x2, x1             # x21= (16 >>> 1) = 8           50
            or      x22, x2, x1             # x22= (16 OR 1) = 17           54
            and     x23, x2, x1             # x23= (16 AND 1) = 0           58

            # U type instruction
            lui     x24, 0x2000             # x24= 0x02000_000              5C
            auipc   x25, 0x2000             # x25= 0x02000_060              60

            #S type instruction
            sb      x1, 16(x2)              # (16 + 16) = [32] = 1          64 
            sh      x3, 20(x2)              # (20 + 16) = [36] = -3         68 
            sw      x2, 24(x2)              # (24 + 16) = [40] = 16         6C

            # I type instruction for load
            lb      x26, 35(x3)             # x26 =[35 - 3]= 1              70
            lh      x27, 39(x3)             # x27 =[39 - 3]= -3             74
            lw      x28, 43(x3)             # x28 =[43 - 3]= 16             78
            lbu     x29, 35(x3)             # x29 =[35 - 3]= 1              7C
            lhu     x30, 39(x3)             # x30 =[39 - 3]= 0x0000FFFD     80  

            # Branch instuctions
            addi x6 , x0 , -5               #                               84
            addi x7 , x0 , 5                #                               88
target_1:   addi x6 , x6 ,1                 # blt t0, t1, target            8C           
            blt x6, x7, target_1            # if t0 < t1 then target        90                                 
            add x6, x0, x6                  # x6 = 5                        94

            addi x8 , x0 , -5               #                               98
            addi x9 , x0 , 5                #                               9C           
target_2:   addi x9, x9, -1                 # bge t0, t1, target            A0 
            bge x9, x8, target_2            # if t0 >= t1 then target       A4
            add x9, x0, x9                  # x9 = -6                       A8

            addi x10, x0, 1                 #***                            AC
            addi x11, x0, 5                 #                               B0
target_3:   addi x10, x10, 1                #                               B4
            bltu x10, x11, target_3         #                               B8
            add  x10, x0, x10               # x10 = 5                       BC             

            addi x12, x0, 1                 #                               C0
            addi x13, x0, 5                 #                               C4
target_4:   addi x13, x13, -1               #                               C8
            bgeu x13, x12, target_4         #                               CC
            add  x13, x0, x13               # x13 = 0                       D0

            beq x2, x3, target_x            # beq t0, t1, target            D4
            beq x2, x2, target_5            # if t0 == t1 then target       D8
            addi x4, x0, -1                 #                               DC


target_5:   addi x14, x0, 5                 #                               E0 
            addi x15, x0, 0                 #                               E4                
target_6:   addi x15, x15, 1                # bne t0, t1, target            E8 
            bne x15, x14, target_6          # if t0 != t1 then target       EC
            add x15 , x0 , x15              # x15 = 5                       F0    

            # J type instruction
            jalr     x31, 256(x0)           #                               F4
            addi x4 , x0 , -1               #                               F8

            # I type jump instruction       
target_x:   jal    x4,  target_x            #                               FC
target_7:   jal    x4,  target_7            #                               100 










