// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-17T09:55:35
// Bambu executed with: bambu --top-fname=max_pooling -DDOUBLE cpu_functions.cpp 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************


`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock,
  in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  Min_oe_ram,
  Mout_oe_ram,
  Min_we_ram,
  Mout_we_ram,
  Min_addr_ram,
  Mout_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Mout_Wdata_ram,
  Min_data_ram_size,
  Mout_data_ram_size,
  M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg [BITSIZE_in1-1:0] in1_in;
      reg [BITSIZE_in2-1:0] in2_in;
      wire [BITSIZE_out1-1:0] mult_res;
      reg [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock,
  reset,
  in1,
  in2r,
  in2w,
  in3r,
  in3w,
  in4r,
  in4w,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2r,
  proxy_in2w,
  proxy_in3r,
  proxy_in3w,
  proxy_in4r,
  proxy_in4w,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2r=1, PORTSIZE_in2r=2,
    BITSIZE_in2w=1, PORTSIZE_in2w=2,
    BITSIZE_in3r=1, PORTSIZE_in3r=2,
    BITSIZE_in3w=1, PORTSIZE_in3w=2,
    BITSIZE_in4r=1, PORTSIZE_in4r=2,
    BITSIZE_in4w=1, PORTSIZE_in4w=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2r=1, PORTSIZE_proxy_in2r=2,
    BITSIZE_proxy_in2w=1, PORTSIZE_proxy_in2w=2,
    BITSIZE_proxy_in3r=1, PORTSIZE_proxy_in3r=2,
    BITSIZE_proxy_in3w=1, PORTSIZE_proxy_in3w=2,
    BITSIZE_proxy_in4r=1, PORTSIZE_proxy_in4r=2,
    BITSIZE_proxy_in4w=1, PORTSIZE_proxy_in4w=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2r*BITSIZE_in2r)+(-1):0] in2r;
  input [(PORTSIZE_in2w*BITSIZE_in2w)+(-1):0] in2w;
  input [(PORTSIZE_in3r*BITSIZE_in3r)+(-1):0] in3r;
  input [(PORTSIZE_in3w*BITSIZE_in3w)+(-1):0] in3w;
  input [PORTSIZE_in4r-1:0] in4r;
  input [PORTSIZE_in4w-1:0] in4w;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2r*BITSIZE_proxy_in2r)+(-1):0] proxy_in2r;
  input [(PORTSIZE_proxy_in2w*BITSIZE_proxy_in2w)+(-1):0] proxy_in2w;
  input [(PORTSIZE_proxy_in3r*BITSIZE_proxy_in3r)+(-1):0] proxy_in3r;
  input [(PORTSIZE_proxy_in3w*BITSIZE_proxy_in3w)+(-1):0] proxy_in3w;
  input [(PORTSIZE_proxy_in4r*BITSIZE_proxy_in4r)+(-1):0] proxy_in4r;
  input [(PORTSIZE_proxy_in4w*BITSIZE_proxy_in4w)+(-1):0] proxy_in4w;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  
  `ifndef _SIM_HAVE_CLOG2
      function integer log2;
        input integer value;
        integer temp_value;
        begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
        end
      endfunction
  `endif
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr_r = BITSIZE_in2r > BITSIZE_proxy_in2r ? BITSIZE_in2r : BITSIZE_proxy_in2r;
  parameter nbit_addr_w = BITSIZE_in2w > BITSIZE_proxy_in2w ? BITSIZE_in2w : BITSIZE_proxy_in2w;
  `ifdef _SIM_HAVE_CLOG2
    localparam nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    localparam nbits_byte_offset = n_byte_on_databus<=1 ? 0 : $clog2(n_byte_on_databus);
  `else
    localparam nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    localparam nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_reads-1:0] memory_addr_a_r;
  wire [nbit_read_addr*max_n_writes-1:0] memory_addr_a_w;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr_r*max_n_reads-1:0] tmp_addr_r;
  wire [nbit_addr_w*max_n_writes-1:0] tmp_addr_w;
  wire [nbit_addr_r*max_n_reads-1:0] relative_addr_r;
  wire [nbit_addr_w*max_n_writes-1:0] relative_addr_w;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file,memory,0,n_elements-1);
  end
  
  generate
  genvar ind2_r;
  for (ind2_r=0; ind2_r<max_n_reads; ind2_r=ind2_r+1)
    begin : Lind2_r
      assign tmp_addr_r[(ind2_r+1)*nbit_addr_r-1:ind2_r*nbit_addr_r] = (proxy_sel_LOAD[ind2_r] && proxy_in4r[ind2_r]) ? proxy_in2r[(ind2_r+1)*BITSIZE_proxy_in2r-1:ind2_r*BITSIZE_proxy_in2r] : in2r[(ind2_r+1)*BITSIZE_in2r-1:ind2_r*BITSIZE_in2r];
    end
  endgenerate
  
  generate
  genvar ind2_w;
  for (ind2_w=0; ind2_w<max_n_writes; ind2_w=ind2_w+1)
    begin : Lind2_w
      assign tmp_addr_w[(ind2_w+1)*nbit_addr_w-1:ind2_w*nbit_addr_w] = (proxy_sel_STORE[ind2_w] && proxy_in4w[ind2_w]) ? proxy_in2w[(ind2_w+1)*BITSIZE_proxy_in2w-1:ind2_w*BITSIZE_proxy_in2w] : in2w[(ind2_w+1)*BITSIZE_in2w-1:ind2_w*BITSIZE_in2w];
    end
  endgenerate
  
  generate
  genvar i6_r;
    for (i6_r=0; i6_r<max_n_reads; i6_r=i6_r+1)
    begin : L6_r
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r] = tmp_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r];
      else
        assign relative_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r] = tmp_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i6_w;
    for (i6_w=0; i6_w<max_n_writes; i6_w=i6_w+1)
    begin : L6_w
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w] = tmp_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w];
      else
        assign relative_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w] = tmp_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7_r;
    for (i7_r=0; i7_r<max_n_reads; i7_r=i7_r+1)
    begin : L7_A_r
      if (n_elements==1)
        assign memory_addr_a_r[(i7_r+1)*nbit_read_addr-1:i7_r*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a_r[(i7_r+1)*nbit_read_addr-1:i7_r*nbit_read_addr] = relative_addr_r[nbit_read_addr+nbits_byte_offset-1+i7_r*nbit_addr_r:nbits_byte_offset+i7_r*nbit_addr_r];
    end
  endgenerate
  
  generate
  genvar i7_w;
    for (i7_w=0; i7_w<max_n_writes; i7_w=i7_w+1)
    begin : L7_A_w
      if (n_elements==1)
        assign memory_addr_a_w[(i7_w+1)*nbit_read_addr-1:i7_w*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a_w[(i7_w+1)*nbit_read_addr-1:i7_w*nbit_read_addr] = relative_addr_w[nbit_read_addr+nbits_byte_offset-1+i7_w*nbit_addr_w:nbits_byte_offset+i7_w*nbit_addr_w];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = (proxy_sel_STORE[i14] && proxy_in4w[i14]) ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a_r[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      for (index2=0; index2<max_n_writes; index2=index2+1)
      begin
        if(bram_write[index2])
          memory[memory_addr_a_w[nbit_read_addr*index2+:nbit_read_addr]] <= din_value_aggregated[data_size*index2+:data_size];
      end
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = (sel_STORE[i21] && in4w[i21]) || (proxy_sel_STORE[i21] && proxy_in4w[i21]);
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_UNSIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  localparam nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire [nbit_out-1:0] tmp_in1;
  wire [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){1'b0}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){1'b0}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_negate_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = -in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for __udivsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___udivsi3(clock,
  reset,
  in_port_u,
  in_port_v,
  return_port,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  selector_MUX_27_gimple_return_FU_62_i0_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___udivsi3_22275_28393);
  parameter MEM_var_27659_22275=1024;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_u;
  input [31:0] in_port_v;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  input selector_MUX_27_gimple_return_FU_62_i0_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [31:0] return_port;
  output OUT_CONDITION___udivsi3_22275_28393;
  // Component and signal declarations
  wire null_out_signal_array_27659_0_Sout_DataRdy_0;
  wire null_out_signal_array_27659_0_Sout_DataRdy_1;
  wire [63:0] null_out_signal_array_27659_0_Sout_Rdata_ram_0;
  wire [63:0] null_out_signal_array_27659_0_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_27659_0_out1_1;
  wire [63:0] null_out_signal_array_27659_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_27659_0_proxy_out1_1;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_27659_0;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_7_i0_fu___udivsi3_22275_43982;
  wire [4:0] out_IUdata_converter_FU_51_i0_fu___udivsi3_22275_28366;
  wire [31:0] out_MUX_27_gimple_return_FU_62_i0_0_0_0;
  wire signed [5:0] out_UIdata_converter_FU_48_i0_fu___udivsi3_22275_28359;
  wire out_UUdata_converter_FU_23_i0_fu___udivsi3_22275_43980;
  wire out_UUdata_converter_FU_26_i0_fu___udivsi3_22275_28351;
  wire out_UUdata_converter_FU_39_i0_fu___udivsi3_22275_28349;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253;
  wire out_UUdata_converter_FU_47_i0_fu___udivsi3_22275_28348;
  wire [4:0] out_UUdata_converter_FU_49_i0_fu___udivsi3_22275_28360;
  wire [7:0] out_UUdata_converter_FU_4_i0_fu___udivsi3_22275_28280;
  wire [7:0] out_UUdata_converter_FU_50_i0_fu___udivsi3_22275_43805;
  wire [7:0] out_UUdata_converter_FU_52_i0_fu___udivsi3_22275_28367;
  wire [31:0] out_UUdata_converter_FU_53_i0_fu___udivsi3_22275_28373;
  wire [31:0] out_UUdata_converter_FU_54_i0_fu___udivsi3_22275_28374;
  wire [31:0] out_UUdata_converter_FU_55_i0_fu___udivsi3_22275_28377;
  wire [31:0] out_UUdata_converter_FU_56_i0_fu___udivsi3_22275_28380;
  wire [31:0] out_UUdata_converter_FU_57_i0_fu___udivsi3_22275_28381;
  wire [31:0] out_UUdata_converter_FU_58_i0_fu___udivsi3_22275_28384;
  wire [31:0] out_UUdata_converter_FU_59_i0_fu___udivsi3_22275_28387;
  wire out_UUdata_converter_FU_5_i0_fu___udivsi3_22275_28354;
  wire [31:0] out_UUdata_converter_FU_60_i0_fu___udivsi3_22275_28390;
  wire [31:0] out_UUdata_converter_FU_8_i0_fu___udivsi3_22275_28386;
  wire [31:0] out_addr_expr_FU_6_i0_fu___udivsi3_22275_43818;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire out_const_11;
  wire [1:0] out_const_12;
  wire [3:0] out_const_13;
  wire [31:0] out_const_14;
  wire [4:0] out_const_15;
  wire [3:0] out_const_16;
  wire [4:0] out_const_17;
  wire [2:0] out_const_18;
  wire [4:0] out_const_19;
  wire [2:0] out_const_2;
  wire [62:0] out_const_20;
  wire [63:0] out_const_21;
  wire [63:0] out_const_22;
  wire [3:0] out_const_23;
  wire [4:0] out_const_24;
  wire [10:0] out_const_25;
  wire [1:0] out_const_26;
  wire [4:0] out_const_27;
  wire [4:0] out_const_28;
  wire [3:0] out_const_29;
  wire [3:0] out_const_3;
  wire [4:0] out_const_30;
  wire [4:0] out_const_31;
  wire [2:0] out_const_32;
  wire [4:0] out_const_33;
  wire [4:0] out_const_34;
  wire [3:0] out_const_35;
  wire [4:0] out_const_36;
  wire [31:0] out_const_37;
  wire [4:0] out_const_38;
  wire [5:0] out_const_39;
  wire [4:0] out_const_4;
  wire [31:0] out_const_40;
  wire [7:0] out_const_41;
  wire [63:0] out_const_42;
  wire [5:0] out_const_5;
  wire [6:0] out_const_6;
  wire [5:0] out_const_7;
  wire [4:0] out_const_8;
  wire [5:0] out_const_9;
  wire [31:0] out_conv_out_const_25_11_32;
  wire [6:0] out_conv_out_const_4_5_7;
  wire [31:0] out_conv_out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962_29_32;
  wire out_lut_expr_FU_10_i0_fu___udivsi3_22275_43942;
  wire out_lut_expr_FU_19_i0_fu___udivsi3_22275_44705;
  wire out_lut_expr_FU_20_i0_fu___udivsi3_22275_43965;
  wire out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711;
  wire out_lut_expr_FU_22_i0_fu___udivsi3_22275_44085;
  wire out_lut_expr_FU_24_i0_fu___udivsi3_22275_44715;
  wire out_lut_expr_FU_25_i0_fu___udivsi3_22275_43978;
  wire out_lut_expr_FU_40_i0_fu___udivsi3_22275_44721;
  wire out_lut_expr_FU_41_i0_fu___udivsi3_22275_44724;
  wire out_lut_expr_FU_42_i0_fu___udivsi3_22275_44728;
  wire out_lut_expr_FU_43_i0_fu___udivsi3_22275_44731;
  wire out_lut_expr_FU_44_i0_fu___udivsi3_22275_44734;
  wire out_lut_expr_FU_45_i0_fu___udivsi3_22275_44737;
  wire out_lut_expr_FU_46_i0_fu___udivsi3_22275_43958;
  wire out_lut_expr_FU_9_i0_fu___udivsi3_22275_43936;
  wire signed [5:0] out_minus_expr_FU_0_8_8_63_i0_fu___udivsi3_22275_28365;
  wire out_read_cond_FU_61_i0_fu___udivsi3_22275_28393;
  wire [4:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [27:0] out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_64_i0_fu___udivsi3_22275_43917;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_65_i0_fu___udivsi3_22275_28279;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_66_i0_fu___udivsi3_22275_28291;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_67_i0_fu___udivsi3_22275_28318;
  wire [28:0] out_ui_bit_ior_concat_expr_FU_68_i0_fu___udivsi3_22275_28508;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_69_i0_fu___udivsi3_22275_28353;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_70_i0_fu___udivsi3_22275_28356;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_71_i0_fu___udivsi3_22275_28357;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_72_i0_fu___udivsi3_22275_28358;
  wire [31:0] out_ui_bit_ior_expr_FU_32_0_32_73_i0_fu___udivsi3_22275_28369;
  wire [17:0] out_ui_cond_expr_FU_32_32_32_32_74_i0_fu___udivsi3_22275_43956;
  wire [28:0] out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962;
  wire [23:0] out_ui_cond_expr_FU_32_32_32_32_74_i2_fu___udivsi3_22275_43968;
  wire [21:0] out_ui_cond_expr_FU_32_32_32_32_74_i3_fu___udivsi3_22275_43976;
  wire [5:0] out_ui_cond_expr_FU_8_8_8_8_75_i0_fu___udivsi3_22275_43948;
  wire out_ui_eq_expr_FU_16_0_16_76_i0_fu___udivsi3_22275_28255;
  wire out_ui_eq_expr_FU_16_0_16_76_i1_fu___udivsi3_22275_28290;
  wire out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821;
  wire out_ui_eq_expr_FU_32_0_32_77_i0_fu___udivsi3_22275_28278;
  wire out_ui_eq_expr_FU_32_0_32_77_i1_fu___udivsi3_22275_28306;
  wire out_ui_eq_expr_FU_32_0_32_77_i2_fu___udivsi3_22275_28326;
  wire out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823;
  wire out_ui_eq_expr_FU_32_0_32_77_i4_fu___udivsi3_22275_43829;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_22275_44200;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___udivsi3_22275_44204;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_22275_44208;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_22275_44212;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___udivsi3_22275_44216;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___udivsi3_22275_44220;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___udivsi3_22275_44224;
  wire out_ui_extract_bit_expr_FU_18_i0_fu___udivsi3_22275_44228;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___udivsi3_22275_44521;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___udivsi3_22275_44625;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___udivsi3_22275_44683;
  wire out_ui_extract_bit_expr_FU_30_i0_fu___udivsi3_22275_44446;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___udivsi3_22275_44567;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___udivsi3_22275_44654;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___udivsi3_22275_44540;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___udivsi3_22275_44638;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___udivsi3_22275_44687;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___udivsi3_22275_44468;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___udivsi3_22275_44583;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___udivsi3_22275_44662;
  wire out_ui_le_expr_FU_32_32_32_78_i0_fu___udivsi3_22275_43831;
  wire out_ui_le_expr_FU_32_32_32_78_i1_fu___udivsi3_22275_43833;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_79_i0_fu___udivsi3_22275_28362;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_80_i0_fu___udivsi3_22275_28368;
  wire [28:0] out_ui_lshift_expr_FU_32_0_32_81_i0_fu___udivsi3_22275_43913;
  wire [19:0] out_ui_lshift_expr_FU_32_0_32_82_i0_fu___udivsi3_22275_44013;
  wire [18:0] out_ui_lshift_expr_FU_32_0_32_82_i1_fu___udivsi3_22275_44318;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_83_i0_fu___udivsi3_22275_44700;
  wire [30:0] out_ui_lshift_expr_FU_32_32_32_84_i0_fu___udivsi3_22275_28361;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_85_i0_fu___udivsi3_22275_28350;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_86_i0_fu___udivsi3_22275_28352;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_87_i0_fu___udivsi3_22275_28355;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_88_i0_fu___udivsi3_22275_43869;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_88_i1_fu___udivsi3_22275_43878;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_88_i2_fu___udivsi3_22275_43992;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_88_i3_fu___udivsi3_22275_44393;
  wire [6:0] out_ui_lshift_expr_FU_8_0_8_88_i4_fu___udivsi3_22275_44598;
  wire [6:0] out_ui_lshift_expr_FU_8_0_8_88_i5_fu___udivsi3_22275_44670;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_89_i0_fu___udivsi3_22275_44003;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_90_i0_fu___udivsi3_22275_28392;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_90_i1_fu___udivsi3_22275_28499;
  wire [31:0] out_ui_mult_expr_FU_32_32_32_0_91_i0_fu___udivsi3_22275_28372;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_91_i1_fu___udivsi3_22275_28375;
  wire [31:0] out_ui_mult_expr_FU_32_32_32_0_91_i2_fu___udivsi3_22275_28379;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_91_i3_fu___udivsi3_22275_28382;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_91_i4_fu___udivsi3_22275_28388;
  wire [31:0] out_ui_mult_expr_FU_32_32_32_0_91_i5_fu___udivsi3_22275_28391;
  wire [31:0] out_ui_negate_expr_FU_32_32_92_i0_fu___udivsi3_22275_28371;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_93_i0_fu___udivsi3_22275_28504;
  wire [27:0] out_ui_plus_expr_FU_32_0_32_94_i0_fu___udivsi3_22275_43909;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_95_i0_fu___udivsi3_22275_28378;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_95_i1_fu___udivsi3_22275_28385;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_96_i0_fu___udivsi3_22275_43812;
  wire [6:0] out_ui_rshift_expr_FU_16_0_16_97_i0_fu___udivsi3_22275_43862;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_100_i0_fu___udivsi3_22275_28272;
  wire [27:0] out_ui_rshift_expr_FU_32_0_32_101_i0_fu___udivsi3_22275_28277;
  wire [19:0] out_ui_rshift_expr_FU_32_0_32_101_i1_fu___udivsi3_22275_28321;
  wire [11:0] out_ui_rshift_expr_FU_32_0_32_102_i0_fu___udivsi3_22275_28289;
  wire [19:0] out_ui_rshift_expr_FU_32_0_32_103_i0_fu___udivsi3_22275_28309;
  wire [17:0] out_ui_rshift_expr_FU_32_0_32_104_i0_fu___udivsi3_22275_28325;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_105_i0_fu___udivsi3_22275_28363;
  wire [2:0] out_ui_rshift_expr_FU_32_0_32_106_i0_fu___udivsi3_22275_43872;
  wire [18:0] out_ui_rshift_expr_FU_32_0_32_106_i1_fu___udivsi3_22275_44009;
  wire [17:0] out_ui_rshift_expr_FU_32_0_32_106_i2_fu___udivsi3_22275_44313;
  wire [27:0] out_ui_rshift_expr_FU_32_0_32_107_i0_fu___udivsi3_22275_43905;
  wire [21:0] out_ui_rshift_expr_FU_32_0_32_108_i0_fu___udivsi3_22275_44692;
  wire [15:0] out_ui_rshift_expr_FU_32_0_32_98_i0_fu___udivsi3_22275_28254;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_99_i0_fu___udivsi3_22275_28267;
  wire [31:0] out_ui_rshift_expr_FU_32_32_32_109_i0_fu___udivsi3_22275_28370;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_110_i0_fu___udivsi3_22275_28376;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_110_i1_fu___udivsi3_22275_28383;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_110_i2_fu___udivsi3_22275_28389;
  wire [6:0] out_ui_rshift_expr_FU_8_0_8_111_i0_fu___udivsi3_22275_43985;
  wire [6:0] out_ui_rshift_expr_FU_8_0_8_111_i1_fu___udivsi3_22275_43988;
  wire [2:0] out_ui_rshift_expr_FU_8_0_8_111_i2_fu___udivsi3_22275_44006;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_111_i3_fu___udivsi3_22275_44310;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_111_i4_fu___udivsi3_22275_44389;
  wire [5:0] out_ui_rshift_expr_FU_8_0_8_111_i5_fu___udivsi3_22275_44591;
  wire [5:0] out_ui_rshift_expr_FU_8_0_8_111_i6_fu___udivsi3_22275_44594;
  wire [5:0] out_ui_rshift_expr_FU_8_0_8_111_i7_fu___udivsi3_22275_44666;
  wire [5:0] out_ui_rshift_expr_FU_8_0_8_112_i0_fu___udivsi3_22275_44696;
  
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_27_gimple_return_FU_62_i0_0_0_0 (.out1(out_MUX_27_gimple_return_FU_62_i0_0_0_0),
    .sel(selector_MUX_27_gimple_return_FU_62_i0_0_0_0),
    .in1(out_reg_14_reg_14),
    .in2(out_conv_out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962_29_32));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(32),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(32),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(7),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(7),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(32),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_27659.mem"),
    .n_elements(256),
    .data_size(8),
    .address_space_begin(MEM_var_27659_22275),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(32),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(32),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(7),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(7),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_27659_0 (.out1({null_out_signal_array_27659_0_out1_1,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_27659_0}),
    .Sout_Rdata_ram({null_out_signal_array_27659_0_Sout_Rdata_ram_1,
      null_out_signal_array_27659_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_27659_0_Sout_DataRdy_1,
      null_out_signal_array_27659_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_27659_0_proxy_out1_1,
      null_out_signal_array_27659_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({32'b00000000000000000000000000000000,
      out_reg_3_reg_3}),
    .in2w({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in3r({7'b0000000,
      out_conv_out_const_4_5_7}),
    .in3w({7'b0000000,
      7'b0000000}),
    .in4r({1'b0,
      out_const_11}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .S_data_ram_size({7'b0000000,
      7'b0000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2r({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2w({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in3r({7'b0000000,
      7'b0000000}),
    .proxy_in3w({7'b0000000,
      7'b0000000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10000000000000000000000000000000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b101010101010101010101010101010001010101010101010101010101010101)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1010101010101010101010101010101110101010101010101010101010101010)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1010111111001111101000001100111110101111110000001010000011000000)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1011)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(11),
    .value(MEM_var_27659_22275)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11000)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11010)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11110111101000101101010110000000)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111101011101011010100000100000)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111100000000000000010000000000000000)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010100)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01100)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(32)) conv_out_const_25_11_32 (.out1(out_conv_out_const_25_11_32),
    .in1(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(7)) conv_out_const_4_5_7 (.out1(out_conv_out_const_4_5_7),
    .in1(out_const_4));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(32)) conv_out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962_29_32 (.out1(out_conv_out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962_29_32),
    .in1(out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28253 (.out1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in1(in_port_v));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___udivsi3_22275_28254 (.out1(out_ui_rshift_expr_FU_32_0_32_98_i0_fu___udivsi3_22275_28254),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in2(out_const_5));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28255 (.out1(out_ui_eq_expr_FU_16_0_16_76_i0_fu___udivsi3_22275_28255),
    .in1(out_ui_rshift_expr_FU_32_0_32_98_i0_fu___udivsi3_22275_28254),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___udivsi3_22275_28267 (.out1(out_ui_rshift_expr_FU_32_0_32_99_i0_fu___udivsi3_22275_28267),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___udivsi3_22275_28272 (.out1(out_ui_rshift_expr_FU_32_0_32_100_i0_fu___udivsi3_22275_28272),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(28),
    .PRECISION(64)) fu___udivsi3_22275_28277 (.out1(out_ui_rshift_expr_FU_32_0_32_101_i0_fu___udivsi3_22275_28277),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in2(out_const_3));
  ui_eq_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28278 (.out1(out_ui_eq_expr_FU_32_0_32_77_i0_fu___udivsi3_22275_28278),
    .in1(out_ui_rshift_expr_FU_32_0_32_101_i0_fu___udivsi3_22275_28277),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___udivsi3_22275_28279 (.out1(out_ui_bit_and_expr_FU_8_0_8_65_i0_fu___udivsi3_22275_28279),
    .in1(in_port_v),
    .in2(out_const_41));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___udivsi3_22275_28280 (.out1(out_UUdata_converter_FU_4_i0_fu___udivsi3_22275_28280),
    .in1(out_ui_bit_and_expr_FU_8_0_8_65_i0_fu___udivsi3_22275_28279));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(12),
    .PRECISION(64)) fu___udivsi3_22275_28289 (.out1(out_ui_rshift_expr_FU_32_0_32_102_i0_fu___udivsi3_22275_28289),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in2(out_const_7));
  ui_eq_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28290 (.out1(out_ui_eq_expr_FU_16_0_16_76_i1_fu___udivsi3_22275_28290),
    .in1(out_ui_rshift_expr_FU_32_0_32_102_i0_fu___udivsi3_22275_28289),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___udivsi3_22275_28291 (.out1(out_ui_bit_and_expr_FU_8_0_8_66_i0_fu___udivsi3_22275_28291),
    .in1(out_ui_rshift_expr_FU_8_0_8_111_i7_fu___udivsi3_22275_44666),
    .in2(out_const_39));
  ui_eq_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28306 (.out1(out_ui_eq_expr_FU_32_0_32_77_i1_fu___udivsi3_22275_28306),
    .in1(out_ui_rshift_expr_FU_32_0_32_103_i0_fu___udivsi3_22275_28309),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(20),
    .PRECISION(64)) fu___udivsi3_22275_28309 (.out1(out_ui_rshift_expr_FU_32_0_32_103_i0_fu___udivsi3_22275_28309),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_22275_28253),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___udivsi3_22275_28318 (.out1(out_ui_bit_and_expr_FU_8_0_8_67_i0_fu___udivsi3_22275_28318),
    .in1(out_ui_rshift_expr_FU_8_0_8_111_i4_fu___udivsi3_22275_44389),
    .in2(out_const_26));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(4),
    .BITSIZE_out1(20),
    .PRECISION(64)) fu___udivsi3_22275_28321 (.out1(out_ui_rshift_expr_FU_32_0_32_101_i1_fu___udivsi3_22275_28321),
    .in1(out_ui_lshift_expr_FU_32_0_32_83_i0_fu___udivsi3_22275_44700),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(3),
    .BITSIZE_out1(18),
    .PRECISION(64)) fu___udivsi3_22275_28325 (.out1(out_ui_rshift_expr_FU_32_0_32_104_i0_fu___udivsi3_22275_28325),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i0_fu___udivsi3_22275_44013),
    .in2(out_const_2));
  ui_eq_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28326 (.out1(out_ui_eq_expr_FU_32_0_32_77_i2_fu___udivsi3_22275_28326),
    .in1(out_ui_rshift_expr_FU_32_0_32_104_i0_fu___udivsi3_22275_28325),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28348 (.out1(out_UUdata_converter_FU_47_i0_fu___udivsi3_22275_28348),
    .in1(out_lut_expr_FU_46_i0_fu___udivsi3_22275_43958));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28349 (.out1(out_UUdata_converter_FU_39_i0_fu___udivsi3_22275_28349),
    .in1(out_ui_eq_expr_FU_32_0_32_77_i2_fu___udivsi3_22275_28326));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___udivsi3_22275_28350 (.out1(out_ui_lshift_expr_FU_8_0_8_85_i0_fu___udivsi3_22275_28350),
    .in1(out_UUdata_converter_FU_39_i0_fu___udivsi3_22275_28349),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28351 (.out1(out_UUdata_converter_FU_26_i0_fu___udivsi3_22275_28351),
    .in1(out_lut_expr_FU_25_i0_fu___udivsi3_22275_43978));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___udivsi3_22275_28352 (.out1(out_ui_lshift_expr_FU_8_0_8_86_i0_fu___udivsi3_22275_28352),
    .in1(out_UUdata_converter_FU_26_i0_fu___udivsi3_22275_28351),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___udivsi3_22275_28353 (.out1(out_ui_bit_ior_expr_FU_0_8_8_69_i0_fu___udivsi3_22275_28353),
    .in1(out_ui_lshift_expr_FU_8_0_8_85_i0_fu___udivsi3_22275_28350),
    .in2(out_ui_lshift_expr_FU_8_0_8_86_i0_fu___udivsi3_22275_28352));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_28354 (.out1(out_UUdata_converter_FU_5_i0_fu___udivsi3_22275_28354),
    .in1(out_ui_eq_expr_FU_16_0_16_76_i0_fu___udivsi3_22275_28255));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___udivsi3_22275_28355 (.out1(out_ui_lshift_expr_FU_8_0_8_87_i0_fu___udivsi3_22275_28355),
    .in1(out_UUdata_converter_FU_5_i0_fu___udivsi3_22275_28354),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5)) fu___udivsi3_22275_28356 (.out1(out_ui_bit_ior_expr_FU_0_8_8_70_i0_fu___udivsi3_22275_28356),
    .in1(out_ui_lshift_expr_FU_8_0_8_87_i0_fu___udivsi3_22275_28355),
    .in2(out_ui_lshift_expr_FU_8_0_8_89_i0_fu___udivsi3_22275_44003));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___udivsi3_22275_28357 (.out1(out_ui_bit_ior_expr_FU_0_8_8_71_i0_fu___udivsi3_22275_28357),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_69_i0_fu___udivsi3_22275_28353),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_70_i0_fu___udivsi3_22275_28356));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___udivsi3_22275_28358 (.out1(out_ui_bit_ior_expr_FU_0_8_8_72_i0_fu___udivsi3_22275_28358),
    .in1(out_UUdata_converter_FU_47_i0_fu___udivsi3_22275_28348),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_71_i0_fu___udivsi3_22275_28357));
  UIdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(6)) fu___udivsi3_22275_28359 (.out1(out_UIdata_converter_FU_48_i0_fu___udivsi3_22275_28359),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_72_i0_fu___udivsi3_22275_28358));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___udivsi3_22275_28360 (.out1(out_UUdata_converter_FU_49_i0_fu___udivsi3_22275_28360),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_72_i0_fu___udivsi3_22275_28358));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu___udivsi3_22275_28361 (.out1(out_ui_lshift_expr_FU_32_32_32_84_i0_fu___udivsi3_22275_28361),
    .in1(in_port_v),
    .in2(out_UUdata_converter_FU_49_i0_fu___udivsi3_22275_28360));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___udivsi3_22275_28362 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i0_fu___udivsi3_22275_28362),
    .in1(out_ui_lshift_expr_FU_32_32_32_84_i0_fu___udivsi3_22275_28361),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(32)) fu___udivsi3_22275_28363 (.out1(out_ui_rshift_expr_FU_32_0_32_105_i0_fu___udivsi3_22275_28363),
    .in1(out_ui_lshift_expr_FU_32_0_32_79_i0_fu___udivsi3_22275_28362),
    .in2(out_const_27));
  minus_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___udivsi3_22275_28365 (.out1(out_minus_expr_FU_0_8_8_63_i0_fu___udivsi3_22275_28365),
    .in1(out_const_10),
    .in2(out_UIdata_converter_FU_48_i0_fu___udivsi3_22275_28359));
  IUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(5)) fu___udivsi3_22275_28366 (.out1(out_IUdata_converter_FU_51_i0_fu___udivsi3_22275_28366),
    .in1(out_minus_expr_FU_0_8_8_63_i0_fu___udivsi3_22275_28365));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___udivsi3_22275_28367 (.out1(out_UUdata_converter_FU_52_i0_fu___udivsi3_22275_28367),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_27659_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu___udivsi3_22275_28368 (.out1(out_ui_lshift_expr_FU_32_0_32_80_i0_fu___udivsi3_22275_28368),
    .in1(out_UUdata_converter_FU_52_i0_fu___udivsi3_22275_28367),
    .in2(out_const_24));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28369 (.out1(out_ui_bit_ior_expr_FU_32_0_32_73_i0_fu___udivsi3_22275_28369),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i0_fu___udivsi3_22275_28368),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___udivsi3_22275_28370 (.out1(out_ui_rshift_expr_FU_32_32_32_109_i0_fu___udivsi3_22275_28370),
    .in1(out_ui_bit_ior_expr_FU_32_0_32_73_i0_fu___udivsi3_22275_28369),
    .in2(out_reg_0_reg_0));
  ui_negate_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28371 (.out1(out_ui_negate_expr_FU_32_32_92_i0_fu___udivsi3_22275_28371),
    .in1(in_port_v));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu___udivsi3_22275_28372 (.out1(out_ui_mult_expr_FU_32_32_32_0_91_i0_fu___udivsi3_22275_28372),
    .clock(clock),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28373 (.out1(out_UUdata_converter_FU_53_i0_fu___udivsi3_22275_28373),
    .in1(out_ui_rshift_expr_FU_32_32_32_109_i0_fu___udivsi3_22275_28370));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28374 (.out1(out_UUdata_converter_FU_54_i0_fu___udivsi3_22275_28374),
    .in1(out_ui_mult_expr_FU_32_32_32_0_91_i0_fu___udivsi3_22275_28372));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___udivsi3_22275_28375 (.out1(out_ui_mult_expr_FU_32_32_32_0_91_i1_fu___udivsi3_22275_28375),
    .clock(clock),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_7_reg_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_22275_28376 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___udivsi3_22275_28376),
    .in1(out_ui_mult_expr_FU_32_32_32_0_91_i1_fu___udivsi3_22275_28375),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28377 (.out1(out_UUdata_converter_FU_55_i0_fu___udivsi3_22275_28377),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___udivsi3_22275_28376));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28378 (.out1(out_ui_plus_expr_FU_32_32_32_95_i0_fu___udivsi3_22275_28378),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_8_reg_8));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu___udivsi3_22275_28379 (.out1(out_ui_mult_expr_FU_32_32_32_0_91_i2_fu___udivsi3_22275_28379),
    .clock(clock),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28380 (.out1(out_UUdata_converter_FU_56_i0_fu___udivsi3_22275_28380),
    .in1(out_ui_plus_expr_FU_32_32_32_95_i0_fu___udivsi3_22275_28378));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28381 (.out1(out_UUdata_converter_FU_57_i0_fu___udivsi3_22275_28381),
    .in1(out_ui_mult_expr_FU_32_32_32_0_91_i2_fu___udivsi3_22275_28379));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___udivsi3_22275_28382 (.out1(out_ui_mult_expr_FU_32_32_32_0_91_i3_fu___udivsi3_22275_28382),
    .clock(clock),
    .in1(out_reg_10_reg_10),
    .in2(out_reg_11_reg_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_22275_28383 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___udivsi3_22275_28383),
    .in1(out_ui_mult_expr_FU_32_32_32_0_91_i3_fu___udivsi3_22275_28382),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28384 (.out1(out_UUdata_converter_FU_58_i0_fu___udivsi3_22275_28384),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___udivsi3_22275_28383));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28385 (.out1(out_ui_plus_expr_FU_32_32_32_95_i1_fu___udivsi3_22275_28385),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28386 (.out1(out_UUdata_converter_FU_8_i0_fu___udivsi3_22275_28386),
    .in1(in_port_u));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28387 (.out1(out_UUdata_converter_FU_59_i0_fu___udivsi3_22275_28387),
    .in1(out_ui_plus_expr_FU_32_32_32_95_i1_fu___udivsi3_22275_28385));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___udivsi3_22275_28388 (.out1(out_ui_mult_expr_FU_32_32_32_0_91_i4_fu___udivsi3_22275_28388),
    .clock(clock),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_13_reg_13));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_22275_28389 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___udivsi3_22275_28389),
    .in1(out_ui_mult_expr_FU_32_32_32_0_91_i4_fu___udivsi3_22275_28388),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28390 (.out1(out_UUdata_converter_FU_60_i0_fu___udivsi3_22275_28390),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___udivsi3_22275_28389));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu___udivsi3_22275_28391 (.out1(out_ui_mult_expr_FU_32_32_32_0_91_i5_fu___udivsi3_22275_28391),
    .clock(clock),
    .in1(in_port_v),
    .in2(out_reg_14_reg_14));
  ui_minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28392 (.out1(out_ui_minus_expr_FU_32_32_32_90_i0_fu___udivsi3_22275_28392),
    .in1(in_port_u),
    .in2(out_reg_17_reg_17));
  read_cond_FU #(.BITSIZE_in1(1)) fu___udivsi3_22275_28393 (.out1(out_read_cond_FU_61_i0_fu___udivsi3_22275_28393),
    .in1(out_ui_le_expr_FU_32_32_32_78_i0_fu___udivsi3_22275_43831));
  ui_minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_28499 (.out1(out_ui_minus_expr_FU_32_32_32_90_i1_fu___udivsi3_22275_28499),
    .in1(out_reg_18_reg_18),
    .in2(in_port_v));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu___udivsi3_22275_28504 (.out1(out_ui_plus_expr_FU_32_0_32_93_i0_fu___udivsi3_22275_28504),
    .in1(out_reg_14_reg_14),
    .in2(out_const_11));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(29),
    .OFFSET_PARAMETER(1)) fu___udivsi3_22275_28508 (.out1(out_ui_bit_ior_concat_expr_FU_68_i0_fu___udivsi3_22275_28508),
    .in1(out_ui_lshift_expr_FU_32_0_32_81_i0_fu___udivsi3_22275_43913),
    .in2(out_reg_16_reg_16),
    .in3(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___udivsi3_22275_43805 (.out1(out_UUdata_converter_FU_50_i0_fu___udivsi3_22275_43805),
    .in1(out_ui_rshift_expr_FU_32_0_32_105_i0_fu___udivsi3_22275_28363));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___udivsi3_22275_43812 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_96_i0_fu___udivsi3_22275_43812),
    .in1(out_addr_expr_FU_6_i0_fu___udivsi3_22275_43818),
    .in2(out_UUdata_converter_FU_50_i0_fu___udivsi3_22275_43805));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_43818 (.out1(out_addr_expr_FU_6_i0_fu___udivsi3_22275_43818),
    .in1(out_conv_out_const_25_11_32));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43821 (.out1(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in1(out_ui_rshift_expr_FU_32_0_32_98_i0_fu___udivsi3_22275_28254),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43823 (.out1(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in1(out_ui_rshift_expr_FU_32_0_32_99_i0_fu___udivsi3_22275_28267),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43829 (.out1(out_ui_eq_expr_FU_32_0_32_77_i4_fu___udivsi3_22275_43829),
    .in1(out_ui_rshift_expr_FU_32_0_32_104_i0_fu___udivsi3_22275_28325),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43831 (.out1(out_ui_le_expr_FU_32_32_32_78_i0_fu___udivsi3_22275_43831),
    .in1(in_port_v),
    .in2(out_ui_minus_expr_FU_32_32_32_90_i0_fu___udivsi3_22275_28392));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43833 (.out1(out_ui_le_expr_FU_32_32_32_78_i1_fu___udivsi3_22275_43833),
    .in1(in_port_v),
    .in2(out_ui_minus_expr_FU_32_32_32_90_i1_fu___udivsi3_22275_28499));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(7),
    .PRECISION(64)) fu___udivsi3_22275_43862 (.out1(out_ui_rshift_expr_FU_16_0_16_97_i0_fu___udivsi3_22275_43862),
    .in1(out_ui_rshift_expr_FU_32_0_32_98_i0_fu___udivsi3_22275_28254),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(1),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___udivsi3_22275_43869 (.out1(out_ui_lshift_expr_FU_8_0_8_88_i0_fu___udivsi3_22275_43869),
    .in1(out_ui_lshift_expr_FU_8_0_8_88_i5_fu___udivsi3_22275_44670),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___udivsi3_22275_43872 (.out1(out_ui_rshift_expr_FU_32_0_32_106_i0_fu___udivsi3_22275_43872),
    .in1(out_ui_lshift_expr_FU_32_0_32_83_i0_fu___udivsi3_22275_44700),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___udivsi3_22275_43878 (.out1(out_ui_lshift_expr_FU_8_0_8_88_i1_fu___udivsi3_22275_43878),
    .in1(out_ui_lshift_expr_FU_8_0_8_88_i3_fu___udivsi3_22275_44393),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(28),
    .PRECISION(32)) fu___udivsi3_22275_43905 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___udivsi3_22275_43905),
    .in1(out_UUdata_converter_FU_60_i0_fu___udivsi3_22275_28390),
    .in2(out_const_11));
  ui_plus_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(1),
    .BITSIZE_out1(28)) fu___udivsi3_22275_43909 (.out1(out_ui_plus_expr_FU_32_0_32_94_i0_fu___udivsi3_22275_43909),
    .in1(out_reg_15_reg_15),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___udivsi3_22275_43913 (.out1(out_ui_lshift_expr_FU_32_0_32_81_i0_fu___udivsi3_22275_43913),
    .in1(out_ui_plus_expr_FU_32_0_32_94_i0_fu___udivsi3_22275_43909),
    .in2(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43917 (.out1(out_ui_bit_and_expr_FU_1_0_1_64_i0_fu___udivsi3_22275_43917),
    .in1(out_UUdata_converter_FU_60_i0_fu___udivsi3_22275_28390),
    .in2(out_const_11));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43936 (.out1(out_lut_expr_FU_9_i0_fu___udivsi3_22275_43936),
    .in1(out_const_13),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43942 (.out1(out_lut_expr_FU_10_i0_fu___udivsi3_22275_43942),
    .in1(out_const_12),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_in3(6),
    .BITSIZE_out1(6)) fu___udivsi3_22275_43948 (.out1(out_ui_cond_expr_FU_8_8_8_8_75_i0_fu___udivsi3_22275_43948),
    .in1(out_lut_expr_FU_9_i0_fu___udivsi3_22275_43936),
    .in2(out_ui_rshift_expr_FU_8_0_8_111_i5_fu___udivsi3_22275_44591),
    .in3(out_ui_rshift_expr_FU_8_0_8_111_i6_fu___udivsi3_22275_44594));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(18),
    .BITSIZE_out1(18)) fu___udivsi3_22275_43956 (.out1(out_ui_cond_expr_FU_32_32_32_32_74_i0_fu___udivsi3_22275_43956),
    .in1(out_lut_expr_FU_25_i0_fu___udivsi3_22275_43978),
    .in2(out_ui_rshift_expr_FU_8_0_8_111_i3_fu___udivsi3_22275_44310),
    .in3(out_ui_rshift_expr_FU_32_0_32_106_i2_fu___udivsi3_22275_44313));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43958 (.out1(out_lut_expr_FU_46_i0_fu___udivsi3_22275_43958),
    .in1(out_const_31),
    .in2(out_ui_eq_expr_FU_32_0_32_77_i4_fu___udivsi3_22275_43829),
    .in3(out_lut_expr_FU_42_i0_fu___udivsi3_22275_44728),
    .in4(out_lut_expr_FU_45_i0_fu___udivsi3_22275_44737),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(29),
    .BITSIZE_in3(29),
    .BITSIZE_out1(29)) fu___udivsi3_22275_43962 (.out1(out_ui_cond_expr_FU_32_32_32_32_74_i1_fu___udivsi3_22275_43962),
    .in1(out_ui_le_expr_FU_32_32_32_78_i1_fu___udivsi3_22275_43833),
    .in2(out_ui_bit_ior_concat_expr_FU_68_i0_fu___udivsi3_22275_28508),
    .in3(out_ui_plus_expr_FU_32_0_32_93_i0_fu___udivsi3_22275_28504));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43965 (.out1(out_lut_expr_FU_20_i0_fu___udivsi3_22275_43965),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_22275_44200),
    .in4(out_ui_extract_bit_expr_FU_12_i0_fu___udivsi3_22275_44204),
    .in5(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_22275_44208),
    .in6(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_22275_44212),
    .in7(out_lut_expr_FU_19_i0_fu___udivsi3_22275_44705),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(24),
    .BITSIZE_in3(8),
    .BITSIZE_out1(24)) fu___udivsi3_22275_43968 (.out1(out_ui_cond_expr_FU_32_32_32_32_74_i2_fu___udivsi3_22275_43968),
    .in1(out_lut_expr_FU_10_i0_fu___udivsi3_22275_43942),
    .in2(out_ui_rshift_expr_FU_32_0_32_99_i0_fu___udivsi3_22275_28267),
    .in3(out_ui_lshift_expr_FU_8_0_8_88_i2_fu___udivsi3_22275_43992));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(22),
    .BITSIZE_in3(6),
    .BITSIZE_out1(22)) fu___udivsi3_22275_43976 (.out1(out_ui_cond_expr_FU_32_32_32_32_74_i3_fu___udivsi3_22275_43976),
    .in1(out_lut_expr_FU_20_i0_fu___udivsi3_22275_43965),
    .in2(out_ui_rshift_expr_FU_32_0_32_108_i0_fu___udivsi3_22275_44692),
    .in3(out_ui_rshift_expr_FU_8_0_8_112_i0_fu___udivsi3_22275_44696));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43978 (.out1(out_lut_expr_FU_25_i0_fu___udivsi3_22275_43978),
    .in1(out_const_42),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___udivsi3_22275_44216),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___udivsi3_22275_44220),
    .in4(out_ui_extract_bit_expr_FU_17_i0_fu___udivsi3_22275_44224),
    .in5(out_ui_extract_bit_expr_FU_18_i0_fu___udivsi3_22275_44228),
    .in6(out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711),
    .in7(out_lut_expr_FU_24_i0_fu___udivsi3_22275_44715),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_43980 (.out1(out_UUdata_converter_FU_23_i0_fu___udivsi3_22275_43980),
    .in1(out_lut_expr_FU_22_i0_fu___udivsi3_22275_44085));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_22275_43982 (.out1(out_ASSIGN_UNSIGNED_FU_7_i0_fu___udivsi3_22275_43982),
    .in1(out_ui_negate_expr_FU_32_32_92_i0_fu___udivsi3_22275_28371));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(7),
    .PRECISION(64)) fu___udivsi3_22275_43985 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i0_fu___udivsi3_22275_43985),
    .in1(out_UUdata_converter_FU_4_i0_fu___udivsi3_22275_28280),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(7),
    .PRECISION(64)) fu___udivsi3_22275_43988 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i1_fu___udivsi3_22275_43988),
    .in1(out_ui_lshift_expr_FU_8_0_8_88_i0_fu___udivsi3_22275_43869),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(1),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___udivsi3_22275_43992 (.out1(out_ui_lshift_expr_FU_8_0_8_88_i2_fu___udivsi3_22275_43992),
    .in1(out_ui_lshift_expr_FU_8_0_8_88_i4_fu___udivsi3_22275_44598),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___udivsi3_22275_44003 (.out1(out_ui_lshift_expr_FU_8_0_8_89_i0_fu___udivsi3_22275_44003),
    .in1(out_UUdata_converter_FU_23_i0_fu___udivsi3_22275_43980),
    .in2(out_const_26));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___udivsi3_22275_44006 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i2_fu___udivsi3_22275_44006),
    .in1(out_ui_lshift_expr_FU_8_0_8_88_i1_fu___udivsi3_22275_43878),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(1),
    .BITSIZE_out1(19),
    .PRECISION(64)) fu___udivsi3_22275_44009 (.out1(out_ui_rshift_expr_FU_32_0_32_106_i1_fu___udivsi3_22275_44009),
    .in1(out_ui_rshift_expr_FU_32_0_32_101_i1_fu___udivsi3_22275_28321),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(1),
    .BITSIZE_out1(20),
    .PRECISION(64)) fu___udivsi3_22275_44013 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i0_fu___udivsi3_22275_44013),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i1_fu___udivsi3_22275_44318),
    .in2(out_const_11));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44085 (.out1(out_lut_expr_FU_22_i0_fu___udivsi3_22275_44085),
    .in1(out_const_29),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44200 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_22275_44200),
    .in1(in_port_v),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44204 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___udivsi3_22275_44204),
    .in1(in_port_v),
    .in2(out_const_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44208 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_22275_44208),
    .in1(in_port_v),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44212 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_22275_44212),
    .in1(in_port_v),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44216 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___udivsi3_22275_44216),
    .in1(in_port_v),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44220 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___udivsi3_22275_44220),
    .in1(in_port_v),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44224 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___udivsi3_22275_44224),
    .in1(in_port_v),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44228 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu___udivsi3_22275_44228),
    .in1(in_port_v),
    .in2(out_const_38));
  ui_rshift_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___udivsi3_22275_44310 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i3_fu___udivsi3_22275_44310),
    .in1(out_ui_rshift_expr_FU_8_0_8_111_i2_fu___udivsi3_22275_44006),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(1),
    .BITSIZE_out1(18),
    .PRECISION(64)) fu___udivsi3_22275_44313 (.out1(out_ui_rshift_expr_FU_32_0_32_106_i2_fu___udivsi3_22275_44313),
    .in1(out_ui_rshift_expr_FU_32_0_32_106_i1_fu___udivsi3_22275_44009),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(1),
    .BITSIZE_out1(19),
    .PRECISION(64)) fu___udivsi3_22275_44318 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i1_fu___udivsi3_22275_44318),
    .in1(out_ui_cond_expr_FU_32_32_32_32_74_i0_fu___udivsi3_22275_43956),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___udivsi3_22275_44389 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i4_fu___udivsi3_22275_44389),
    .in1(out_ui_rshift_expr_FU_32_0_32_106_i0_fu___udivsi3_22275_43872),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___udivsi3_22275_44393 (.out1(out_ui_lshift_expr_FU_8_0_8_88_i3_fu___udivsi3_22275_44393),
    .in1(out_ui_bit_and_expr_FU_8_0_8_67_i0_fu___udivsi3_22275_28318),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu___udivsi3_22275_44446 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu___udivsi3_22275_44446),
    .in1(in_port_v),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu___udivsi3_22275_44468 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___udivsi3_22275_44468),
    .in1(in_port_v),
    .in2(out_const_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu___udivsi3_22275_44521 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___udivsi3_22275_44521),
    .in1(in_port_v),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu___udivsi3_22275_44540 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___udivsi3_22275_44540),
    .in1(in_port_v),
    .in2(out_const_16));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu___udivsi3_22275_44567 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___udivsi3_22275_44567),
    .in1(in_port_v),
    .in2(out_const_32));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu___udivsi3_22275_44583 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___udivsi3_22275_44583),
    .in1(in_port_v),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(1),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___udivsi3_22275_44591 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i5_fu___udivsi3_22275_44591),
    .in1(out_ui_rshift_expr_FU_8_0_8_111_i0_fu___udivsi3_22275_43985),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(1),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___udivsi3_22275_44594 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i6_fu___udivsi3_22275_44594),
    .in1(out_ui_rshift_expr_FU_8_0_8_111_i1_fu___udivsi3_22275_43988),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(7),
    .PRECISION(64)) fu___udivsi3_22275_44598 (.out1(out_ui_lshift_expr_FU_8_0_8_88_i4_fu___udivsi3_22275_44598),
    .in1(out_ui_cond_expr_FU_8_8_8_8_75_i0_fu___udivsi3_22275_43948),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu___udivsi3_22275_44625 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___udivsi3_22275_44625),
    .in1(in_port_v),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu___udivsi3_22275_44638 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___udivsi3_22275_44638),
    .in1(in_port_v),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44654 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___udivsi3_22275_44654),
    .in1(in_port_v),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44662 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___udivsi3_22275_44662),
    .in1(in_port_v),
    .in2(out_const_19));
  ui_rshift_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(1),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___udivsi3_22275_44666 (.out1(out_ui_rshift_expr_FU_8_0_8_111_i7_fu___udivsi3_22275_44666),
    .in1(out_ui_rshift_expr_FU_16_0_16_97_i0_fu___udivsi3_22275_43862),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(7),
    .PRECISION(64)) fu___udivsi3_22275_44670 (.out1(out_ui_lshift_expr_FU_8_0_8_88_i5_fu___udivsi3_22275_44670),
    .in1(out_ui_bit_and_expr_FU_8_0_8_66_i0_fu___udivsi3_22275_28291),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44683 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___udivsi3_22275_44683),
    .in1(in_port_v),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_22275_44687 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___udivsi3_22275_44687),
    .in1(in_port_v),
    .in2(out_const_15));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu___udivsi3_22275_44692 (.out1(out_ui_rshift_expr_FU_32_0_32_108_i0_fu___udivsi3_22275_44692),
    .in1(out_ui_cond_expr_FU_32_32_32_32_74_i2_fu___udivsi3_22275_43968),
    .in2(out_const_12));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___udivsi3_22275_44696 (.out1(out_ui_rshift_expr_FU_8_0_8_112_i0_fu___udivsi3_22275_44696),
    .in1(out_ui_rshift_expr_FU_32_0_32_100_i0_fu___udivsi3_22275_28272),
    .in2(out_const_12));
  ui_lshift_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___udivsi3_22275_44700 (.out1(out_ui_lshift_expr_FU_32_0_32_83_i0_fu___udivsi3_22275_44700),
    .in1(out_ui_cond_expr_FU_32_32_32_32_74_i3_fu___udivsi3_22275_43976),
    .in2(out_const_12));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44705 (.out1(out_lut_expr_FU_19_i0_fu___udivsi3_22275_44705),
    .in1(out_const_11),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___udivsi3_22275_44216),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___udivsi3_22275_44220),
    .in4(out_ui_extract_bit_expr_FU_17_i0_fu___udivsi3_22275_44224),
    .in5(out_ui_extract_bit_expr_FU_18_i0_fu___udivsi3_22275_44228),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44711 (.out1(out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_22275_44200),
    .in4(out_ui_extract_bit_expr_FU_12_i0_fu___udivsi3_22275_44204),
    .in5(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_22275_44208),
    .in6(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_22275_44212),
    .in7(out_lut_expr_FU_19_i0_fu___udivsi3_22275_44705),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44715 (.out1(out_lut_expr_FU_24_i0_fu___udivsi3_22275_44715),
    .in1(out_const_37),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(out_ui_eq_expr_FU_32_0_32_77_i0_fu___udivsi3_22275_28278),
    .in5(out_ui_eq_expr_FU_16_0_16_76_i1_fu___udivsi3_22275_28290),
    .in6(out_ui_eq_expr_FU_32_0_32_77_i1_fu___udivsi3_22275_28306),
    .in7(out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44721 (.out1(out_lut_expr_FU_40_i0_fu___udivsi3_22275_44721),
    .in1(out_const_40),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(out_ui_extract_bit_expr_FU_27_i0_fu___udivsi3_22275_44521),
    .in5(out_ui_extract_bit_expr_FU_28_i0_fu___udivsi3_22275_44625),
    .in6(out_ui_extract_bit_expr_FU_29_i0_fu___udivsi3_22275_44683),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44724 (.out1(out_lut_expr_FU_41_i0_fu___udivsi3_22275_44724),
    .in1(out_const_40),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(out_ui_extract_bit_expr_FU_30_i0_fu___udivsi3_22275_44446),
    .in5(out_ui_extract_bit_expr_FU_31_i0_fu___udivsi3_22275_44567),
    .in6(out_ui_extract_bit_expr_FU_32_i0_fu___udivsi3_22275_44654),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44728 (.out1(out_lut_expr_FU_42_i0_fu___udivsi3_22275_44728),
    .in1(out_const_22),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_22275_44212),
    .in3(out_ui_extract_bit_expr_FU_18_i0_fu___udivsi3_22275_44228),
    .in4(out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711),
    .in5(out_lut_expr_FU_25_i0_fu___udivsi3_22275_43978),
    .in6(out_lut_expr_FU_40_i0_fu___udivsi3_22275_44721),
    .in7(out_lut_expr_FU_41_i0_fu___udivsi3_22275_44724),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44731 (.out1(out_lut_expr_FU_43_i0_fu___udivsi3_22275_44731),
    .in1(out_const_40),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(out_ui_extract_bit_expr_FU_33_i0_fu___udivsi3_22275_44540),
    .in5(out_ui_extract_bit_expr_FU_34_i0_fu___udivsi3_22275_44638),
    .in6(out_ui_extract_bit_expr_FU_35_i0_fu___udivsi3_22275_44687),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44734 (.out1(out_lut_expr_FU_44_i0_fu___udivsi3_22275_44734),
    .in1(out_const_40),
    .in2(out_ui_eq_expr_FU_16_0_16_76_i2_fu___udivsi3_22275_43821),
    .in3(out_ui_eq_expr_FU_32_0_32_77_i3_fu___udivsi3_22275_43823),
    .in4(out_ui_extract_bit_expr_FU_36_i0_fu___udivsi3_22275_44468),
    .in5(out_ui_extract_bit_expr_FU_37_i0_fu___udivsi3_22275_44583),
    .in6(out_ui_extract_bit_expr_FU_38_i0_fu___udivsi3_22275_44662),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___udivsi3_22275_44737 (.out1(out_lut_expr_FU_45_i0_fu___udivsi3_22275_44737),
    .in1(out_const_22),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___udivsi3_22275_44204),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___udivsi3_22275_44220),
    .in4(out_lut_expr_FU_21_i0_fu___udivsi3_22275_44711),
    .in5(out_lut_expr_FU_25_i0_fu___udivsi3_22275_43978),
    .in6(out_lut_expr_FU_43_i0_fu___udivsi3_22275_44731),
    .in7(out_lut_expr_FU_44_i0_fu___udivsi3_22275_44734),
    .in8(1'b0),
    .in9(1'b0));
  register_STD #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_51_i0_fu___udivsi3_22275_28366),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_negate_expr_FU_32_32_92_i0_fu___udivsi3_22275_28371),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_56_i0_fu___udivsi3_22275_28380),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_57_i0_fu___udivsi3_22275_28381),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_58_i0_fu___udivsi3_22275_28384),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_59_i0_fu___udivsi3_22275_28387),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_60_i0_fu___udivsi3_22275_28390),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(28),
    .BITSIZE_out1(28)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___udivsi3_22275_43905),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_1_0_1_64_i0_fu___udivsi3_22275_43917),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_91_i5_fu___udivsi3_22275_28391),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_minus_expr_FU_32_32_32_90_i0_fu___udivsi3_22275_28392),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_8_i0_fu___udivsi3_22275_28386),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_96_i0_fu___udivsi3_22275_43812),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_7_i0_fu___udivsi3_22275_43982),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_32_32_109_i0_fu___udivsi3_22275_28370),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_53_i0_fu___udivsi3_22275_28373),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___udivsi3_22275_28374),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_55_i0_fu___udivsi3_22275_28377),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_95_i0_fu___udivsi3_22275_28378),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_MUX_27_gimple_return_FU_62_i0_0_0_0;
  assign OUT_CONDITION___udivsi3_22275_28393 = out_read_cond_FU_61_i0_fu___udivsi3_22275_28393;

endmodule

// FSM based controller description for __udivsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___udivsi3(done_port,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  selector_MUX_27_gimple_return_FU_62_i0_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___udivsi3_22275_28393,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___udivsi3_22275_28393;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  output selector_MUX_27_gimple_return_FU_62_i0_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [13:0] S_0 = 14'b00000000000001,
    S_1 = 14'b00000000000010,
    S_2 = 14'b00000000000100,
    S_3 = 14'b00000000001000,
    S_4 = 14'b00000000010000,
    S_5 = 14'b00000000100000,
    S_6 = 14'b00000001000000,
    S_7 = 14'b00000010000000,
    S_8 = 14'b00000100000000,
    S_9 = 14'b00001000000000,
    S_10 = 14'b00010000000000,
    S_11 = 14'b00100000000000,
    S_13 = 14'b10000000000000,
    S_12 = 14'b01000000000000;
  reg [13:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  reg selector_MUX_27_gimple_return_FU_62_i0_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b0;
    selector_MUX_27_gimple_return_FU_62_i0_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_7 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          wrenable_reg_8 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          wrenable_reg_10 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          wrenable_reg_11 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_12 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          wrenable_reg_13 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          wrenable_reg_17 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_18 = 1'b1;
          if (OUT_CONDITION___udivsi3_22275_28393 == 1'b1)
            begin
              _next_state = S_12;
              done_port = 1'b1;
            end
          else
            begin
              _next_state = S_13;
              done_port = 1'b1;
              wrenable_reg_18 = 1'b0;
            end
        end
      S_13 :
        begin
          selector_MUX_27_gimple_return_FU_62_i0_0_0_0 = 1'b1;
          _next_state = S_0;
        end
      S_12 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock or negedge reset)
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for __udivsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __udivsi3(clock,
  reset,
  start_port,
  done_port,
  u,
  v,
  return_port);
  parameter MEM_var_27659_22275=1024;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] u;
  input [31:0] v;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire OUT_CONDITION___udivsi3_22275_28393;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  wire [31:0] in_port_u_SIGI1;
  wire [31:0] in_port_u_SIGI2;
  wire [31:0] in_port_v_SIGI1;
  wire [31:0] in_port_v_SIGI2;
  wire selector_MUX_27_gimple_return_FU_62_i0_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___udivsi3 Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .selector_MUX_27_gimple_return_FU_62_i0_0_0_0(selector_MUX_27_gimple_return_FU_62_i0_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION___udivsi3_22275_28393(OUT_CONDITION___udivsi3_22275_28393),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___udivsi3 #(.MEM_var_27659_22275(MEM_var_27659_22275)) Datapath_i (.return_port(return_port),
    .OUT_CONDITION___udivsi3_22275_28393(OUT_CONDITION___udivsi3_22275_28393),
    .clock(clock),
    .reset(reset),
    .in_port_u(in_port_u_SIGI2),
    .in_port_v(in_port_v_SIGI2),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .selector_MUX_27_gimple_return_FU_62_i0_0_0_0(selector_MUX_27_gimple_return_FU_62_i0_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port_u_REG (.out1(in_port_u_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_u_SIGI1));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port_v_REG (.out1(in_port_v_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_v_SIGI1));
  // io-signal post fix
  assign in_port_u_SIGI1 = u;
  assign in_port_v_SIGI1 = v;
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Datapath RTL description for _Z11max_poolingPKdPdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z11max_poolingPKdPdjjj(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_size,
  in_port_stride,
  in_port_lateral_stride,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_27_i0_LOAD,
  fuselector_BMEMORY_CTRLN_27_i0_STORE,
  selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994,
  selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009,
  selector_MUX_10___udivsi3_49_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0,
  selector_MUX_30_reg_0_0_0_0,
  selector_MUX_32_reg_10_0_0_0,
  selector_MUX_36_reg_14_0_0_0,
  selector_MUX_39_reg_17_0_0_0,
  selector_MUX_41_reg_2_0_0_0,
  selector_MUX_41_reg_2_0_0_1,
  selector_MUX_45_reg_6_0_0_0,
  selector_MUX_48_reg_9_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109,
  OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994,
  OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009);
  parameter MEM_var_27659_22275=1024;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_size;
  input [31:0] in_port_stride;
  input [31:0] in_port_lateral_stride;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_27_i0_STORE;
  input selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  input selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  input selector_MUX_10___udivsi3_49_i0_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0;
  input selector_MUX_30_reg_0_0_0_0;
  input selector_MUX_32_reg_10_0_0_0;
  input selector_MUX_36_reg_14_0_0_0;
  input selector_MUX_39_reg_17_0_0_0;
  input selector_MUX_41_reg_2_0_0_0;
  input selector_MUX_41_reg_2_0_0_1;
  input selector_MUX_45_reg_6_0_0_0;
  input selector_MUX_48_reg_9_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964;
  output OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099;
  output OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103;
  output OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105;
  output OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107;
  output OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109;
  output OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  output OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_27_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_27_i0_BMEMORY_CTRLN_27_i0;
  wire [31:0] out_MUX_10___udivsi3_49_i0_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0;
  wire [31:0] out_MUX_30_reg_0_0_0_0;
  wire [63:0] out_MUX_32_reg_10_0_0_0;
  wire [31:0] out_MUX_36_reg_14_0_0_0;
  wire [63:0] out_MUX_39_reg_17_0_0_0;
  wire [31:0] out_MUX_41_reg_2_0_0_0;
  wire [31:0] out_MUX_41_reg_2_0_0_1;
  wire [31:0] out_MUX_45_reg_6_0_0_0;
  wire [31:0] out_MUX_48_reg_9_0_0_0;
  wire [31:0] out___udivsi3_49_i0___udivsi3_49_i0;
  wire out_const_0;
  wire [7:0] out_const_1;
  wire [62:0] out_const_10;
  wire [63:0] out_const_11;
  wire [6:0] out_const_2;
  wire out_const_3;
  wire [1:0] out_const_4;
  wire [29:0] out_const_5;
  wire [26:0] out_const_6;
  wire [5:0] out_const_7;
  wire [10:0] out_const_8;
  wire [51:0] out_const_9;
  wire [28:0] out_conv_in_port_lateral_stride_32_29;
  wire [28:0] out_conv_out___udivsi3_49_i0___udivsi3_49_i0_32_29;
  wire [28:0] out_conv_out_const_0_1_29;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [6:0] out_conv_out_const_1_8_7;
  wire [28:0] out_conv_out_reg_2_reg_2_32_29;
  wire [31:0] out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_29_32;
  wire [31:0] out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_29_32;
  wire out_lut_expr_FU_20_i0_fu__Z11max_poolingPKdPdjjj_35625_44843;
  wire out_lut_expr_FU_21_i0_fu__Z11max_poolingPKdPdjjj_35625_44846;
  wire out_read_cond_FU_22_i0_fu__Z11max_poolingPKdPdjjj_35625_37103;
  wire out_read_cond_FU_23_i0_fu__Z11max_poolingPKdPdjjj_35625_37105;
  wire out_read_cond_FU_25_i0_fu__Z11max_poolingPKdPdjjj_35625_37107;
  wire out_read_cond_FU_26_i0_fu__Z11max_poolingPKdPdjjj_35625_37109;
  wire out_read_cond_FU_2_i0_fu__Z11max_poolingPKdPdjjj_35625_36964;
  wire out_read_cond_FU_8_i0_fu__Z11max_poolingPKdPdjjj_35625_37099;
  wire [31:0] out_reg_0_reg_0;
  wire [63:0] out_reg_10_reg_10;
  wire [28:0] out_reg_11_reg_11;
  wire [28:0] out_reg_12_reg_12;
  wire [28:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [28:0] out_reg_15_reg_15;
  wire [28:0] out_reg_16_reg_16;
  wire [63:0] out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [28:0] out_reg_3_reg_3;
  wire [28:0] out_reg_4_reg_4;
  wire [28:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [63:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_28_i0_fu__Z11max_poolingPKdPdjjj_35625_44798;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_29_i0_fu__Z11max_poolingPKdPdjjj_35625_44781;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_30_i0_fu__Z11max_poolingPKdPdjjj_35625_44787;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_30_i1_fu__Z11max_poolingPKdPdjjj_35625_44804;
  wire [63:0] out_ui_bit_and_expr_FU_64_0_64_31_i0_fu__Z11max_poolingPKdPdjjj_35625_44813;
  wire [63:0] out_ui_bit_and_expr_FU_64_0_64_31_i1_fu__Z11max_poolingPKdPdjjj_35625_44819;
  wire [63:0] out_ui_bit_and_expr_FU_64_0_64_31_i2_fu__Z11max_poolingPKdPdjjj_35625_44822;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_32_i0_fu__Z11max_poolingPKdPdjjj_35625_44831;
  wire [62:0] out_ui_bit_ior_expr_FU_64_64_64_33_i0_fu__Z11max_poolingPKdPdjjj_35625_44828;
  wire [63:0] out_ui_bit_xor_expr_FU_64_64_64_34_i0_fu__Z11max_poolingPKdPdjjj_35625_44810;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_35_i0_fu__Z11max_poolingPKdPdjjj_35625_43684;
  wire out_ui_eq_expr_FU_0_16_16_36_i0_fu__Z11max_poolingPKdPdjjj_35625_44801;
  wire out_ui_eq_expr_FU_16_0_16_37_i0_fu__Z11max_poolingPKdPdjjj_35625_44784;
  wire out_ui_eq_expr_FU_32_0_32_38_i0_fu__Z11max_poolingPKdPdjjj_35625_43378;
  wire out_ui_eq_expr_FU_32_0_32_38_i1_fu__Z11max_poolingPKdPdjjj_35625_43380;
  wire out_ui_extract_bit_expr_FU_18_i0_fu__Z11max_poolingPKdPdjjj_35625_44837;
  wire out_ui_extract_bit_expr_FU_19_i0_fu__Z11max_poolingPKdPdjjj_35625_44840;
  wire out_ui_le_expr_FU_32_32_32_39_i0_fu__Z11max_poolingPKdPdjjj_35625_43384;
  wire out_ui_le_expr_FU_32_32_32_39_i1_fu__Z11max_poolingPKdPdjjj_35625_43386;
  wire out_ui_le_expr_FU_32_32_32_39_i2_fu__Z11max_poolingPKdPdjjj_35625_43388;
  wire out_ui_le_expr_FU_32_32_32_39_i3_fu__Z11max_poolingPKdPdjjj_35625_43390;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_40_i0_fu__Z11max_poolingPKdPdjjj_35625_36987;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_40_i1_fu__Z11max_poolingPKdPdjjj_35625_37030;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_40_i2_fu__Z11max_poolingPKdPdjjj_35625_37052;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_40_i3_fu__Z11max_poolingPKdPdjjj_35625_37075;
  wire out_ui_lt_expr_FU_64_64_64_41_i0_fu__Z11max_poolingPKdPdjjj_35625_44825;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_42_i0_fu__Z11max_poolingPKdPdjjj_35625_37004;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_42_i1_fu__Z11max_poolingPKdPdjjj_35625_37036;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_42_i2_fu__Z11max_poolingPKdPdjjj_35625_37058;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_42_i3_fu__Z11max_poolingPKdPdjjj_35625_37091;
  wire out_ui_ne_expr_FU_64_0_64_43_i0_fu__Z11max_poolingPKdPdjjj_35625_44790;
  wire out_ui_ne_expr_FU_64_0_64_43_i1_fu__Z11max_poolingPKdPdjjj_35625_44807;
  wire out_ui_ne_expr_FU_64_0_64_44_i0_fu__Z11max_poolingPKdPdjjj_35625_44816;
  wire out_ui_ne_expr_FU_64_0_64_44_i1_fu__Z11max_poolingPKdPdjjj_35625_44834;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_45_i0_fu__Z11max_poolingPKdPdjjj_35625_37065;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_45_i1_fu__Z11max_poolingPKdPdjjj_35625_37083;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i0_fu__Z11max_poolingPKdPdjjj_35625_36990;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_46_i1_fu__Z11max_poolingPKdPdjjj_35625_37001;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_46_i2_fu__Z11max_poolingPKdPdjjj_35625_37015;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i3_fu__Z11max_poolingPKdPdjjj_35625_37033;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i4_fu__Z11max_poolingPKdPdjjj_35625_37055;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i5_fu__Z11max_poolingPKdPdjjj_35625_37061;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i6_fu__Z11max_poolingPKdPdjjj_35625_37078;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i7_fu__Z11max_poolingPKdPdjjj_35625_37088;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_46_i8_fu__Z11max_poolingPKdPdjjj_35625_37094;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_47_i0_fu__Z11max_poolingPKdPdjjj_35625_36982;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_47_i1_fu__Z11max_poolingPKdPdjjj_35625_37025;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_47_i2_fu__Z11max_poolingPKdPdjjj_35625_37049;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_47_i3_fu__Z11max_poolingPKdPdjjj_35625_37072;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_48_i0_fu__Z11max_poolingPKdPdjjj_35625_44776;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_48_i1_fu__Z11max_poolingPKdPdjjj_35625_44793;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [28:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [28:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [63:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire s___udivsi3_49_i00;
  wire s_done___udivsi3_49_i0;
  
  BMEMORY_CTRLN #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(32),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(32),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_27_i0 (.out1({null_out_signal_BMEMORY_CTRLN_27_i0_out1_1,
      out_BMEMORY_CTRLN_27_i0_BMEMORY_CTRLN_27_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0}),
    .in3({7'b0000000,
      out_conv_out_const_1_8_7}),
    .in4({1'b0,
      out_const_3}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_27_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_27_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_10___udivsi3_49_i0_0_0_0 (.out1(out_MUX_10___udivsi3_49_i0_0_0_0),
    .sel(selector_MUX_10___udivsi3_49_i0_0_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_47_i0_fu__Z11max_poolingPKdPdjjj_35625_36982),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_47_i1_fu__Z11max_poolingPKdPdjjj_35625_37025));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_27_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_47_i2_fu__Z11max_poolingPKdPdjjj_35625_37049),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_47_i3_fu__Z11max_poolingPKdPdjjj_35625_37072));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_27_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_30_reg_0_0_0_0 (.out1(out_MUX_30_reg_0_0_0_0),
    .sel(selector_MUX_30_reg_0_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_32_reg_10_0_0_0 (.out1(out_MUX_32_reg_10_0_0_0),
    .sel(selector_MUX_32_reg_10_0_0_0),
    .in1(out_BMEMORY_CTRLN_27_i0_BMEMORY_CTRLN_27_i0),
    .in2(out_ui_cond_expr_FU_64_64_64_64_35_i0_fu__Z11max_poolingPKdPdjjj_35625_43684));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_36_reg_14_0_0_0 (.out1(out_MUX_36_reg_14_0_0_0),
    .sel(selector_MUX_36_reg_14_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_45_i1_fu__Z11max_poolingPKdPdjjj_35625_37083),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_39_reg_17_0_0_0 (.out1(out_MUX_39_reg_17_0_0_0),
    .sel(selector_MUX_39_reg_17_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_BMEMORY_CTRLN_27_i0_BMEMORY_CTRLN_27_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_41_reg_2_0_0_0 (.out1(out_MUX_41_reg_2_0_0_0),
    .sel(selector_MUX_41_reg_2_0_0_0),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i2_fu__Z11max_poolingPKdPdjjj_35625_37015),
    .in2(out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_29_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_41_reg_2_0_0_1 (.out1(out_MUX_41_reg_2_0_0_1),
    .sel(selector_MUX_41_reg_2_0_0_1),
    .in1(out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_29_32),
    .in2(out_MUX_41_reg_2_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_45_reg_6_0_0_0 (.out1(out_MUX_45_reg_6_0_0_0),
    .sel(selector_MUX_45_reg_6_0_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_48_reg_9_0_0_0 (.out1(out_MUX_48_reg_9_0_0_0),
    .sel(selector_MUX_48_reg_9_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_45_i0_fu__Z11max_poolingPKdPdjjj_35625_37065),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_29));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_reg_2_reg_2_32_29));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_reg_17_reg_17));
  __udivsi3 #(.MEM_var_27659_22275(MEM_var_27659_22275)) __udivsi3_49_i0 (.done_port(s_done___udivsi3_49_i0),
    .return_port(out___udivsi3_49_i0___udivsi3_49_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___udivsi3_49_i00),
    .u(out_MUX_10___udivsi3_49_i0_0_0_0),
    .v(in_port_stride));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b111010001000100001100000000000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(27),
    .value(27'b111011101110000000000000000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_in_port_lateral_stride_32_29 (.out1(out_conv_in_port_lateral_stride_32_29),
    .in1(in_port_lateral_stride));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_out___udivsi3_49_i0___udivsi3_49_i0_32_29 (.out1(out_conv_out___udivsi3_49_i0___udivsi3_49_i0_32_29),
    .in1(out___udivsi3_49_i0___udivsi3_49_i0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(29)) conv_out_const_0_1_29 (.out1(out_conv_out_const_0_1_29),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_1_8_7 (.out1(out_conv_out_const_1_8_7),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_out_reg_2_reg_2_32_29 (.out1(out_conv_out_reg_2_reg_2_32_29),
    .in1(out_reg_2_reg_2));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(32)) conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_29_32 (.out1(out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_29_32),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(32)) conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_29_32 (.out1(out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_29_32),
    .in1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11max_poolingPKdPdjjj_35625_36964 (.out1(out_read_cond_FU_2_i0_fu__Z11max_poolingPKdPdjjj_35625_36964),
    .in1(out_ui_eq_expr_FU_32_0_32_38_i0_fu__Z11max_poolingPKdPdjjj_35625_43378));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_36982 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_47_i0_fu__Z11max_poolingPKdPdjjj_35625_36982),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_40_i0_fu__Z11max_poolingPKdPdjjj_35625_36987));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11max_poolingPKdPdjjj_35625_36987 (.out1(out_ui_lshift_expr_FU_32_0_32_40_i0_fu__Z11max_poolingPKdPdjjj_35625_36987),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i0_fu__Z11max_poolingPKdPdjjj_35625_36990),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_36990 (.out1(out_ui_plus_expr_FU_32_32_32_46_i0_fu__Z11max_poolingPKdPdjjj_35625_36990),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_5_reg_5));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11max_poolingPKdPdjjj_35625_37001 (.out1(out_ui_plus_expr_FU_32_32_32_46_i1_fu__Z11max_poolingPKdPdjjj_35625_37001),
    .in1(in_port_stride),
    .in2(out_reg_6_reg_6));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37004 (.out1(out_ui_mult_expr_FU_32_32_32_0_42_i0_fu__Z11max_poolingPKdPdjjj_35625_37004),
    .clock(clock),
    .in1(out_conv_in_port_lateral_stride_32_29),
    .in2(out_reg_3_reg_3));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11max_poolingPKdPdjjj_35625_37015 (.out1(out_ui_plus_expr_FU_32_32_32_46_i2_fu__Z11max_poolingPKdPdjjj_35625_37015),
    .in1(in_port_stride),
    .in2(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37025 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_47_i1_fu__Z11max_poolingPKdPdjjj_35625_37025),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_40_i1_fu__Z11max_poolingPKdPdjjj_35625_37030));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11max_poolingPKdPdjjj_35625_37030 (.out1(out_ui_lshift_expr_FU_32_0_32_40_i1_fu__Z11max_poolingPKdPdjjj_35625_37030),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i3_fu__Z11max_poolingPKdPdjjj_35625_37033),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_37033 (.out1(out_ui_plus_expr_FU_32_32_32_46_i3_fu__Z11max_poolingPKdPdjjj_35625_37033),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_6_reg_6));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37036 (.out1(out_ui_mult_expr_FU_32_32_32_0_42_i1_fu__Z11max_poolingPKdPdjjj_35625_37036),
    .clock(clock),
    .in1(in_port_size),
    .in2(out_conv_out_reg_2_reg_2_32_29));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37049 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_47_i2_fu__Z11max_poolingPKdPdjjj_35625_37049),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_40_i2_fu__Z11max_poolingPKdPdjjj_35625_37052));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11max_poolingPKdPdjjj_35625_37052 (.out1(out_ui_lshift_expr_FU_32_0_32_40_i2_fu__Z11max_poolingPKdPdjjj_35625_37052),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i4_fu__Z11max_poolingPKdPdjjj_35625_37055),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_37055 (.out1(out_ui_plus_expr_FU_32_32_32_46_i4_fu__Z11max_poolingPKdPdjjj_35625_37055),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_16_reg_16));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37058 (.out1(out_ui_mult_expr_FU_32_32_32_0_42_i2_fu__Z11max_poolingPKdPdjjj_35625_37058),
    .clock(clock),
    .in1(in_port_size),
    .in2(out_reg_15_reg_15));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_37061 (.out1(out_ui_plus_expr_FU_32_32_32_46_i5_fu__Z11max_poolingPKdPdjjj_35625_37061),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_0_reg_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z11max_poolingPKdPdjjj_35625_37065 (.out1(out_ui_plus_expr_FU_32_0_32_45_i0_fu__Z11max_poolingPKdPdjjj_35625_37065),
    .in1(out_reg_9_reg_9),
    .in2(out_const_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37072 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_47_i3_fu__Z11max_poolingPKdPdjjj_35625_37072),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_40_i3_fu__Z11max_poolingPKdPdjjj_35625_37075));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11max_poolingPKdPdjjj_35625_37075 (.out1(out_ui_lshift_expr_FU_32_0_32_40_i3_fu__Z11max_poolingPKdPdjjj_35625_37075),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i6_fu__Z11max_poolingPKdPdjjj_35625_37078),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_37078 (.out1(out_ui_plus_expr_FU_32_32_32_46_i6_fu__Z11max_poolingPKdPdjjj_35625_37078),
    .in1(out_reg_14_reg_14),
    .in2(out_reg_13_reg_13));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z11max_poolingPKdPdjjj_35625_37083 (.out1(out_ui_plus_expr_FU_32_0_32_45_i1_fu__Z11max_poolingPKdPdjjj_35625_37083),
    .in1(out_reg_14_reg_14),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_37088 (.out1(out_ui_plus_expr_FU_32_32_32_46_i7_fu__Z11max_poolingPKdPdjjj_35625_37088),
    .in1(out_reg_12_reg_12),
    .in2(out_reg_6_reg_6));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z11max_poolingPKdPdjjj_35625_37091 (.out1(out_ui_mult_expr_FU_32_32_32_0_42_i3_fu__Z11max_poolingPKdPdjjj_35625_37091),
    .clock(clock),
    .in1(out_reg_11_reg_11),
    .in2(in_port_size));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z11max_poolingPKdPdjjj_35625_37094 (.out1(out_ui_plus_expr_FU_32_32_32_46_i8_fu__Z11max_poolingPKdPdjjj_35625_37094),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_9_reg_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11max_poolingPKdPdjjj_35625_37099 (.out1(out_read_cond_FU_8_i0_fu__Z11max_poolingPKdPdjjj_35625_37099),
    .in1(out_reg_1_reg_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11max_poolingPKdPdjjj_35625_37103 (.out1(out_read_cond_FU_22_i0_fu__Z11max_poolingPKdPdjjj_35625_37103),
    .in1(out_ui_le_expr_FU_32_32_32_39_i0_fu__Z11max_poolingPKdPdjjj_35625_43384));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11max_poolingPKdPdjjj_35625_37105 (.out1(out_read_cond_FU_23_i0_fu__Z11max_poolingPKdPdjjj_35625_37105),
    .in1(out_ui_le_expr_FU_32_32_32_39_i1_fu__Z11max_poolingPKdPdjjj_35625_43386));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11max_poolingPKdPdjjj_35625_37107 (.out1(out_read_cond_FU_25_i0_fu__Z11max_poolingPKdPdjjj_35625_37107),
    .in1(out_reg_18_reg_18));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11max_poolingPKdPdjjj_35625_37109 (.out1(out_read_cond_FU_26_i0_fu__Z11max_poolingPKdPdjjj_35625_37109),
    .in1(out_ui_le_expr_FU_32_32_32_39_i3_fu__Z11max_poolingPKdPdjjj_35625_43390));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_43378 (.out1(out_ui_eq_expr_FU_32_0_32_38_i0_fu__Z11max_poolingPKdPdjjj_35625_43378),
    .in1(in_port_size),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_43380 (.out1(out_ui_eq_expr_FU_32_0_32_38_i1_fu__Z11max_poolingPKdPdjjj_35625_43380),
    .in1(in_port_stride),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_43384 (.out1(out_ui_le_expr_FU_32_32_32_39_i0_fu__Z11max_poolingPKdPdjjj_35625_43384),
    .in1(in_port_stride),
    .in2(out_ui_plus_expr_FU_32_0_32_45_i1_fu__Z11max_poolingPKdPdjjj_35625_37083));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_43386 (.out1(out_ui_le_expr_FU_32_32_32_39_i1_fu__Z11max_poolingPKdPdjjj_35625_43386),
    .in1(in_port_stride),
    .in2(out_reg_9_reg_9));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_43388 (.out1(out_ui_le_expr_FU_32_32_32_39_i2_fu__Z11max_poolingPKdPdjjj_35625_43388),
    .in1(in_port_size),
    .in2(out_reg_7_reg_7));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_43390 (.out1(out_ui_le_expr_FU_32_32_32_39_i3_fu__Z11max_poolingPKdPdjjj_35625_43390),
    .in1(in_port_size),
    .in2(out_reg_2_reg_2));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu__Z11max_poolingPKdPdjjj_35625_43684 (.out1(out_ui_cond_expr_FU_64_64_64_64_35_i0_fu__Z11max_poolingPKdPdjjj_35625_43684),
    .in1(out_lut_expr_FU_21_i0_fu__Z11max_poolingPKdPdjjj_35625_44846),
    .in2(out_reg_10_reg_10),
    .in3(out_reg_8_reg_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu__Z11max_poolingPKdPdjjj_35625_44776 (.out1(out_ui_rshift_expr_FU_64_0_64_48_i0_fu__Z11max_poolingPKdPdjjj_35625_44776),
    .in1(out_reg_8_reg_8),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu__Z11max_poolingPKdPdjjj_35625_44781 (.out1(out_ui_bit_and_expr_FU_16_0_16_29_i0_fu__Z11max_poolingPKdPdjjj_35625_44781),
    .in1(out_ui_rshift_expr_FU_64_0_64_48_i0_fu__Z11max_poolingPKdPdjjj_35625_44776),
    .in2(out_const_8));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44784 (.out1(out_ui_eq_expr_FU_16_0_16_37_i0_fu__Z11max_poolingPKdPdjjj_35625_44784),
    .in1(out_ui_bit_and_expr_FU_16_0_16_29_i0_fu__Z11max_poolingPKdPdjjj_35625_44781),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu__Z11max_poolingPKdPdjjj_35625_44787 (.out1(out_ui_bit_and_expr_FU_64_0_64_30_i0_fu__Z11max_poolingPKdPdjjj_35625_44787),
    .in1(out_reg_8_reg_8),
    .in2(out_const_9));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44790 (.out1(out_ui_ne_expr_FU_64_0_64_43_i0_fu__Z11max_poolingPKdPdjjj_35625_44790),
    .in1(out_ui_bit_and_expr_FU_64_0_64_30_i0_fu__Z11max_poolingPKdPdjjj_35625_44787),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu__Z11max_poolingPKdPdjjj_35625_44793 (.out1(out_ui_rshift_expr_FU_64_0_64_48_i1_fu__Z11max_poolingPKdPdjjj_35625_44793),
    .in1(out_reg_10_reg_10),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu__Z11max_poolingPKdPdjjj_35625_44798 (.out1(out_ui_bit_and_expr_FU_0_16_16_28_i0_fu__Z11max_poolingPKdPdjjj_35625_44798),
    .in1(out_const_8),
    .in2(out_ui_rshift_expr_FU_64_0_64_48_i1_fu__Z11max_poolingPKdPdjjj_35625_44793));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44801 (.out1(out_ui_eq_expr_FU_0_16_16_36_i0_fu__Z11max_poolingPKdPdjjj_35625_44801),
    .in1(out_const_8),
    .in2(out_ui_bit_and_expr_FU_0_16_16_28_i0_fu__Z11max_poolingPKdPdjjj_35625_44798));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu__Z11max_poolingPKdPdjjj_35625_44804 (.out1(out_ui_bit_and_expr_FU_64_0_64_30_i1_fu__Z11max_poolingPKdPdjjj_35625_44804),
    .in1(out_reg_10_reg_10),
    .in2(out_const_9));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44807 (.out1(out_ui_ne_expr_FU_64_0_64_43_i1_fu__Z11max_poolingPKdPdjjj_35625_44807),
    .in1(out_ui_bit_and_expr_FU_64_0_64_30_i1_fu__Z11max_poolingPKdPdjjj_35625_44804),
    .in2(out_const_0));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu__Z11max_poolingPKdPdjjj_35625_44810 (.out1(out_ui_bit_xor_expr_FU_64_64_64_34_i0_fu__Z11max_poolingPKdPdjjj_35625_44810),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_10_reg_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu__Z11max_poolingPKdPdjjj_35625_44813 (.out1(out_ui_bit_and_expr_FU_64_0_64_31_i0_fu__Z11max_poolingPKdPdjjj_35625_44813),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_34_i0_fu__Z11max_poolingPKdPdjjj_35625_44810),
    .in2(out_const_11));
  ui_ne_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44816 (.out1(out_ui_ne_expr_FU_64_0_64_44_i0_fu__Z11max_poolingPKdPdjjj_35625_44816),
    .in1(out_ui_bit_and_expr_FU_64_0_64_31_i0_fu__Z11max_poolingPKdPdjjj_35625_44813),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu__Z11max_poolingPKdPdjjj_35625_44819 (.out1(out_ui_bit_and_expr_FU_64_0_64_31_i1_fu__Z11max_poolingPKdPdjjj_35625_44819),
    .in1(out_reg_8_reg_8),
    .in2(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu__Z11max_poolingPKdPdjjj_35625_44822 (.out1(out_ui_bit_and_expr_FU_64_0_64_31_i2_fu__Z11max_poolingPKdPdjjj_35625_44822),
    .in1(out_reg_10_reg_10),
    .in2(out_const_11));
  ui_lt_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44825 (.out1(out_ui_lt_expr_FU_64_64_64_41_i0_fu__Z11max_poolingPKdPdjjj_35625_44825),
    .in1(out_ui_bit_and_expr_FU_64_0_64_31_i1_fu__Z11max_poolingPKdPdjjj_35625_44819),
    .in2(out_ui_bit_and_expr_FU_64_0_64_31_i2_fu__Z11max_poolingPKdPdjjj_35625_44822));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu__Z11max_poolingPKdPdjjj_35625_44828 (.out1(out_ui_bit_ior_expr_FU_64_64_64_33_i0_fu__Z11max_poolingPKdPdjjj_35625_44828),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_10_reg_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu__Z11max_poolingPKdPdjjj_35625_44831 (.out1(out_ui_bit_and_expr_FU_64_0_64_32_i0_fu__Z11max_poolingPKdPdjjj_35625_44831),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_33_i0_fu__Z11max_poolingPKdPdjjj_35625_44828),
    .in2(out_const_10));
  ui_ne_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44834 (.out1(out_ui_ne_expr_FU_64_0_64_44_i1_fu__Z11max_poolingPKdPdjjj_35625_44834),
    .in1(out_ui_bit_and_expr_FU_64_0_64_32_i0_fu__Z11max_poolingPKdPdjjj_35625_44831),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu__Z11max_poolingPKdPdjjj_35625_44837 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu__Z11max_poolingPKdPdjjj_35625_44837),
    .in1(out_reg_8_reg_8),
    .in2(out_const_7));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu__Z11max_poolingPKdPdjjj_35625_44840 (.out1(out_ui_extract_bit_expr_FU_19_i0_fu__Z11max_poolingPKdPdjjj_35625_44840),
    .in1(out_reg_10_reg_10),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44843 (.out1(out_lut_expr_FU_20_i0_fu__Z11max_poolingPKdPdjjj_35625_44843),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_18_i0_fu__Z11max_poolingPKdPdjjj_35625_44837),
    .in3(out_ui_extract_bit_expr_FU_19_i0_fu__Z11max_poolingPKdPdjjj_35625_44840),
    .in4(out_ui_lt_expr_FU_64_64_64_41_i0_fu__Z11max_poolingPKdPdjjj_35625_44825),
    .in5(out_ui_ne_expr_FU_64_0_64_44_i0_fu__Z11max_poolingPKdPdjjj_35625_44816),
    .in6(out_ui_ne_expr_FU_64_0_64_44_i1_fu__Z11max_poolingPKdPdjjj_35625_44834),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu__Z11max_poolingPKdPdjjj_35625_44846 (.out1(out_lut_expr_FU_21_i0_fu__Z11max_poolingPKdPdjjj_35625_44846),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_0_16_16_36_i0_fu__Z11max_poolingPKdPdjjj_35625_44801),
    .in3(out_ui_ne_expr_FU_64_0_64_43_i1_fu__Z11max_poolingPKdPdjjj_35625_44807),
    .in4(out_ui_eq_expr_FU_16_0_16_37_i0_fu__Z11max_poolingPKdPdjjj_35625_44784),
    .in5(out_ui_ne_expr_FU_64_0_64_43_i0_fu__Z11max_poolingPKdPdjjj_35625_44790),
    .in6(out_lut_expr_FU_20_i0_fu__Z11max_poolingPKdPdjjj_35625_44843),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  or or_or___udivsi3_49_i00( s___udivsi3_49_i00, selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994, selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009);
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_30_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_32_0_32_38_i1_fu__Z11max_poolingPKdPdjjj_35625_43380),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_32_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i8_fu__Z11max_poolingPKdPdjjj_35625_37094),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_42_i3_fu__Z11max_poolingPKdPdjjj_35625_37091),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i7_fu__Z11max_poolingPKdPdjjj_35625_37088),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_36_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i5_fu__Z11max_poolingPKdPdjjj_35625_37061),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_42_i2_fu__Z11max_poolingPKdPdjjj_35625_37058),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_39_reg_17_0_0_0),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_39_i2_fu__Z11max_poolingPKdPdjjj_35625_43388),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_41_reg_2_0_0_1),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___udivsi3_49_i0___udivsi3_49_i0_32_29),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_42_i1_fu__Z11max_poolingPKdPdjjj_35625_37036),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_42_i0_fu__Z11max_poolingPKdPdjjj_35625_37004),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_45_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_46_i1_fu__Z11max_poolingPKdPdjjj_35625_37001),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_27_i0_BMEMORY_CTRLN_27_i0),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_48_reg_9_0_0_0),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964 = out_read_cond_FU_2_i0_fu__Z11max_poolingPKdPdjjj_35625_36964;
  assign OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099 = out_read_cond_FU_8_i0_fu__Z11max_poolingPKdPdjjj_35625_37099;
  assign OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103 = out_read_cond_FU_22_i0_fu__Z11max_poolingPKdPdjjj_35625_37103;
  assign OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105 = out_read_cond_FU_23_i0_fu__Z11max_poolingPKdPdjjj_35625_37105;
  assign OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107 = out_read_cond_FU_25_i0_fu__Z11max_poolingPKdPdjjj_35625_37107;
  assign OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109 = out_read_cond_FU_26_i0_fu__Z11max_poolingPKdPdjjj_35625_37109;
  assign OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994 = s_done___udivsi3_49_i0;
  assign OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009 = s_done___udivsi3_49_i0;

endmodule

// FSM based controller description for _Z11max_poolingPKdPdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z11max_poolingPKdPdjjj(done_port,
  fuselector_BMEMORY_CTRLN_27_i0_LOAD,
  fuselector_BMEMORY_CTRLN_27_i0_STORE,
  selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994,
  selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009,
  selector_MUX_10___udivsi3_49_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0,
  selector_MUX_30_reg_0_0_0_0,
  selector_MUX_32_reg_10_0_0_0,
  selector_MUX_36_reg_14_0_0_0,
  selector_MUX_39_reg_17_0_0_0,
  selector_MUX_41_reg_2_0_0_0,
  selector_MUX_41_reg_2_0_0_1,
  selector_MUX_45_reg_6_0_0_0,
  selector_MUX_48_reg_9_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107,
  OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109,
  OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994,
  OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964;
  input OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099;
  input OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103;
  input OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105;
  input OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107;
  input OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109;
  input OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  input OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_27_i0_STORE;
  output selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  output selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  output selector_MUX_10___udivsi3_49_i0_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0;
  output selector_MUX_30_reg_0_0_0_0;
  output selector_MUX_32_reg_10_0_0_0;
  output selector_MUX_36_reg_14_0_0_0;
  output selector_MUX_39_reg_17_0_0_0;
  output selector_MUX_41_reg_2_0_0_0;
  output selector_MUX_41_reg_2_0_0_1;
  output selector_MUX_45_reg_6_0_0_0;
  output selector_MUX_48_reg_9_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [21:0] S_0 = 22'b0000000000000000000001,
    S_20 = 22'b0100000000000000000000,
    S_1 = 22'b0000000000000000000010,
    S_2 = 22'b0000000000000000000100,
    S_3 = 22'b0000000000000000001000,
    S_4 = 22'b0000000000000000010000,
    S_5 = 22'b0000000000000000100000,
    S_6 = 22'b0000000000000001000000,
    S_7 = 22'b0000000000000010000000,
    S_8 = 22'b0000000000000100000000,
    S_9 = 22'b0000000000001000000000,
    S_10 = 22'b0000000000010000000000,
    S_11 = 22'b0000000000100000000000,
    S_12 = 22'b0000000001000000000000,
    S_13 = 22'b0000000010000000000000,
    S_14 = 22'b0000000100000000000000,
    S_15 = 22'b0000001000000000000000,
    S_16 = 22'b0000010000000000000000,
    S_17 = 22'b0000100000000000000000,
    S_18 = 22'b0001000000000000000000,
    S_19 = 22'b0010000000000000000000,
    S_21 = 22'b1000000000000000000000;
  reg [21:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_27_i0_STORE;
  reg selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  reg selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  reg selector_MUX_10___udivsi3_49_i0_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0;
  reg selector_MUX_30_reg_0_0_0_0;
  reg selector_MUX_32_reg_10_0_0_0;
  reg selector_MUX_36_reg_14_0_0_0;
  reg selector_MUX_39_reg_17_0_0_0;
  reg selector_MUX_41_reg_2_0_0_0;
  reg selector_MUX_41_reg_2_0_0_1;
  reg selector_MUX_45_reg_6_0_0_0;
  reg selector_MUX_48_reg_9_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_27_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_27_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994 = 1'b0;
    selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009 = 1'b0;
    selector_MUX_10___udivsi3_49_i0_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0 = 1'b0;
    selector_MUX_30_reg_0_0_0_0 = 1'b0;
    selector_MUX_32_reg_10_0_0_0 = 1'b0;
    selector_MUX_36_reg_14_0_0_0 = 1'b0;
    selector_MUX_39_reg_17_0_0_0 = 1'b0;
    selector_MUX_41_reg_2_0_0_0 = 1'b0;
    selector_MUX_41_reg_2_0_0_1 = 1'b0;
    selector_MUX_45_reg_6_0_0_0 = 1'b0;
    selector_MUX_48_reg_9_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_20;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_20 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009 = 1'b1;
          selector_MUX_41_reg_2_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
          wrenable_reg_4 = 1'b1;
          if (OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_2 :
        begin
          wrenable_reg_3 = OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
          if (OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_3 :
        begin
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_27_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          selector_MUX_32_reg_10_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099 == 1'b1)
            begin
              _next_state = S_16;
              selector_MUX_32_reg_10_0_0_0 = 1'b0;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_8 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_17 = 1'b0;
            end
        end
      S_6 :
        begin
          selector_MUX_48_reg_9_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_12 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          selector_MUX_36_reg_14_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_14 = 1'b1;
          if (OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103 == 1'b1)
            begin
              _next_state = S_12;
              selector_MUX_36_reg_14_0_0_0 = 1'b0;
              wrenable_reg_14 = 1'b0;
            end
          else
            begin
              _next_state = S_10;
            end
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_27_i0_LOAD = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_8 = 1'b1;
          _next_state = S_9;
        end
      S_12 :
        begin
          selector_MUX_39_reg_17_0_0_0 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_17 = 1'b1;
          if (OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105 == 1'b1)
            begin
              _next_state = S_16;
              wrenable_reg_15 = 1'b0;
            end
          else
            begin
              _next_state = S_13;
              selector_MUX_39_reg_17_0_0_0 = 1'b0;
              wrenable_reg_17 = 1'b0;
            end
        end
      S_13 :
        begin
          wrenable_reg_16 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_27_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_8 = 1'b1;
          _next_state = S_6;
        end
      S_16 :
        begin
          selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994 = 1'b1;
          selector_MUX_10___udivsi3_49_i0_0_0_0 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_3 = OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
          if (OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994 == 1'b0)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_18;
            end
        end
      S_17 :
        begin
          selector_MUX_10___udivsi3_49_i0_0_0_0 = 1'b1;
          wrenable_reg_3 = OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
          if (OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994 == 1'b0)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_18;
            end
        end
      S_18 :
        begin
          fuselector_BMEMORY_CTRLN_27_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0 = 1'b1;
          selector_MUX_45_reg_6_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107 == 1'b1)
            begin
              _next_state = S_19;
              selector_MUX_45_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
            end
        end
      S_19 :
        begin
          selector_MUX_30_reg_0_0_0_0 = 1'b1;
          selector_MUX_41_reg_2_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_21;
              done_port = 1'b1;
              selector_MUX_30_reg_0_0_0_0 = 1'b0;
              selector_MUX_41_reg_2_0_0_1 = 1'b0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
        end
      S_21 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for _Z11max_poolingPKdPdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z11max_poolingPKdPdjjj(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  size,
  stride,
  lateral_stride,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [31:0] B;
  input [31:0] size;
  input [31:0] stride;
  input [31:0] lateral_stride;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964;
  wire OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099;
  wire OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103;
  wire OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105;
  wire OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107;
  wire OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109;
  wire OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  wire OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_27_i0_STORE;
  wire selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994;
  wire selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009;
  wire selector_MUX_10___udivsi3_49_i0_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0;
  wire selector_MUX_30_reg_0_0_0_0;
  wire selector_MUX_32_reg_10_0_0_0;
  wire selector_MUX_36_reg_14_0_0_0;
  wire selector_MUX_39_reg_17_0_0_0;
  wire selector_MUX_41_reg_2_0_0_0;
  wire selector_MUX_41_reg_2_0_0_1;
  wire selector_MUX_45_reg_6_0_0_0;
  wire selector_MUX_48_reg_9_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z11max_poolingPKdPdjjj Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_27_i0_LOAD(fuselector_BMEMORY_CTRLN_27_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_27_i0_STORE(fuselector_BMEMORY_CTRLN_27_i0_STORE),
    .selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994(selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994),
    .selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009(selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009),
    .selector_MUX_10___udivsi3_49_i0_0_0_0(selector_MUX_10___udivsi3_49_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0),
    .selector_MUX_30_reg_0_0_0_0(selector_MUX_30_reg_0_0_0_0),
    .selector_MUX_32_reg_10_0_0_0(selector_MUX_32_reg_10_0_0_0),
    .selector_MUX_36_reg_14_0_0_0(selector_MUX_36_reg_14_0_0_0),
    .selector_MUX_39_reg_17_0_0_0(selector_MUX_39_reg_17_0_0_0),
    .selector_MUX_41_reg_2_0_0_0(selector_MUX_41_reg_2_0_0_0),
    .selector_MUX_41_reg_2_0_0_1(selector_MUX_41_reg_2_0_0_1),
    .selector_MUX_45_reg_6_0_0_0(selector_MUX_45_reg_6_0_0_0),
    .selector_MUX_48_reg_9_0_0_0(selector_MUX_48_reg_9_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109),
    .OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994(OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994),
    .OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009(OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z11max_poolingPKdPdjjj #(.MEM_var_27659_22275(1024)) Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_36964),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37099),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37103),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37105),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37107),
    .OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109(OUT_CONDITION__Z11max_poolingPKdPdjjj_35625_37109),
    .OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994(OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994),
    .OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009(OUT_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_size(size),
    .in_port_stride(stride),
    .in_port_lateral_stride(lateral_stride),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_27_i0_LOAD(fuselector_BMEMORY_CTRLN_27_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_27_i0_STORE(fuselector_BMEMORY_CTRLN_27_i0_STORE),
    .selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994(selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_36994),
    .selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009(selector_IN_UNBOUNDED__Z11max_poolingPKdPdjjj_35625_37009),
    .selector_MUX_10___udivsi3_49_i0_0_0_0(selector_MUX_10___udivsi3_49_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_1_0),
    .selector_MUX_30_reg_0_0_0_0(selector_MUX_30_reg_0_0_0_0),
    .selector_MUX_32_reg_10_0_0_0(selector_MUX_32_reg_10_0_0_0),
    .selector_MUX_36_reg_14_0_0_0(selector_MUX_36_reg_14_0_0_0),
    .selector_MUX_39_reg_17_0_0_0(selector_MUX_39_reg_17_0_0_0),
    .selector_MUX_41_reg_2_0_0_0(selector_MUX_41_reg_2_0_0_0),
    .selector_MUX_41_reg_2_0_0_1(selector_MUX_41_reg_2_0_0_1),
    .selector_MUX_45_reg_6_0_0_0(selector_MUX_45_reg_6_0_0_0),
    .selector_MUX_48_reg_9_0_0_0(selector_MUX_48_reg_9_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: _Z11max_poolingPKdPdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z11max_poolingPKdPdjjj(clock,
  reset,
  start_port,
  A,
  B,
  size,
  stride,
  lateral_stride,
  M_Rdata_ram,
  M_DataRdy,
  done_port,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [31:0] B;
  input [31:0] size;
  input [31:0] stride;
  input [31:0] lateral_stride;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  
  __Z11max_poolingPKdPdjjj __Z11max_poolingPKdPdjjj_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .A(A),
    .B(B),
    .size(size),
    .stride(stride),
    .lateral_stride(lateral_stride),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));

endmodule


