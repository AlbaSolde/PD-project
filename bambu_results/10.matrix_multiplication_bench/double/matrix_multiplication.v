// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-16T21:20:21
// Bambu executed with: bambu --top-fname=matrix_multiplication -DDOUBLE cpu_functions.cpp 
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
module bit_and_expr_FU(in1,
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
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
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
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
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
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
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
module ui_bit_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = ~in1;
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
module ui_gt_expr_FU(in1,
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
  assign out1 = in1 > in2;
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
module ui_ternary_pm_expr_FU(in1,
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
  assign out1 = in1 + in2 - in3;
endmodule

// Datapath RTL description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_adde11m52b_1023nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port,
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
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_8,
  wrenable_reg_9);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
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
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_39;
  input wrenable_reg_4;
  input wrenable_reg_40;
  input wrenable_reg_41;
  input wrenable_reg_42;
  input wrenable_reg_43;
  input wrenable_reg_44;
  input wrenable_reg_45;
  input wrenable_reg_46;
  input wrenable_reg_47;
  input wrenable_reg_48;
  input wrenable_reg_49;
  input wrenable_reg_5;
  input wrenable_reg_50;
  input wrenable_reg_51;
  input wrenable_reg_52;
  input wrenable_reg_53;
  input wrenable_reg_54;
  input wrenable_reg_55;
  input wrenable_reg_56;
  input wrenable_reg_57;
  input wrenable_reg_58;
  input wrenable_reg_59;
  input wrenable_reg_6;
  input wrenable_reg_60;
  input wrenable_reg_61;
  input wrenable_reg_62;
  input wrenable_reg_63;
  input wrenable_reg_64;
  input wrenable_reg_65;
  input wrenable_reg_66;
  input wrenable_reg_67;
  input wrenable_reg_68;
  input wrenable_reg_69;
  input wrenable_reg_7;
  input wrenable_reg_70;
  input wrenable_reg_71;
  input wrenable_reg_72;
  input wrenable_reg_73;
  input wrenable_reg_74;
  input wrenable_reg_75;
  input wrenable_reg_76;
  input wrenable_reg_77;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [5:0] out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_44286_47570;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_44286_47568;
  wire [0:0] out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_44286_45021;
  wire [0:0] out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_44286_45042;
  wire [0:0] out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_44286_45062;
  wire [0:0] out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_44286_45082;
  wire [0:0] out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_44286_45105;
  wire [55:0] out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_44286_44445;
  wire [5:0] out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_44286_44726;
  wire [63:0] out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_44286_44377;
  wire signed [1:0] out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_44286_44717;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_44286_46501;
  wire signed [1:0] out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_44286_46511;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_44286_44368;
  wire signed [1:0] out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_44286_46520;
  wire signed [1:0] out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_44286_46529;
  wire signed [1:0] out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_44286_46538;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_44286_44436;
  wire out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_44286_46547;
  wire out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_44286_44536;
  wire out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_44286_45320;
  wire out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_44286_44550;
  wire out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_44286_47566;
  wire out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_44286_47560;
  wire [5:0] out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_44286_44729;
  wire [5:0] out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44286_44738;
  wire out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_44286_44843;
  wire signed [6:0] out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_44286_44964;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [6:0] out_const_11;
  wire [6:0] out_const_12;
  wire [6:0] out_const_13;
  wire [5:0] out_const_14;
  wire [5:0] out_const_15;
  wire [6:0] out_const_16;
  wire out_const_17;
  wire [1:0] out_const_18;
  wire [2:0] out_const_19;
  wire [2:0] out_const_2;
  wire [3:0] out_const_20;
  wire [4:0] out_const_21;
  wire [5:0] out_const_22;
  wire [16:0] out_const_23;
  wire [51:0] out_const_24;
  wire [24:0] out_const_25;
  wire [56:0] out_const_26;
  wire [5:0] out_const_27;
  wire [4:0] out_const_28;
  wire [5:0] out_const_29;
  wire [3:0] out_const_3;
  wire [6:0] out_const_30;
  wire [5:0] out_const_31;
  wire [3:0] out_const_32;
  wire [4:0] out_const_33;
  wire [5:0] out_const_34;
  wire [7:0] out_const_35;
  wire [5:0] out_const_36;
  wire [4:0] out_const_37;
  wire [5:0] out_const_38;
  wire [5:0] out_const_39;
  wire [4:0] out_const_4;
  wire [2:0] out_const_40;
  wire [3:0] out_const_41;
  wire [4:0] out_const_42;
  wire [5:0] out_const_43;
  wire [4:0] out_const_44;
  wire [5:0] out_const_45;
  wire [63:0] out_const_46;
  wire [3:0] out_const_47;
  wire [4:0] out_const_48;
  wire [5:0] out_const_49;
  wire [5:0] out_const_5;
  wire [5:0] out_const_50;
  wire [4:0] out_const_51;
  wire [5:0] out_const_52;
  wire [7:0] out_const_53;
  wire [5:0] out_const_54;
  wire [1:0] out_const_55;
  wire [2:0] out_const_56;
  wire [3:0] out_const_57;
  wire [5:0] out_const_58;
  wire [6:0] out_const_59;
  wire [6:0] out_const_6;
  wire [5:0] out_const_60;
  wire [4:0] out_const_61;
  wire [5:0] out_const_62;
  wire [5:0] out_const_63;
  wire [62:0] out_const_64;
  wire [3:0] out_const_65;
  wire [5:0] out_const_66;
  wire [5:0] out_const_67;
  wire [4:0] out_const_68;
  wire [5:0] out_const_69;
  wire [3:0] out_const_7;
  wire [5:0] out_const_70;
  wire [2:0] out_const_71;
  wire [3:0] out_const_72;
  wire [4:0] out_const_73;
  wire [6:0] out_const_74;
  wire [7:0] out_const_75;
  wire [30:0] out_const_76;
  wire [4:0] out_const_77;
  wire [15:0] out_const_78;
  wire [3:0] out_const_79;
  wire [6:0] out_const_8;
  wire [4:0] out_const_80;
  wire [63:0] out_const_81;
  wire [8:0] out_const_82;
  wire [63:0] out_const_83;
  wire [4:0] out_const_84;
  wire [5:0] out_const_85;
  wire [63:0] out_const_86;
  wire [15:0] out_const_87;
  wire [10:0] out_const_88;
  wire [10:0] out_const_89;
  wire [2:0] out_const_9;
  wire [15:0] out_const_90;
  wire [31:0] out_const_91;
  wire [31:0] out_const_92;
  wire [31:0] out_const_93;
  wire [51:0] out_const_94;
  wire [54:0] out_const_95;
  wire [55:0] out_const_96;
  wire [62:0] out_const_97;
  wire [63:0] out_const_98;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_44286_44720;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_44286_46505;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_44286_46514;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_44286_46523;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_44286_46532;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_44286_46541;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_44286_44371;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_44286_44439;
  wire out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44286_50177;
  wire out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_44286_50180;
  wire out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44286_50183;
  wire out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44286_45713;
  wire out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44286_50189;
  wire out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44286_50193;
  wire out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_44286_45195;
  wire out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44286_50198;
  wire out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_44286_50201;
  wire out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_44286_50204;
  wire out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44286_50207;
  wire out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_44286_50210;
  wire out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_44286_50213;
  wire out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_44286_50216;
  wire out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_44286_50219;
  wire out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_44286_47716;
  wire out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44286_50225;
  wire out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44286_50229;
  wire out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_44286_46380;
  wire out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_44286_50233;
  wire out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_44286_46402;
  wire out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44286_46461;
  wire out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_44286_47801;
  wire out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_44286_46477;
  wire out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44286_46575;
  wire out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_44286_47790;
  wire out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_44286_47797;
  wire out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_44286_44714;
  wire out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_44286_44802;
  wire out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44286_50124;
  wire out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44286_50127;
  wire out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44286_50130;
  wire out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44286_50133;
  wire out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_44286_50137;
  wire out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44286_50140;
  wire out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_44286_50143;
  wire out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44286_50146;
  wire out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_44286_50149;
  wire out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651;
  wire out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_44286_50154;
  wire out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44286_50157;
  wire out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_44286_50160;
  wire out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44286_50163;
  wire out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_44286_50167;
  wire out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655;
  wire out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_44286_44433;
  wire out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44286_45659;
  wire out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_44286_50173;
  wire [10:0] out_reg_0_reg_0;
  wire [52:0] out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire out_reg_12_reg_12;
  wire [10:0] out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire [55:0] out_reg_18_reg_18;
  wire [63:0] out_reg_19_reg_19;
  wire [55:0] out_reg_1_reg_1;
  wire out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire out_reg_25_reg_25;
  wire out_reg_26_reg_26;
  wire out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire out_reg_29_reg_29;
  wire out_reg_2_reg_2;
  wire out_reg_30_reg_30;
  wire out_reg_31_reg_31;
  wire out_reg_32_reg_32;
  wire out_reg_33_reg_33;
  wire out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire out_reg_37_reg_37;
  wire out_reg_38_reg_38;
  wire out_reg_39_reg_39;
  wire out_reg_3_reg_3;
  wire out_reg_40_reg_40;
  wire out_reg_41_reg_41;
  wire out_reg_42_reg_42;
  wire out_reg_43_reg_43;
  wire out_reg_44_reg_44;
  wire out_reg_45_reg_45;
  wire out_reg_46_reg_46;
  wire out_reg_47_reg_47;
  wire out_reg_48_reg_48;
  wire out_reg_49_reg_49;
  wire [54:0] out_reg_4_reg_4;
  wire out_reg_50_reg_50;
  wire out_reg_51_reg_51;
  wire out_reg_52_reg_52;
  wire out_reg_53_reg_53;
  wire out_reg_54_reg_54;
  wire out_reg_55_reg_55;
  wire out_reg_56_reg_56;
  wire out_reg_57_reg_57;
  wire out_reg_58_reg_58;
  wire out_reg_59_reg_59;
  wire [6:0] out_reg_5_reg_5;
  wire out_reg_60_reg_60;
  wire out_reg_61_reg_61;
  wire out_reg_62_reg_62;
  wire out_reg_63_reg_63;
  wire out_reg_64_reg_64;
  wire out_reg_65_reg_65;
  wire out_reg_66_reg_66;
  wire out_reg_67_reg_67;
  wire out_reg_68_reg_68;
  wire out_reg_69_reg_69;
  wire out_reg_6_reg_6;
  wire out_reg_70_reg_70;
  wire out_reg_71_reg_71;
  wire [51:0] out_reg_72_reg_72;
  wire out_reg_73_reg_73;
  wire [63:0] out_reg_74_reg_74;
  wire out_reg_75_reg_75;
  wire [10:0] out_reg_76_reg_76;
  wire out_reg_77_reg_77;
  wire out_reg_7_reg_7;
  wire [51:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_44286_44723;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_44286_46508;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_44286_46517;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_44286_46526;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_44286_46535;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_44286_46544;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_44286_44374;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_44286_44442;
  wire [54:0] out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_44286_44818;
  wire [55:0] out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44286_44851;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44286_44465;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_44286_45268;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44286_45350;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_44286_44886;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_44286_44862;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_44286_44349;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_44286_44356;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44286_44402;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44286_44459;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_44286_45281;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44286_45355;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44286_44837;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44286_44383;
  wire [52:0] out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_44286_44789;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_44286_44566;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_44286_44735;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_44286_46195;
  wire [55:0] out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_44286_44840;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_44286_44542;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_44286_44556;
  wire [62:0] out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_44286_45286;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_44286_45484;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_44286_45487;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_44286_45048;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_44286_45088;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_44286_45091;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_44286_45111;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44286_45114;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_44286_45456;
  wire [5:0] out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_44286_44732;
  wire [54:0] out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_44286_44786;
  wire [63:0] out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_44286_44380;
  wire [62:0] out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44286_44386;
  wire [62:0] out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44286_44391;
  wire [55:0] out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_44286_44823;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_44286_46410;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_44286_46464;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_44286_46472;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44286_46490;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_44286_46577;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_44286_47562;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_44286_46414;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_44286_47564;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44286_46428;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44286_46432;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44286_46442;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44286_46450;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44286_46456;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_44286_46474;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_44286_46483;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44286_46492;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_44286_46579;
  wire out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44286_45332;
  wire out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44286_45337;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647;
  wire out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_44286_45683;
  wire out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_44286_45643;
  wire out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_44286_44799;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_44286_48044;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_44286_48048;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_44286_48052;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_44286_48056;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_44286_48060;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_44286_49407;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_44286_49060;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_44286_49064;
  wire out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_44286_48741;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_44286_49411;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_44286_49072;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_44286_49076;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_44286_48757;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_44286_49415;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_44286_49084;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_44286_49088;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_44286_48773;
  wire out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_44286_49419;
  wire out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_44286_49096;
  wire out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_44286_49100;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_44286_48789;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_44286_49423;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_44286_49108;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_44286_49112;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_44286_48805;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_44286_49427;
  wire out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_44286_49120;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_44286_49124;
  wire out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_44286_48821;
  wire out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_44286_49431;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_44286_49132;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_44286_49136;
  wire out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_44286_48837;
  wire out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_44286_49435;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_44286_49144;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_44286_49148;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_44286_48853;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44286_48033;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_44286_49708;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_44286_49712;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_44286_49450;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_44286_49720;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_44286_49724;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_44286_49477;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_44286_49732;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_44286_49736;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_44286_49504;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_44286_49744;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44286_48037;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_44286_49748;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_44286_49532;
  wire out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901;
  wire out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_44286_50108;
  wire out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_44286_50112;
  wire out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_44286_50064;
  wire out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_44286_50092;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_44286_50096;
  wire out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_44286_49994;
  wire out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44286_45120;
  wire [54:0] out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_44286_44783;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_44286_44539;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_44286_44553;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_44286_45265;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_44286_45481;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_44286_44545;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44286_44559;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_44286_44874;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_44286_44898;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_44286_44924;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_44286_44952;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_44286_44980;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_44286_44987;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_44286_45453;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_44286_46171;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_44286_46191;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_44286_48965;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_44286_46550;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_44286_47580;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_44286_46561;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_44286_49314;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_44286_45024;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_44286_45045;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_44286_45065;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_44286_45085;
  wire [5:0] out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_44286_45108;
  wire out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_44286_44363;
  wire [10:0] out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503;
  wire out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_44286_44489;
  wire out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_44286_44497;
  wire out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_44286_44473;
  wire out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_44286_44478;
  wire out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_44286_44794;
  wire [55:0] out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846;
  wire [62:0] out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44286_45323;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_44286_46188;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_44286_44405;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_44286_44462;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_44286_45347;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_44286_44859;
  wire [15:0] out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_44286_44883;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_44286_45278;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_44286_46163;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44286_46174;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_44286_46167;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_44286_46182;
  wire [53:0] out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_44286_46185;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_44286_48958;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_44286_48961;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_44286_46553;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_44286_46557;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_44286_49307;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_44286_49310;
  wire [54:0] out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_44286_44741;
  wire [1:0] out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44286_44967;
  wire [10:0] out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_44286_45271;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110011)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1000000000000000000000000000000000000000000000000000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000000010000000111110001)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(57),
    .value(57'b100000001000000011111000100000000000000000000000000000000)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100001)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100010)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1000101)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100011)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10010)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100100)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10010000)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100101)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100110)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1010)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101011)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1010110010101100101011001010110011111111000011111111000000000000)) const_46 (.out1(out_const_46));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1011)) const_47 (.out1(out_const_47));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_48 (.out1(out_const_48));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101100)) const_49 (.out1(out_const_49));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101101)) const_50 (.out1(out_const_50));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_51 (.out1(out_const_51));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101110)) const_52 (.out1(out_const_52));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10111010)) const_53 (.out1(out_const_53));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101111)) const_54 (.out1(out_const_54));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_55 (.out1(out_const_55));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_56 (.out1(out_const_56));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_57 (.out1(out_const_57));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110000)) const_58 (.out1(out_const_58));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1100000)) const_59 (.out1(out_const_59));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110001)) const_60 (.out1(out_const_60));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_61 (.out1(out_const_61));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110010)) const_62 (.out1(out_const_62));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_63 (.out1(out_const_63));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b110011000100100011001100010010000000000000000000110011000100100)) const_64 (.out1(out_const_64));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_65 (.out1(out_const_65));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_66 (.out1(out_const_66));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_67 (.out1(out_const_67));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_68 (.out1(out_const_68));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110110)) const_69 (.out1(out_const_69));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110111)) const_70 (.out1(out_const_70));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_71 (.out1(out_const_71));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_72 (.out1(out_const_72));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_73 (.out1(out_const_73));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1110000)) const_74 (.out1(out_const_74));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_75 (.out1(out_const_75));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1110011010100010110001001000000)) const_76 (.out1(out_const_76));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_77 (.out1(out_const_77));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1110101011000000)) const_78 (.out1(out_const_78));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_79 (.out1(out_const_79));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0101000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_80 (.out1(out_const_80));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111001111000000111100101100000011110011110000001111001010000000)) const_81 (.out1(out_const_81));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b111101111)) const_82 (.out1(out_const_82));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111011110110011110101011001000111100110101000101100010010000000)) const_83 (.out1(out_const_83));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_84 (.out1(out_const_84));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_85 (.out1(out_const_85));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111110011111100111110100000101000001100000011001111101000001010)) const_86 (.out1(out_const_86));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111000010000)) const_87 (.out1(out_const_87));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111110)) const_88 (.out1(out_const_88));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_89 (.out1(out_const_89));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_9 (.out1(out_const_9));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_90 (.out1(out_const_90));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111110110000000000000)) const_91 (.out1(out_const_91));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111110)) const_92 (.out1(out_const_92));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_93 (.out1(out_const_93));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_94 (.out1(out_const_94));
  constant_value #(.BITSIZE_out1(55),
    .value(55'b1111111111111111111111111111111111111111111111111111111)) const_95 (.out1(out_const_95));
  constant_value #(.BITSIZE_out1(56),
    .value(56'b11111111111111111111111111111111111111111111111111111111)) const_96 (.out1(out_const_96));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_97 (.out1(out_const_97));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_98 (.out1(out_const_98));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44286_44349 (.out1(out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_44286_44349),
    .in1(in_port_a),
    .in2(out_const_97));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44286_44356 (.out1(out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_44286_44356),
    .in1(in_port_b),
    .in2(out_const_97));
  ui_lt_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44363 (.out1(out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_44286_44363),
    .in1(out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_44286_44349),
    .in2(out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_44286_44356));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_44368 (.out1(out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_44286_44368),
    .in1(out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_44286_44363));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44371 (.out1(out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_44286_44371),
    .in1(out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_44286_44368),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44374 (.out1(out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_44286_44374),
    .in1(out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_44286_44371),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_44377 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_44286_44377),
    .in1(out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_44286_44374));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_44380 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_44286_44380),
    .in1(in_port_a),
    .in2(in_port_b));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_44383 (.out1(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44286_44383),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_44286_44380),
    .in2(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_44286_44377));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44286_44386 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44286_44386),
    .in1(in_port_a),
    .in2(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44286_44383));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44286_44391 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44286_44391),
    .in1(in_port_b),
    .in2(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44286_44383));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_44402 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44286_44402),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44286_44386),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44405 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_44286_44405),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44286_44386),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_44414 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_44286_44405),
    .in2(out_const_89));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44433 (.out1(out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_44286_44433),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44286_48037),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_44436 (.out1(out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_44286_44436),
    .in1(out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_44286_44433));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44439 (.out1(out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_44286_44439),
    .in1(out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_44286_44436),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44442 (.out1(out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_44286_44442),
    .in1(out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_44286_44439),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44286_44445 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_44286_44445),
    .in1(out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_44286_44442));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_44459 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44286_44459),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44286_44391),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44462 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_44286_44462),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44286_44391),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_44465 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44286_44465),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_44286_44462),
    .in2(out_const_89));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44473 (.out1(out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_44286_44473),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44286_44402),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44478 (.out1(out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_44286_44478),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44286_44459),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44489 (.out1(out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_44286_44489),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44497 (.out1(out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_44286_44497),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44286_44465),
    .in2(out_const_0));
  ui_minus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_44503 (.out1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44286_44465));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44536 (.out1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_44286_44536),
    .in1(out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_44286_44489));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44539 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_44286_44539),
    .in1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_44286_44536),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_44286_44542 (.out1(out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_44286_44542),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_44286_44539),
    .in2(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44286_44402));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44545 (.out1(out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_44286_44545),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_44286_44542),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44550 (.out1(out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_44286_44550),
    .in1(out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_44286_44497));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44553 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_44286_44553),
    .in1(out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_44286_44550),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_44286_44556 (.out1(out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_44286_44556),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44286_44459),
    .in2(out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_44286_44553));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44559 (.out1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44286_44559),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_44286_44556),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_44566 (.out1(out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_44286_44566),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in2(out_const_89));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44714 (.out1(out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_44286_44714),
    .in1(out_const_92),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_44286_48044),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_44286_48048),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_44286_48052),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_44286_48056),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_44286_48060),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_44717 (.out1(out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_44286_44717),
    .in1(out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_44286_44714));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_44720 (.out1(out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_44286_44720),
    .in1(out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_44286_44717),
    .in2(out_const_15));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_44723 (.out1(out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_44286_44723),
    .in1(out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_44286_44720),
    .in2(out_const_15));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_44726 (.out1(out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_44286_44726),
    .in1(out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_44286_44723));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_44729 (.out1(out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_44286_44729),
    .in1(out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_44286_44726));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_44732 (.out1(out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_44286_44732),
    .in1(out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_44286_44566),
    .in2(out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_44286_44729));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_44735 (.out1(out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_44286_44735),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_44286_44732),
    .in2(out_const_85));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_44738 (.out1(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44286_44738),
    .in1(out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_44286_44735));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44741 (.out1(out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_44286_44741),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44286_44559),
    .in2(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44286_44738));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44783 (.out1(out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_44286_44783),
    .in1(out_const_98),
    .in2(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44286_44738));
  ui_bit_not_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_44286_44786 (.out1(out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_44286_44786),
    .in1(out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_44286_44783));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_44286_44789 (.out1(out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_44286_44789),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_44286_46163),
    .in2(out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_44286_46167));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44794 (.out1(out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_44286_44794),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44286_46174),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44799 (.out1(out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_44286_44799),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44286_46174),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44802 (.out1(out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_44286_44802),
    .in1(out_const_59),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_17_reg_17),
    .in4(out_reg_3_reg_3),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_44286_44818 (.out1(out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_44286_44818),
    .in1(out_const_95),
    .in2(out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_44286_44741));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44286_44823 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_44286_44823),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44286_44837 (.out1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44286_44837),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_44286_44823),
    .in2(out_const_96));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(56),
    .OFFSET_PARAMETER(2)) fu___float_adde11m52b_1023nih_44286_44840 (.out1(out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_44286_44840),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_44286_46191),
    .in2(out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_44286_46195),
    .in3(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_44843 (.out1(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_44286_44843),
    .in1(out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_44286_44802));
  ui_plus_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44286_44846 (.out1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in1(out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_44286_44840),
    .in2(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_44286_44843));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44286_44851 (.out1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44286_44851),
    .in1(out_const_96),
    .in2(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44859 (.out1(out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_44286_44859),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44286_44851),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde11m52b_1023nih_44286_44862 (.out1(out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_44286_44862),
    .in1(out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_44286_44859),
    .in2(out_const_93));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44874 (.out1(out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_44286_44874),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44286_44851),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44883 (.out1(out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_44286_44883),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44286_46456),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde11m52b_1023nih_44286_44886 (.out1(out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_44286_44886),
    .in1(out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_44286_44883),
    .in2(out_const_90));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44898 (.out1(out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_44286_44898),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44286_46456),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44924 (.out1(out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_44286_44924),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44286_46450),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44952 (.out1(out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_44286_44952),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44286_46442),
    .in2(out_const_3));
  bit_and_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_44286_44964 (.out1(out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_44286_44964),
    .in1(out_const_13),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44967 (.out1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44286_44967),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44286_46432),
    .in2(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44980 (.out1(out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_44286_44980),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44286_46428),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_44987 (.out1(out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_44286_44987),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44286_46432),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45021 (.out1(out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_44286_45021),
    .in1(out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_44286_46544));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45024 (.out1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_44286_45024),
    .in1(out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_44286_45021),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45042 (.out1(out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_44286_45042),
    .in1(out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_44286_46535));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45045 (.out1(out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_44286_45045),
    .in1(out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_44286_45042),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde11m52b_1023nih_44286_45048 (.out1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_44286_45048),
    .in1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_44286_45024),
    .in2(out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_44286_45045));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45062 (.out1(out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_44286_45062),
    .in1(out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_44286_46526));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45065 (.out1(out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_44286_45065),
    .in1(out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_44286_45062),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45082 (.out1(out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_44286_45082),
    .in1(out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_44286_46517));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45085 (.out1(out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_44286_45085),
    .in1(out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_44286_45082),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde11m52b_1023nih_44286_45088 (.out1(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_44286_45088),
    .in1(out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_44286_45065),
    .in2(out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_44286_45085));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde11m52b_1023nih_44286_45091 (.out1(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_44286_45091),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_44286_45048),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_44286_45088));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45105 (.out1(out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_44286_45105),
    .in1(out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_44286_46508));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45108 (.out1(out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_44286_45108),
    .in1(out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_44286_45105),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(5),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_45111 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_44286_45111),
    .in1(out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_44286_45108),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_44286_45091));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_45114 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44286_45114),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_44286_45111),
    .in2(out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_44286_46553));
  ui_gt_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45120 (.out1(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44286_45120),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44286_45114),
    .in2(out_reg_0_reg_0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45195 (.out1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_44286_45195),
    .in1(out_const_53),
    .in2(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44286_45120),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44286_50189),
    .in4(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44286_50193),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45265 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_44286_45265),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_44286_45268),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_45268 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_44286_45268),
    .in1(out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_44286_45271),
    .in2(out_const_89));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_in3(6),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_45271 (.out1(out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_44286_45271),
    .in1(out_reg_13_reg_13),
    .in2(out_const_17),
    .in3(out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_44286_47570));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45278 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_44286_45278),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_44286_48965),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_45281 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_44286_45281),
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_44286_45278),
    .in2(out_const_94));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44286_45286 (.out1(out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_44286_45286),
    .in1(out_reg_72_reg_72),
    .in2(out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_44286_46561));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45320 (.out1(out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_44286_45320),
    .in1(out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_44286_47716));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44286_45323 (.out1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44286_45323),
    .in1(out_reg_73_reg_73),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_44286_45286));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45332 (.out1(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44286_45332),
    .in1(out_const_89),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45337 (.out1(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44286_45337),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44286_44465),
    .in2(out_const_89));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45347 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_44286_45347),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44286_45323),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_45350 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44286_45350),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_44286_45347),
    .in2(out_const_89));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_45355 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44286_45355),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44286_45323),
    .in2(out_const_94));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45453 (.out1(out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_44286_45453),
    .in1(out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_44286_47560),
    .in2(out_const_11));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_45456 (.out1(out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_44286_45456),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_44286_47564));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_45481 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_44286_45481),
    .in1(out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_44286_47562),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_45484 (.out1(out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_44286_45484),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_44286_45456),
    .in2(out_reg_74_reg_74));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_45487 (.out1(out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_44286_45487),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_44286_45481),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_44286_45484));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45643 (.out1(out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_44286_45643),
    .in1(out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_44286_44862),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45647 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in1(out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_44286_44886),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45651 (.out1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in1(out_const_23),
    .in2(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44286_50124),
    .in3(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44286_50127),
    .in4(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44286_50130),
    .in5(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44286_50133),
    .in6(out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_44286_50149),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45655 (.out1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44286_50124),
    .in3(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44286_50127),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in5(out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_44286_50154),
    .in6(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44286_50157),
    .in7(out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_44286_50167),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45659 (.out1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44286_45659),
    .in1(out_const_17),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45683 (.out1(out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_44286_45683),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414),
    .in2(out_const_88));
  lut_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_45713 (.out1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44286_45713),
    .in1(out_const_82),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44286_50177),
    .in5(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44286_50183),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46163 (.out1(out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_44286_46163),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44286_44559),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46167 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_44286_46167),
    .in1(out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_44286_44786),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46171 (.out1(out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_44286_46171),
    .in1(out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_44286_44789),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46174 (.out1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44286_46174),
    .in1(out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_44286_46171),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46182 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_44286_46182),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_44286_44545),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46185 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_44286_46185),
    .in1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44286_44837),
    .in2(out_const_18));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu___float_adde11m52b_1023nih_44286_46188 (.out1(out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_44286_46188),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_44286_46185));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46191 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_44286_46191),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_44286_46188),
    .in2(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_46195 (.out1(out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_44286_46195),
    .in1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44286_44837),
    .in2(out_const_55));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_46380 (.out1(out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_44286_46380),
    .in1(out_const_56),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_6_reg_6),
    .in5(out_reg_7_reg_7),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44286_50229),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_46402 (.out1(out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_44286_46402),
    .in1(out_const_35),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_77_reg_77),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_46410 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_44286_46410),
    .in1(out_reg_71_reg_71),
    .in2(out_const_0),
    .in3(out_reg_76_reg_76));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_46414 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_44286_46414),
    .in1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44286_45713),
    .in2(out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_44286_49307),
    .in3(out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_44286_49310));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(64),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_44286_46428 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44286_46428),
    .in1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44286_45659),
    .in2(out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_44286_44987),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44286_46432));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_46432 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44286_46432),
    .in1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in2(out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_44286_44952),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44286_46442));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_46442 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44286_46442),
    .in1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in2(out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_44286_44924),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44286_46450));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_46450 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44286_46450),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in2(out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_44286_44898),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44286_46456));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(56),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44286_46456 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44286_46456),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_19_reg_19),
    .in3(out_reg_18_reg_18));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_46461 (.out1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44286_46461),
    .in1(out_const_56),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_77_reg_77),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_46464 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_44286_46464),
    .in1(out_reg_75_reg_75),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44286_45350),
    .in3(out_const_89));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_46472 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_44286_46472),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44286_46461),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_44286_46464),
    .in3(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44286_45350));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_46474 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_44286_46474),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44286_46461),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44286_45355));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_46477 (.out1(out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_44286_46477),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44286_48033),
    .in4(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44286_45332),
    .in5(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44286_45337),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_46483 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_44286_46483),
    .in1(out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_44286_46402),
    .in2(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44286_45355),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_46490 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44286_46490),
    .in1(out_reg_14_reg_14),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_44286_46472),
    .in3(out_const_89));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_46492 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44286_46492),
    .in1(out_reg_14_reg_14),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_44286_46474),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_46501 (.out1(out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_44286_46501),
    .in1(out_reg_20_reg_20));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46505 (.out1(out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_44286_46505),
    .in1(out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_44286_46501),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46508 (.out1(out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_44286_46508),
    .in1(out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_44286_46505),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_46511 (.out1(out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_44286_46511),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46514 (.out1(out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_44286_46514),
    .in1(out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_44286_46511),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46517 (.out1(out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_44286_46517),
    .in1(out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_44286_46514),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_46520 (.out1(out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_44286_46520),
    .in1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46523 (.out1(out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_44286_46523),
    .in1(out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_44286_46520),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46526 (.out1(out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_44286_46526),
    .in1(out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_44286_46523),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_46529 (.out1(out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_44286_46529),
    .in1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46532 (.out1(out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_44286_46532),
    .in1(out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_44286_46529),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46535 (.out1(out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_44286_46535),
    .in1(out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_44286_46532),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44286_46538 (.out1(out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_44286_46538),
    .in1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44286_45659));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46541 (.out1(out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_44286_46541),
    .in1(out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_44286_46538),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44286_46544 (.out1(out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_44286_46544),
    .in1(out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_44286_46541),
    .in2(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_46547 (.out1(out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_44286_46547),
    .in1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44286_45713));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46550 (.out1(out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_44286_46550),
    .in1(out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_44286_46547),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46553 (.out1(out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_44286_46553),
    .in1(out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_44286_46550),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(6),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46557 (.out1(out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_44286_46557),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_44286_45265),
    .in2(out_const_66));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_46561 (.out1(out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_44286_46561),
    .in1(out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_44286_46410),
    .in2(out_const_66));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_46575 (.out1(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44286_46575),
    .in1(out_const_78),
    .in2(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44286_45332),
    .in3(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44286_45337),
    .in4(out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_44286_44478),
    .in5(out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_44286_44473),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_46577 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_44286_46577),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44286_45350),
    .in3(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44286_46490));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_46579 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_44286_46579),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_44286_46483),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44286_46492));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_47560 (.out1(out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_44286_47560),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_44286_47797));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_47562 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_44286_47562),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44286_46490),
    .in3(out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_44286_46577));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44286_47564 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_44286_47564),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44286_46492),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_44286_46579));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_47566 (.out1(out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_44286_47566),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_44286_47790));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44286_47568 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_44286_47568),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44286_47570 (.out1(out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_44286_47570),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44286_45114));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_47580 (.out1(out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_44286_47580),
    .in1(out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_44286_47566),
    .in2(out_const_85));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_47716 (.out1(out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_44286_47716),
    .in1(out_const_81),
    .in2(out_reg_2_reg_2),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44286_50189),
    .in4(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_44286_50204),
    .in5(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_44286_50210),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_44286_50213),
    .in7(out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_44286_50219),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_47790 (.out1(out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_44286_47790),
    .in1(out_const_64),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_17_reg_17),
    .in5(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44286_50225),
    .in6(out_reg_11_reg_11),
    .in7(out_reg_12_reg_12),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_47797 (.out1(out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_44286_47797),
    .in1(out_const_91),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44286_48037),
    .in4(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44286_45332),
    .in5(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44286_45337),
    .in6(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44286_46575),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_47801 (.out1(out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_44286_47801),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44286_48033),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44286_47897 (.out1(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44286_44967),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44286_47901 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44286_44967),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48030 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030),
    .in1(in_port_a),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48033 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44286_48033),
    .in1(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44286_44383),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48037 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44286_48037),
    .in1(in_port_b),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44286_48044 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_44286_48044),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44286_48048 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_44286_48048),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_48052 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_44286_48052),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_48056 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_44286_48056),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in2(out_const_32));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_48060 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_44286_48060),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44286_44503),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48741 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_44286_48741),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_58));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48757 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_44286_48757),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_60));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48773 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_44286_48773),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48789 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_44286_48789),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48805 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_44286_48805),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48821 (.out1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_44286_48821),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_67));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48837 (.out1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_44286_48837),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_48853 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_44286_48853),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_70));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_48958 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_44286_48958),
    .in1(out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_44286_44980),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_48961 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_44286_48961),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44286_46428),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_48965 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_44286_48965),
    .in1(out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_44286_49314),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49060 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_44286_49060),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49064 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_44286_49064),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49072 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_44286_49072),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49076 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_44286_49076),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49084 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_44286_49084),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49088 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_44286_49088),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49096 (.out1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_44286_49096),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49100 (.out1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_44286_49100),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_37));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49108 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_44286_49108),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49112 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_44286_49112),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49120 (.out1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_44286_49120),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49124 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_44286_49124),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49132 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_44286_49132),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49136 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_44286_49136),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49144 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_44286_49144),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_39));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49148 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_44286_49148),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_51));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_49307 (.out1(out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_44286_49307),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_44286_48958),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_49310 (.out1(out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_44286_49310),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_44286_48961),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44286_49314 (.out1(out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_44286_49314),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_44286_46414),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44286_49407 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_44286_49407),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44286_49411 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_44286_49411),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_44286_49415 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_44286_49415),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_44286_49419 (.out1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_44286_49419),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44286_49423 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_44286_49423),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44286_49427 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_44286_49427),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44286_49431 (.out1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_44286_49431),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44286_49435 (.out1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_44286_49435),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49450 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_44286_49450),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49477 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_44286_49477),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49504 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_44286_49504),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_52));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49532 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_44286_49532),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49708 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_44286_49708),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_49712 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_44286_49712),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49720 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_44286_49720),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_77));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_49724 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_44286_49724),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49732 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_44286_49732),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_80));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_49736 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_44286_49736),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_49744 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_44286_49744),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_84));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_49748 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_44286_49748),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_79));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_49994 (.out1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_44286_49994),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44286_50064 (.out1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_44286_50064),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_50092 (.out1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_44286_50092),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_50096 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_44286_50096),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44286_50108 (.out1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_44286_50108),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44286_50112 (.out1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_44286_50112),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44286_44846),
    .in2(out_const_32));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50124 (.out1(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44286_50124),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_49_reg_49),
    .in5(out_reg_37_reg_37),
    .in6(out_reg_38_reg_38),
    .in7(out_reg_25_reg_25),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50127 (.out1(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44286_50127),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_50_reg_50),
    .in5(out_reg_39_reg_39),
    .in6(out_reg_40_reg_40),
    .in7(out_reg_26_reg_26),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50130 (.out1(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44286_50130),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_51_reg_51),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_reg_27_reg_27),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50133 (.out1(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44286_50133),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_52_reg_52),
    .in5(out_reg_43_reg_43),
    .in6(out_reg_44_reg_44),
    .in7(out_reg_28_reg_28),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50137 (.out1(out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_44286_50137),
    .in1(out_const_46),
    .in2(out_reg_45_reg_45),
    .in3(out_reg_29_reg_29),
    .in4(out_reg_20_reg_20),
    .in5(out_reg_30_reg_30),
    .in6(out_reg_21_reg_21),
    .in7(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50140 (.out1(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44286_50140),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_46_reg_46),
    .in5(out_reg_31_reg_31),
    .in6(out_reg_32_reg_32),
    .in7(out_reg_22_reg_22),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50143 (.out1(out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_44286_50143),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_47_reg_47),
    .in5(out_reg_33_reg_33),
    .in6(out_reg_34_reg_34),
    .in7(out_reg_23_reg_23),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50146 (.out1(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44286_50146),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_48_reg_48),
    .in5(out_reg_35_reg_35),
    .in6(out_reg_36_reg_36),
    .in7(out_reg_24_reg_24),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50149 (.out1(out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_44286_50149),
    .in1(out_const_17),
    .in2(out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_44286_50137),
    .in3(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44286_50140),
    .in4(out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_44286_50143),
    .in5(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44286_50146),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50154 (.out1(out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_44286_50154),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_57_reg_57),
    .in5(out_reg_58_reg_58),
    .in6(out_reg_53_reg_53),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50157 (.out1(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44286_50157),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_59_reg_59),
    .in5(out_reg_60_reg_60),
    .in6(out_reg_54_reg_54),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50160 (.out1(out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_44286_50160),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_61_reg_61),
    .in5(out_reg_62_reg_62),
    .in6(out_reg_55_reg_55),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50163 (.out1(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44286_50163),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_63_reg_63),
    .in5(out_reg_64_reg_64),
    .in6(out_reg_56_reg_56),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50167 (.out1(out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_44286_50167),
    .in1(out_const_25),
    .in2(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44286_50130),
    .in3(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44286_50133),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in5(out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_44286_50160),
    .in6(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44286_50163),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50173 (.out1(out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_44286_50173),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_69_reg_69),
    .in5(out_reg_70_reg_70),
    .in6(out_reg_66_reg_66),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50177 (.out1(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44286_50177),
    .in1(out_const_86),
    .in2(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44286_50127),
    .in3(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44286_50140),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in5(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44286_50157),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in7(out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_44286_50173),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50180 (.out1(out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_44286_50180),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_67_reg_67),
    .in5(out_reg_68_reg_68),
    .in6(out_reg_65_reg_65),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50183 (.out1(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44286_50183),
    .in1(out_const_86),
    .in2(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44286_50133),
    .in3(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44286_50146),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in5(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44286_50163),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in7(out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_44286_50180),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50189 (.out1(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44286_50189),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44286_50177),
    .in5(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44286_50183),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50193 (.out1(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44286_50193),
    .in1(out_const_24),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in6(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in7(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50198 (.out1(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44286_50198),
    .in1(out_const_18),
    .in2(out_reg_45_reg_45),
    .in3(out_reg_20_reg_20),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50201 (.out1(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_44286_50201),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_47_reg_47),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50204 (.out1(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_44286_50204),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44286_50198),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_44286_50201),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50207 (.out1(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44286_50207),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_46_reg_46),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50210 (.out1(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_44286_50210),
    .in1(out_const_75),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44286_50207),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50213 (.out1(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_44286_50213),
    .in1(out_const_75),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44286_50198),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50216 (.out1(out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_44286_50216),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44286_45647),
    .in4(out_reg_48_reg_48),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44286_45651),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44286_45655),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50219 (.out1(out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_44286_50219),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44286_47897),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44286_47901),
    .in4(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44286_50207),
    .in5(out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_44286_50216),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50225 (.out1(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44286_50225),
    .in1(out_const_30),
    .in2(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44286_45120),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44286_50189),
    .in4(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44286_50193),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50229 (.out1(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44286_50229),
    .in1(out_const_74),
    .in2(out_reg_28_reg_28),
    .in3(out_reg_9_reg_9),
    .in4(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44286_50225),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44286_50233 (.out1(out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_44286_50233),
    .in1(out_const_21),
    .in2(out_reg_6_reg_6),
    .in3(out_reg_7_reg_7),
    .in4(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44286_50229),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44286_44414),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_44286_44445),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_44286_46182),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_44286_46477),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44286_46575),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_44286_47568),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_44286_47801),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44286_48030),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44286_48033),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44286_48037),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44286_44851),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_44286_44874),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_44286_44794),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_44286_45643),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_44286_48741),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_44286_48757),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_44286_48773),
    .wenable(wrenable_reg_23));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_44286_48789),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_44286_48805),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_44286_48821),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_44286_48837),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_44286_48853),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_44286_49060),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_44286_44799),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_44286_49064),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_44286_49072),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_44286_49076),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_44286_49084),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_44286_49088),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_44286_49096),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_44286_49100),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_44286_49108),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_44286_49112),
    .wenable(wrenable_reg_38));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_44286_49120),
    .wenable(wrenable_reg_39));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_44286_44818),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_44286_49124),
    .wenable(wrenable_reg_40));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_44286_49132),
    .wenable(wrenable_reg_41));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_44286_49136),
    .wenable(wrenable_reg_42));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_44286_49144),
    .wenable(wrenable_reg_43));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_44286_49148),
    .wenable(wrenable_reg_44));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_44286_49407),
    .wenable(wrenable_reg_45));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_44286_49411),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_44286_49415),
    .wenable(wrenable_reg_47));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_44286_49419),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_44286_49423),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(7),
    .BITSIZE_out1(7)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_44286_44964),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_44286_49427),
    .wenable(wrenable_reg_50));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_44286_49431),
    .wenable(wrenable_reg_51));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_44286_49435),
    .wenable(wrenable_reg_52));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_44286_49450),
    .wenable(wrenable_reg_53));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_44286_49477),
    .wenable(wrenable_reg_54));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_44286_49504),
    .wenable(wrenable_reg_55));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_44286_49532),
    .wenable(wrenable_reg_56));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_44286_49708),
    .wenable(wrenable_reg_57));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_44286_49712),
    .wenable(wrenable_reg_58));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_44286_49720),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44286_45332),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_44286_49724),
    .wenable(wrenable_reg_60));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_44286_49732),
    .wenable(wrenable_reg_61));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_44286_49736),
    .wenable(wrenable_reg_62));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_44286_49744),
    .wenable(wrenable_reg_63));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_44286_49748),
    .wenable(wrenable_reg_64));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_44286_49994),
    .wenable(wrenable_reg_65));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_44286_50064),
    .wenable(wrenable_reg_66));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_44286_50092),
    .wenable(wrenable_reg_67));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_68 (.out1(out_reg_68_reg_68),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_44286_50096),
    .wenable(wrenable_reg_68));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_69 (.out1(out_reg_69_reg_69),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_44286_50108),
    .wenable(wrenable_reg_69));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44286_45337),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_70 (.out1(out_reg_70_reg_70),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_44286_50112),
    .wenable(wrenable_reg_70));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_71 (.out1(out_reg_71_reg_71),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_44286_45195),
    .wenable(wrenable_reg_71));
  register_STD #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_72 (.out1(out_reg_72_reg_72),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_44286_45281),
    .wenable(wrenable_reg_72));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_73 (.out1(out_reg_73_reg_73),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_44286_45320),
    .wenable(wrenable_reg_73));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_74 (.out1(out_reg_74_reg_74),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_44286_47580),
    .wenable(wrenable_reg_74));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_75 (.out1(out_reg_75_reg_75),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_44286_46380),
    .wenable(wrenable_reg_75));
  register_STD #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_76 (.out1(out_reg_76_reg_76),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_44286_46557),
    .wenable(wrenable_reg_76));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_77 (.out1(out_reg_77_reg_77),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_44286_50233),
    .wenable(wrenable_reg_77));
  register_SE #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_44286_45453),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_44286_45683),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_44286_45487;

endmodule

// FSM based controller description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_adde11m52b_1023nih(done_port,
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
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_8,
  wrenable_reg_9,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
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
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_39;
  output wrenable_reg_4;
  output wrenable_reg_40;
  output wrenable_reg_41;
  output wrenable_reg_42;
  output wrenable_reg_43;
  output wrenable_reg_44;
  output wrenable_reg_45;
  output wrenable_reg_46;
  output wrenable_reg_47;
  output wrenable_reg_48;
  output wrenable_reg_49;
  output wrenable_reg_5;
  output wrenable_reg_50;
  output wrenable_reg_51;
  output wrenable_reg_52;
  output wrenable_reg_53;
  output wrenable_reg_54;
  output wrenable_reg_55;
  output wrenable_reg_56;
  output wrenable_reg_57;
  output wrenable_reg_58;
  output wrenable_reg_59;
  output wrenable_reg_6;
  output wrenable_reg_60;
  output wrenable_reg_61;
  output wrenable_reg_62;
  output wrenable_reg_63;
  output wrenable_reg_64;
  output wrenable_reg_65;
  output wrenable_reg_66;
  output wrenable_reg_67;
  output wrenable_reg_68;
  output wrenable_reg_69;
  output wrenable_reg_7;
  output wrenable_reg_70;
  output wrenable_reg_71;
  output wrenable_reg_72;
  output wrenable_reg_73;
  output wrenable_reg_74;
  output wrenable_reg_75;
  output wrenable_reg_76;
  output wrenable_reg_77;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [3:0] S_0 = 4'b0001,
    S_1 = 4'b0010,
    S_2 = 4'b0100,
    S_3 = 4'b1000;
  reg [3:0] _present_state=S_0, _next_state;
  reg done_port;
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
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_39;
  reg wrenable_reg_4;
  reg wrenable_reg_40;
  reg wrenable_reg_41;
  reg wrenable_reg_42;
  reg wrenable_reg_43;
  reg wrenable_reg_44;
  reg wrenable_reg_45;
  reg wrenable_reg_46;
  reg wrenable_reg_47;
  reg wrenable_reg_48;
  reg wrenable_reg_49;
  reg wrenable_reg_5;
  reg wrenable_reg_50;
  reg wrenable_reg_51;
  reg wrenable_reg_52;
  reg wrenable_reg_53;
  reg wrenable_reg_54;
  reg wrenable_reg_55;
  reg wrenable_reg_56;
  reg wrenable_reg_57;
  reg wrenable_reg_58;
  reg wrenable_reg_59;
  reg wrenable_reg_6;
  reg wrenable_reg_60;
  reg wrenable_reg_61;
  reg wrenable_reg_62;
  reg wrenable_reg_63;
  reg wrenable_reg_64;
  reg wrenable_reg_65;
  reg wrenable_reg_66;
  reg wrenable_reg_67;
  reg wrenable_reg_68;
  reg wrenable_reg_69;
  reg wrenable_reg_7;
  reg wrenable_reg_70;
  reg wrenable_reg_71;
  reg wrenable_reg_72;
  reg wrenable_reg_73;
  reg wrenable_reg_74;
  reg wrenable_reg_75;
  reg wrenable_reg_76;
  reg wrenable_reg_77;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
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
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_39 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_40 = 1'b0;
    wrenable_reg_41 = 1'b0;
    wrenable_reg_42 = 1'b0;
    wrenable_reg_43 = 1'b0;
    wrenable_reg_44 = 1'b0;
    wrenable_reg_45 = 1'b0;
    wrenable_reg_46 = 1'b0;
    wrenable_reg_47 = 1'b0;
    wrenable_reg_48 = 1'b0;
    wrenable_reg_49 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_50 = 1'b0;
    wrenable_reg_51 = 1'b0;
    wrenable_reg_52 = 1'b0;
    wrenable_reg_53 = 1'b0;
    wrenable_reg_54 = 1'b0;
    wrenable_reg_55 = 1'b0;
    wrenable_reg_56 = 1'b0;
    wrenable_reg_57 = 1'b0;
    wrenable_reg_58 = 1'b0;
    wrenable_reg_59 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_60 = 1'b0;
    wrenable_reg_61 = 1'b0;
    wrenable_reg_62 = 1'b0;
    wrenable_reg_63 = 1'b0;
    wrenable_reg_64 = 1'b0;
    wrenable_reg_65 = 1'b0;
    wrenable_reg_66 = 1'b0;
    wrenable_reg_67 = 1'b0;
    wrenable_reg_68 = 1'b0;
    wrenable_reg_69 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_70 = 1'b0;
    wrenable_reg_71 = 1'b0;
    wrenable_reg_72 = 1'b0;
    wrenable_reg_73 = 1'b0;
    wrenable_reg_74 = 1'b0;
    wrenable_reg_75 = 1'b0;
    wrenable_reg_76 = 1'b0;
    wrenable_reg_77 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          wrenable_reg_52 = 1'b1;
          wrenable_reg_53 = 1'b1;
          wrenable_reg_54 = 1'b1;
          wrenable_reg_55 = 1'b1;
          wrenable_reg_56 = 1'b1;
          wrenable_reg_57 = 1'b1;
          wrenable_reg_58 = 1'b1;
          wrenable_reg_59 = 1'b1;
          wrenable_reg_60 = 1'b1;
          wrenable_reg_61 = 1'b1;
          wrenable_reg_62 = 1'b1;
          wrenable_reg_63 = 1'b1;
          wrenable_reg_64 = 1'b1;
          wrenable_reg_65 = 1'b1;
          wrenable_reg_66 = 1'b1;
          wrenable_reg_67 = 1'b1;
          wrenable_reg_68 = 1'b1;
          wrenable_reg_69 = 1'b1;
          wrenable_reg_70 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_71 = 1'b1;
          wrenable_reg_72 = 1'b1;
          wrenable_reg_73 = 1'b1;
          wrenable_reg_74 = 1'b1;
          wrenable_reg_75 = 1'b1;
          wrenable_reg_76 = 1'b1;
          wrenable_reg_77 = 1'b1;
          _next_state = S_3;
          done_port = 1'b1;
        end
      S_3 :
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

// Top component for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_adde11m52b_1023nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
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
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_39;
  wire wrenable_reg_4;
  wire wrenable_reg_40;
  wire wrenable_reg_41;
  wire wrenable_reg_42;
  wire wrenable_reg_43;
  wire wrenable_reg_44;
  wire wrenable_reg_45;
  wire wrenable_reg_46;
  wire wrenable_reg_47;
  wire wrenable_reg_48;
  wire wrenable_reg_49;
  wire wrenable_reg_5;
  wire wrenable_reg_50;
  wire wrenable_reg_51;
  wire wrenable_reg_52;
  wire wrenable_reg_53;
  wire wrenable_reg_54;
  wire wrenable_reg_55;
  wire wrenable_reg_56;
  wire wrenable_reg_57;
  wire wrenable_reg_58;
  wire wrenable_reg_59;
  wire wrenable_reg_6;
  wire wrenable_reg_60;
  wire wrenable_reg_61;
  wire wrenable_reg_62;
  wire wrenable_reg_63;
  wire wrenable_reg_64;
  wire wrenable_reg_65;
  wire wrenable_reg_66;
  wire wrenable_reg_67;
  wire wrenable_reg_68;
  wire wrenable_reg_69;
  wire wrenable_reg_7;
  wire wrenable_reg_70;
  wire wrenable_reg_71;
  wire wrenable_reg_72;
  wire wrenable_reg_73;
  wire wrenable_reg_74;
  wire wrenable_reg_75;
  wire wrenable_reg_76;
  wire wrenable_reg_77;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_adde11m52b_1023nih Controller_i (.done_port(done_delayed_REG_signal_in),
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
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_adde11m52b_1023nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b),
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
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
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

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >>> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_ior_expr_FU(in1,
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
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ternary_plus_expr_FU(in1,
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
  assign out1 = in1 + in2 + in3;
endmodule

// Datapath RTL description for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_mule11m52b_1023nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port,
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
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
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
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [31:0] out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_43246_46599;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_43246_46601;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_43246_46603;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_43246_46605;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_43246_46595;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_43246_46597;
  wire signed [2:0] out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_43246_43596;
  wire signed [1:0] out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43246_43599;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_43246_43629;
  wire signed [2:0] out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_43246_43602;
  wire signed [1:0] out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_43246_43632;
  wire signed [1:0] out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_43246_43647;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43246_43865;
  wire signed [1:0] out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_43246_43887;
  wire out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_43246_46343;
  wire out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_43246_43484;
  wire out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_43246_43626;
  wire out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_43246_46353;
  wire out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_43246_43562;
  wire [10:0] out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43246_43356;
  wire out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_43246_43644;
  wire out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43246_43846;
  wire out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_43246_43849;
  wire out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_43246_43862;
  wire [11:0] out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_43246_43906;
  wire out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_43246_44043;
  wire [10:0] out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43246_43371;
  wire out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_43246_43394;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_43246_43608;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_43246_43635;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_43246_43650;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_43246_43605;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [16:0] out_const_11;
  wire [24:0] out_const_12;
  wire [52:0] out_const_13;
  wire [5:0] out_const_14;
  wire [1:0] out_const_15;
  wire [2:0] out_const_16;
  wire [3:0] out_const_17;
  wire [5:0] out_const_18;
  wire [5:0] out_const_19;
  wire [6:0] out_const_2;
  wire [29:0] out_const_20;
  wire [45:0] out_const_21;
  wire [2:0] out_const_22;
  wire [7:0] out_const_23;
  wire [27:0] out_const_24;
  wire [31:0] out_const_25;
  wire [5:0] out_const_26;
  wire [9:0] out_const_27;
  wire [10:0] out_const_28;
  wire [62:0] out_const_29;
  wire [4:0] out_const_3;
  wire [12:0] out_const_30;
  wire [16:0] out_const_31;
  wire [16:0] out_const_32;
  wire [31:0] out_const_33;
  wire [31:0] out_const_34;
  wire [51:0] out_const_35;
  wire [52:0] out_const_36;
  wire [53:0] out_const_37;
  wire [62:0] out_const_38;
  wire [63:0] out_const_39;
  wire [6:0] out_const_4;
  wire [6:0] out_const_5;
  wire [6:0] out_const_6;
  wire out_const_7;
  wire [2:0] out_const_8;
  wire [3:0] out_const_9;
  wire out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43246_47103;
  wire out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43246_47106;
  wire out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43246_47387;
  wire out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43246_43438;
  wire out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_43246_44260;
  wire out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43246_43516;
  wire out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_43246_44252;
  wire out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_43246_46723;
  wire out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_43246_46626;
  wire out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_43246_46727;
  wire out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_43246_46645;
  wire out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_43246_46652;
  wire out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_43246_46666;
  wire out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43246_47541;
  wire out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_43246_45611;
  wire out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_43246_46285;
  wire out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_43246_47548;
  wire out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_43246_47552;
  wire out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_43246_46288;
  wire out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_43246_46301;
  wire out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_43246_46260;
  wire out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_43246_43391;
  wire [63:0] out_reg_0_reg_0;
  wire out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire [21:0] out_reg_12_reg_12;
  wire [20:0] out_reg_13_reg_13;
  wire [9:0] out_reg_14_reg_14;
  wire [54:0] out_reg_15_reg_15;
  wire [1:0] out_reg_16_reg_16;
  wire [63:0] out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [12:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [52:0] out_reg_3_reg_3;
  wire [52:0] out_reg_4_reg_4;
  wire [41:0] out_reg_5_reg_5;
  wire [63:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire out_reg_8_reg_8;
  wire [63:0] out_reg_9_reg_9;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43246_43368;
  wire [53:0] out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43246_43814;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_43246_44171;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43246_43353;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_43246_44130;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43246_43402;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43246_43494;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_43246_43830;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_43246_43590;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43246_43716;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43246_43722;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_43246_43751;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_43246_43766;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_43246_45849;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43246_43336;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43246_43374;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_43246_43836;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_43246_43902;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_43246_43877;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_43246_44027;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_43246_43884;
  wire [63:0] out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43246_43798;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43246_43696;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43246_43712;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_43246_43833;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43246_43912;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_43246_44174;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43246_44227;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_43246_43899;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_43246_43487;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43246_43490;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_43246_43565;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43246_43568;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_43246_46255;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_43246_46319;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_43246_46304;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_43246_46322;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_43246_46373;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_43246_46107;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_43246_46116;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_43246_46310;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_43246_46316;
  wire out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43246_43497;
  wire out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43246_44133;
  wire out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43246_43411;
  wire out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43246_43415;
  wire out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43246_43501;
  wire out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43246_43418;
  wire out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43246_43504;
  wire out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_43246_44084;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43246_47269;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_43246_45924;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43246_47099;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43246_46932;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43246_47471;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43246_46806;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_43246_46740;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_43246_46744;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43246_43397;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_43246_43795;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_43246_43818;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_43246_43856;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_43246_43896;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_43246_43909;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_43246_45846;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_43246_46281;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_43246_46340;
  wire [53:0] out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43246_43868;
  wire [50:0] out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_43246_43893;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_43246_46326;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_43246_46330;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_43246_46347;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_43246_46356;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43246_43725;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_43246_43759;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_43246_43774;
  wire [41:0] out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_43246_43785;
  wire out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43246_43538;
  wire out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43246_43460;
  wire out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43246_44030;
  wire out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43246_44249;
  wire out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43246_44257;
  wire [12:0] out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43246_43852;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43246_43762;
  wire [52:0] out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43246_43777;
  wire [63:0] out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43246_44078;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_43246_43344;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_43246_43363;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_43246_43881;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_43246_44127;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43246_43743;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43246_43747;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_43246_43755;
  wire [21:0] out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_43246_43770;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_43246_43781;
  wire [9:0] out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_43246_43821;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_43246_45837;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_43246_46274;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_43246_46336;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_43246_46333;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_43246_43572;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43246_43575;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_43246_46350;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_43246_46359;
  wire [1:0] out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43246_43890;
  wire [12:0] out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_43246_43678;
  wire [41:0] out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43246_43791;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000000000000000000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b10000000000000000000000000000000000000000000000000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b110111000000000011011100110111)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(46),
    .value(46'b1101110011011100000000001101110011011100110111)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(28),
    .value(28'b1110000000000000000000000000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11100000000111110000000011111111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111110000000000000000000000000000000000000000000000000000)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01010)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1111111111111)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b11111111111111110)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b11111111111111111)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111110000000001)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b11111111111111111111111111111111111111111111111111111)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b111111111111111111111111111111111111111111111111111111)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_9 (.out1(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43246_43336 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43246_43336),
    .in1(in_port_a),
    .in2(out_const_35));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43344 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_43246_43344),
    .in1(in_port_a),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_43353 (.out1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43246_43353),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_43246_43344),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_43356 (.out1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43246_43356),
    .in1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43246_43353));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43363 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_43246_43363),
    .in1(in_port_b),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_43368 (.out1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43246_43368),
    .in1(out_const_28),
    .in2(out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_43246_43363));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_43371 (.out1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43246_43371),
    .in1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43246_43368));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43246_43374 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43246_43374),
    .in1(in_port_b),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43391 (.out1(out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_43246_43391),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_43246_46740),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_43246_46744),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43394 (.out1(out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_43246_43394),
    .in1(out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_43246_43391));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43397 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43246_43397),
    .in1(out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_43246_43394),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_43402 (.out1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43246_43402),
    .in1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43246_43353),
    .in2(out_const_34));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43411 (.out1(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43246_43411),
    .in1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43246_43402),
    .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43415 (.out1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43246_43415),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43246_43356),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43418 (.out1(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43246_43418),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43246_43336),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43438 (.out1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43246_43438),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43246_43418),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43246_43411),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43460 (.out1(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43246_43460),
    .in1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43246_43402),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43484 (.out1(out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_43246_43484),
    .in1(out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_43246_46723));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43487 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_43246_43487),
    .in1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_43246_46326),
    .in2(out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_43246_46316));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43490 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43246_43490),
    .in1(out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_43246_43484),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_43246_43487));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_43494 (.out1(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43246_43494),
    .in1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43246_43368),
    .in2(out_const_34));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43497 (.out1(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43246_43497),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43246_43494));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43501 (.out1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43246_43501),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43246_43371),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43504 (.out1(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43246_43504),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43246_43374),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43516 (.out1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43246_43516),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43246_43504),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43246_43497),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43538 (.out1(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43246_43538),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43246_43494));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43562 (.out1(out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_43246_43562),
    .in1(out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_43246_46727));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43565 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_43246_43565),
    .in1(out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_43246_46330),
    .in2(out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_43246_46310));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43568 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43246_43568),
    .in1(out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_43246_43562),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_43246_43565));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_43572 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_43246_43572),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43246_43490),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_43575 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43246_43575),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43246_43568),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43590 (.out1(out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_43246_43590),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43246_43575),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43246_43568));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_43246_43596 (.out1(out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_43246_43596),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43246_43490));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43599 (.out1(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43246_43599),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_43246_43572));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_43246_43602 (.out1(out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_43246_43602),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43246_43568));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_43246_43605 (.out1(out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_43246_43605),
    .in1(out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_43246_43602),
    .in2(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43246_43599));
  bit_and_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(3),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43608 (.out1(out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_43246_43608),
    .in1(out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_43246_43605),
    .in2(out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_43246_43596));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43626 (.out1(out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_43246_43626),
    .in1(out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_43246_46626));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43629 (.out1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_43246_43629),
    .in1(out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_43246_43626));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43632 (.out1(out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_43246_43632),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43246_43575));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43635 (.out1(out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_43246_43635),
    .in1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_43246_43629),
    .in2(out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_43246_43632));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43644 (.out1(out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_43246_43644),
    .in1(out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_43246_46645));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43647 (.out1(out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_43246_43647),
    .in1(out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_43246_43644));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43650 (.out1(out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_43246_43650),
    .in1(out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_43246_43647),
    .in2(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43246_43599));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43246_43678 (.out1(out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_43246_43678),
    .in1(out_const_33),
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_43246_46595),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_43246_46597));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43246_43696 (.out1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43246_43696),
    .in1(out_const_13),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43246_43336));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43246_43712 (.out1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43246_43712),
    .in1(out_const_13),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43246_43374));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_43716 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43246_43716),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43246_43696),
    .in2(out_const_34));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_43722 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43246_43722),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43246_43712),
    .in2(out_const_34));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43246_43725 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43246_43725),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43246_43716),
    .in2(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43246_43722));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43743 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43246_43743),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43246_43696),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43747 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43246_43747),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43246_43712),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_43751 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_43246_43751),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43246_43725),
    .in2(out_const_34));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43755 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_43246_43755),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43246_43725),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43246_43759 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_43246_43759),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43246_43743),
    .in2(out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_43246_46601));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_43246_43762 (.out1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43246_43762),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_2_reg_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_43766 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_43246_43766),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43246_43762),
    .in2(out_const_34));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43770 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_43246_43770),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43246_43762),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43246_43774 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_43246_43774),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43246_43747),
    .in2(out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_43246_46599));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43246_43777 (.out1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43246_43777),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_43246_43766));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43781 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_43246_43781),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43246_43777),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(42),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43246_43785 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_43246_43785),
    .clock(clock),
    .in1(out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_43246_46603),
    .in2(out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_43246_46605));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(22),
    .BITSIZE_in3(21),
    .BITSIZE_out1(42)) fu___float_mule11m52b_1023nih_43246_43791 (.out1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43246_43791),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43795 (.out1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_43246_43795),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43246_43777),
    .in2(out_const_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_in3(6),
    .BITSIZE_out1(64),
    .OFFSET_PARAMETER(32)) fu___float_mule11m52b_1023nih_43246_43798 (.out1(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43246_43798),
    .in1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_43246_45846),
    .in2(out_reg_7_reg_7),
    .in3(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(64),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_43246_43814 (.out1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43246_43814),
    .in1(out_const_37),
    .in2(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43246_43798));
  ui_lshift_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(5),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43818 (.out1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_43246_43818),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43246_43791),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43821 (.out1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_43246_43821),
    .in1(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43246_43798),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule11m52b_1023nih_43246_43830 (.out1(out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_43246_43830),
    .in1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_43246_43821),
    .in2(out_const_27));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(10),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43246_43833 (.out1(out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_43246_43833),
    .in1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_43246_43818),
    .in2(out_reg_14_reg_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43246_43836 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_43246_43836),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_43246_43833),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43846 (.out1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43246_43846),
    .in1(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43246_47269));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43849 (.out1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_43246_43849),
    .in1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43246_43846));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43246_43852 (.out1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43246_43852),
    .in1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_43246_43849),
    .in2(out_reg_1_reg_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43856 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_43246_43856),
    .in1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43246_43814),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_43862 (.out1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_43246_43862),
    .in1(out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_43246_46652));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43865 (.out1(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43246_43865),
    .in1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_43246_43862));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43868 (.out1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43246_43868),
    .in1(out_reg_15_reg_15),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43246_43865));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(54),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43246_43877 (.out1(out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_43246_43877),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43246_43868),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43881 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_43246_43881),
    .in1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43246_43814),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43884 (.out1(out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_43246_43884),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_43246_43881),
    .in2(out_const_15));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_43887 (.out1(out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_43246_43887),
    .in1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43246_43846));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43890 (.out1(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43246_43890),
    .in1(out_reg_16_reg_16),
    .in2(out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_43246_43887));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(51),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43893 (.out1(out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_43246_43893),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_43246_43836),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43246_43865));
  ui_lshift_expr_FU #(.BITSIZE_in1(51),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43896 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_43246_43896),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_43246_43893),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43246_43899 (.out1(out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_43246_43899),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_43246_43896),
    .in2(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43246_43890));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43246_43902 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_43246_43902),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_43246_43899),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu___float_mule11m52b_1023nih_43246_43906 (.out1(out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_43246_43906),
    .in1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43246_43852));
  ui_lshift_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_43909 (.out1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_43246_43909),
    .in1(out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_43246_43906),
    .in2(out_const_4));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_43912 (.out1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43246_43912),
    .in1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_43246_43909),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_43246_43902));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43246_44027 (.out1(out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_43246_44027),
    .in1(out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_43246_43877),
    .in2(out_const_36));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44030 (.out1(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43246_44030),
    .in1(out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_43246_44027),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44043 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_43246_44043),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_43246_46666));
  ui_plus_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(1),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_44078 (.out1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43246_44078),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_18_reg_18));
  ui_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44084 (.out1(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_43246_44084),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43246_43912),
    .in2(out_const_39));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_44127 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_43246_44127),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43246_44078),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_44130 (.out1(out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_43246_44130),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_43246_44127),
    .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44133 (.out1(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43246_44133),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_43246_44130));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_mule11m52b_1023nih_43246_44171 (.out1(out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_43246_44171),
    .in1(out_const_38),
    .in2(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43246_44078));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_44174 (.out1(out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_43246_44174),
    .in1(out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_43246_44171),
    .in2(out_reg_0_reg_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_44227 (.out1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43246_44227),
    .in1(out_const_29),
    .in2(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43246_43397));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44249 (.out1(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43246_44249),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43246_43374),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44252 (.out1(out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_43246_44252),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43246_43497),
    .in3(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43246_44249),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44257 (.out1(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43246_44257),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43246_43336),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_44260 (.out1(out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_43246_44260),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43246_43411),
    .in3(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43246_44257),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_45611 (.out1(out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_43246_45611),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43246_47103),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43246_47106),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43246_47471),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43246_47387),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43246_47541),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_45837 (.out1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_43246_45837),
    .in1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_43246_43795),
    .in2(out_const_10));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_45846 (.out1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_43246_45846),
    .in1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_43246_45837),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_45849 (.out1(out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_43246_45849),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_43246_43751),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(4)) fu___float_mule11m52b_1023nih_43246_45924 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_43246_45924),
    .in1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43246_43852),
    .in2(out_const_17));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_46107 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_43246_46107),
    .in1(out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_43246_44252),
    .in2(out_const_15),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_46116 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_43246_46116),
    .in1(out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_43246_44260),
    .in2(out_const_15),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43246_46255 (.out1(out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_43246_46255),
    .in1(out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_43246_45611),
    .in2(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_43246_46274),
    .in3(out_const_30));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46260 (.out1(out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_43246_46260),
    .in1(out_const_31),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43246_47103),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43246_47106),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43246_47471),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43246_47387),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43246_47541),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_46274 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_43246_46274),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43246_43397),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_46281 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_43246_46281),
    .in1(out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_43246_46255),
    .in2(out_const_18));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46285 (.out1(out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_43246_46285),
    .in1(out_const_32),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43246_47103),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43246_47106),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43246_47471),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43246_47387),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43246_47541),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46288 (.out1(out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_43246_46288),
    .in1(out_const_24),
    .in2(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43246_46806),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43246_44133),
    .in4(out_reg_11_reg_11),
    .in5(out_reg_10_reg_10),
    .in6(out_reg_19_reg_19),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46301 (.out1(out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_43246_46301),
    .in1(out_const_12),
    .in2(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43246_46806),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43246_44133),
    .in4(out_reg_11_reg_11),
    .in5(out_reg_10_reg_10),
    .in6(out_reg_19_reg_19),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_46304 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_43246_46304),
    .in1(out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_43246_46301),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_43246_44174),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_46310 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_43246_46310),
    .in1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43246_43516),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_43246_46107));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43246_46316 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_43246_46316),
    .in1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43246_43438),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_43246_46116));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43246_46319 (.out1(out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_43246_46319),
    .in1(out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_43246_46260),
    .in2(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_43246_46333),
    .in3(out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_43246_46336));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_46322 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_43246_46322),
    .in1(out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_43246_46288),
    .in2(out_reg_6_reg_6),
    .in3(out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_43246_46304));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_46326 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_43246_46326),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_43246_46350),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_46330 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_43246_46330),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_43246_46359),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_46333 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_43246_46333),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_43246_46281),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_46336 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_43246_46336),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43246_44227),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43246_46340 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_43246_46340),
    .in1(out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_43246_46319),
    .in2(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46343 (.out1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_43246_46343),
    .in1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43246_43438));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_46347 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_43246_46347),
    .in1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_43246_46343),
    .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_46350 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_43246_46350),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_43246_46347),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46353 (.out1(out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_43246_46353),
    .in1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43246_43516));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_46356 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_43246_46356),
    .in1(out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_43246_46353),
    .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43246_46359 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_43246_46359),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_43246_46356),
    .in2(out_const_22));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43246_46373 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_43246_46373),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_9_reg_9),
    .in3(out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_43246_46322));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_46595 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_43246_46595),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43246_43356));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43246_46597 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_43246_46597),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43246_43371));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_46599 (.out1(out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_43246_46599),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43246_43716));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43246_46601 (.out1(out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_43246_46601),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43246_43722));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_43246_46603 (.out1(out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_43246_46603),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43246_43743));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_43246_46605 (.out1(out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_43246_46605),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43246_43747));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46626 (.out1(out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_43246_46626),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43246_43418),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43246_43411),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43246_44257),
    .in5(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43246_43415),
    .in6(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43246_43460),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46645 (.out1(out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_43246_46645),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43246_43504),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43246_43497),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43246_44249),
    .in5(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43246_43501),
    .in6(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43246_43538),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46652 (.out1(out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_43246_46652),
    .in1(out_const_7),
    .in2(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43246_47269),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46666 (.out1(out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_43246_46666),
    .in1(out_const_23),
    .in2(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43246_44030),
    .in3(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43246_47099),
    .in4(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43246_46932),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46723 (.out1(out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_43246_46723),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43246_43415),
    .in3(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43246_43460),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_46727 (.out1(out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_43246_46727),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43246_43501),
    .in3(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43246_43538),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43246_46740 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_43246_46740),
    .in1(in_port_a),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43246_46744 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_43246_46744),
    .in1(in_port_b),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43246_46806 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43246_46806),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43246_44078),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43246_46932 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43246_46932),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43246_43868),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43246_47099 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43246_47099),
    .in1(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43246_43890),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43246_47103 (.out1(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43246_47103),
    .in1(out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_43246_43635),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43246_47106 (.out1(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43246_47106),
    .in1(out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_43246_43650),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43246_47269 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43246_47269),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43246_43791),
    .in2(out_const_14));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43246_47387 (.out1(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43246_47387),
    .in1(out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_43246_43608),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43246_47471 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43246_47471),
    .in1(out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_43246_43590),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(46),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_47541 (.out1(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43246_47541),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43246_43418),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43246_43411),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43246_44257),
    .in5(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43246_43504),
    .in6(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43246_43497),
    .in7(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43246_44249),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_47548 (.out1(out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_43246_47548),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43246_47103),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43246_47106),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43246_47471),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43246_47387),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43246_47552 (.out1(out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_43246_47552),
    .in1(out_const_25),
    .in2(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43246_44030),
    .in3(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43246_47099),
    .in4(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43246_46932),
    .in5(out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_43246_45924),
    .in6(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_43246_44084),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43246_43397),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(13),
    .BITSIZE_out1(13)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_43246_43678),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43246_47541),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_43246_47548),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(22),
    .BITSIZE_out1(22)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_43246_43770),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_43246_43781),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_43246_43830),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_43246_43856),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_43246_43884),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43246_43912),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_43246_44043),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_43246_47552),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_43246_43755),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_43246_43759),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_43246_43774),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(42),
    .BITSIZE_out1(42)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_43246_43785),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43246_44227),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_43246_45849),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_43246_46285),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_43246_46340),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_43246_46373;

endmodule

// FSM based controller description for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_mule11m52b_1023nih(done_port,
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
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
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
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [3:0] S_0 = 4'b0001,
    S_1 = 4'b0010,
    S_2 = 4'b0100,
    S_3 = 4'b1000;
  reg [3:0] _present_state=S_0, _next_state;
  reg done_port;
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
  reg wrenable_reg_19;
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
    wrenable_reg_19 = 1'b0;
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
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_3;
          done_port = 1'b1;
        end
      S_3 :
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

// Top component for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_mule11m52b_1023nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
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
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_mule11m52b_1023nih Controller_i (.done_port(done_delayed_REG_signal_in),
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
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_mule11m52b_1023nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b),
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
    .wrenable_reg_19(wrenable_reg_19),
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

// Datapath RTL description for _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z21matrix_multiplicationPKdS0_Pdjjj(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_C,
  in_port_n,
  in_port_m,
  in_port_w,
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
  fuselector_BMEMORY_CTRLN_15_i0_LOAD,
  fuselector_BMEMORY_CTRLN_15_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0,
  selector_MUX_20_reg_0_0_0_0,
  selector_MUX_25_reg_2_0_0_0,
  selector_MUX_28_reg_5_0_0_0,
  selector_MUX_29_reg_6_0_0_0,
  selector_MUX_30_reg_7_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_C;
  input [31:0] in_port_n;
  input [31:0] in_port_m;
  input [31:0] in_port_w;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_15_i0_STORE;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  input selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  input selector_MUX_20_reg_0_0_0_0;
  input selector_MUX_25_reg_2_0_0_0;
  input selector_MUX_28_reg_5_0_0_0;
  input selector_MUX_29_reg_6_0_0_0;
  input selector_MUX_30_reg_7_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
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
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_15_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  wire [31:0] out_MUX_20_reg_0_0_0_0;
  wire [31:0] out_MUX_25_reg_2_0_0_0;
  wire [63:0] out_MUX_28_reg_5_0_0_0;
  wire [31:0] out_MUX_29_reg_6_0_0_0;
  wire [28:0] out_MUX_30_reg_7_0_0_0;
  wire [63:0] out___float_adde11m52b_1023nih_23_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  wire [63:0] out___float_mule11m52b_1023nih_24_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  wire out_const_0;
  wire [7:0] out_const_1;
  wire out_const_2;
  wire [1:0] out_const_3;
  wire [7:0] out_const_4;
  wire [28:0] out_conv_out_const_0_1_29;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [6:0] out_conv_out_const_1_8_7;
  wire [28:0] out_conv_out_reg_6_reg_6_32_29;
  wire out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_46371;
  wire out_read_cond_FU_13_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870;
  wire out_read_cond_FU_14_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872;
  wire out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864;
  wire out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868;
  wire [31:0] out_reg_0_reg_0;
  wire [63:0] out_reg_10_reg_10;
  wire [63:0] out_reg_11_reg_11;
  wire [63:0] out_reg_12_reg_12;
  wire [28:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [63:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [28:0] out_reg_7_reg_7;
  wire [28:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire out_ui_eq_expr_FU_32_0_32_16_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43222;
  wire out_ui_eq_expr_FU_32_0_32_16_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43224;
  wire out_ui_eq_expr_FU_32_0_32_16_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43226;
  wire out_ui_le_expr_FU_32_32_32_17_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43228;
  wire out_ui_le_expr_FU_32_32_32_17_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43230;
  wire out_ui_le_expr_FU_32_32_32_17_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43232;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_18_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36786;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_18_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36829;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_18_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36848;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_19_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36794;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_19_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36854;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_20_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36801;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_20_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36809;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36838;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_21_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36790;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_21_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36832;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_21_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36851;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36781;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_22_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36824;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_22_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36843;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [28:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [28:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [63:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  wire s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_15_i0 (.out1({null_out_signal_BMEMORY_CTRLN_15_i0_out1_1,
      out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0}),
    .in3({7'b0000000,
      out_conv_out_const_1_8_7}),
    .in4({1'b0,
      out_const_2}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_15_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_15_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_15_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .in1(out_reg_3_reg_3),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36781));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_15_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_22_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36824),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_22_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36843));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_20_reg_0_0_0_0 (.out1(out_MUX_20_reg_0_0_0_0),
    .sel(selector_MUX_20_reg_0_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_20_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36801),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_25_reg_2_0_0_0 (.out1(out_MUX_25_reg_2_0_0_0),
    .sel(selector_MUX_25_reg_2_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_28_reg_5_0_0_0 (.out1(out_MUX_28_reg_5_0_0_0),
    .sel(selector_MUX_28_reg_5_0_0_0),
    .in1(out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0),
    .in2(out___float_adde11m52b_1023nih_23_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_29_reg_6_0_0_0 (.out1(out_MUX_29_reg_6_0_0_0),
    .sel(selector_MUX_29_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36838),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) MUX_30_reg_7_0_0_0 (.out1(out_MUX_30_reg_7_0_0_0),
    .sel(selector_MUX_30_reg_7_0_0_0),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_29));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_reg_6_reg_6_32_29));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_reg_5_reg_5));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111110)) const_4 (.out1(out_const_4));
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
    .BITSIZE_out1(29)) conv_out_reg_6_reg_6_32_29 (.out1(out_conv_out_reg_6_reg_6_32_29),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36781 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36781),
    .in1(in_port_C),
    .in2(out_ui_lshift_expr_FU_32_0_32_18_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36786));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36786 (.out1(out_ui_lshift_expr_FU_32_0_32_18_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36786),
    .in1(out_ui_plus_expr_FU_32_32_32_21_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36790),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36790 (.out1(out_ui_plus_expr_FU_32_32_32_21_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36790),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36794 (.out1(out_ui_mult_expr_FU_32_32_32_0_19_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36794),
    .clock(clock),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36801 (.out1(out_ui_plus_expr_FU_32_0_32_20_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36801),
    .in1(out_reg_0_reg_0),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36809 (.out1(out_ui_plus_expr_FU_32_0_32_20_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36809),
    .in1(out_reg_2_reg_2),
    .in2(out_const_2));
  __float_adde11m52b_1023nih fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812 (.done_port(s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .return_port(out___float_adde11m52b_1023nih_23_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .a(out_reg_12_reg_12),
    .b(out_reg_5_reg_5));
  __float_mule11m52b_1023nih fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816 (.done_port(s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .return_port(out___float_mule11m52b_1023nih_24_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .a(out_reg_10_reg_10),
    .b(out_reg_11_reg_11));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36824 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_22_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36824),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_18_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36829));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36829 (.out1(out_ui_lshift_expr_FU_32_0_32_18_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36829),
    .in1(out_ui_plus_expr_FU_32_32_32_21_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36832),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36832 (.out1(out_ui_plus_expr_FU_32_32_32_21_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36832),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_6_reg_6));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36838 (.out1(out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36838),
    .in1(out_reg_6_reg_6),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36843 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_22_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36843),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_18_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36848));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36848 (.out1(out_ui_lshift_expr_FU_32_0_32_18_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36848),
    .in1(out_ui_plus_expr_FU_32_32_32_21_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36851),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36851 (.out1(out_ui_plus_expr_FU_32_32_32_21_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36851),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36854 (.out1(out_ui_mult_expr_FU_32_32_32_0_19_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36854),
    .clock(clock),
    .in1(in_port_w),
    .in2(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864 (.out1(out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864),
    .in1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_46371));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868 (.out1(out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868),
    .in1(out_ui_le_expr_FU_32_32_32_17_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43228));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870 (.out1(out_read_cond_FU_13_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870),
    .in1(out_reg_9_reg_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872 (.out1(out_read_cond_FU_14_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872),
    .in1(out_ui_le_expr_FU_32_32_32_17_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43232));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43222 (.out1(out_ui_eq_expr_FU_32_0_32_16_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43222),
    .in1(in_port_n),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43224 (.out1(out_ui_eq_expr_FU_32_0_32_16_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43224),
    .in1(in_port_w),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43226 (.out1(out_ui_eq_expr_FU_32_0_32_16_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43226),
    .in1(in_port_m),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43228 (.out1(out_ui_le_expr_FU_32_32_32_17_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43228),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43230 (.out1(out_ui_le_expr_FU_32_32_32_17_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43230),
    .in1(in_port_m),
    .in2(out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36838));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43232 (.out1(out_ui_le_expr_FU_32_32_32_17_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43232),
    .in1(in_port_w),
    .in2(out_reg_4_reg_4));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_46371 (.out1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_46371),
    .in1(out_const_4),
    .in2(out_ui_eq_expr_FU_32_0_32_16_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43222),
    .in3(out_ui_eq_expr_FU_32_0_32_16_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43224),
    .in4(out_ui_eq_expr_FU_32_0_32_16_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43226),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_20_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_19_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36794),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out___float_mule11m52b_1023nih_24_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_25_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36781),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_20_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36809),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_28_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_29_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_30_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_19_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36854),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_17_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_43230),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864 = out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864;
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868 = out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868;
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870 = out_read_cond_FU_13_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870;
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872 = out_read_cond_FU_14_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812 = s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816 = s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;

endmodule

// FSM based controller description for _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z21matrix_multiplicationPKdS0_Pdjjj(done_port,
  fuselector_BMEMORY_CTRLN_15_i0_LOAD,
  fuselector_BMEMORY_CTRLN_15_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0,
  selector_MUX_20_reg_0_0_0_0,
  selector_MUX_25_reg_2_0_0_0,
  selector_MUX_28_reg_5_0_0_0,
  selector_MUX_29_reg_6_0_0_0,
  selector_MUX_30_reg_7_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864;
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868;
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870;
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_15_i0_STORE;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  output selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  output selector_MUX_20_reg_0_0_0_0;
  output selector_MUX_25_reg_2_0_0_0;
  output selector_MUX_28_reg_5_0_0_0;
  output selector_MUX_29_reg_6_0_0_0;
  output selector_MUX_30_reg_7_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [19:0] S_0 = 20'b00000000000000000001,
    S_18 = 20'b01000000000000000000,
    S_1 = 20'b00000000000000000010,
    S_2 = 20'b00000000000000000100,
    S_3 = 20'b00000000000000001000,
    S_5 = 20'b00000000000000100000,
    S_6 = 20'b00000000000001000000,
    S_7 = 20'b00000000000010000000,
    S_8 = 20'b00000000000100000000,
    S_9 = 20'b00000000001000000000,
    S_10 = 20'b00000000010000000000,
    S_11 = 20'b00000000100000000000,
    S_12 = 20'b00000001000000000000,
    S_13 = 20'b00000010000000000000,
    S_14 = 20'b00000100000000000000,
    S_15 = 20'b00001000000000000000,
    S_16 = 20'b00010000000000000000,
    S_17 = 20'b00100000000000000000,
    S_4 = 20'b00000000000000010000,
    S_19 = 20'b10000000000000000000;
  reg [19:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_15_i0_STORE;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  reg selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  reg selector_MUX_20_reg_0_0_0_0;
  reg selector_MUX_25_reg_2_0_0_0;
  reg selector_MUX_28_reg_5_0_0_0;
  reg selector_MUX_29_reg_6_0_0_0;
  reg selector_MUX_30_reg_7_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
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
    fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_15_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812 = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 = 1'b0;
    selector_MUX_20_reg_0_0_0_0 = 1'b0;
    selector_MUX_25_reg_2_0_0_0 = 1'b0;
    selector_MUX_28_reg_5_0_0_0 = 1'b0;
    selector_MUX_29_reg_6_0_0_0 = 1'b0;
    selector_MUX_30_reg_7_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_18;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_18 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_MUX_20_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_28_reg_5_0_0_0 = 1'b1;
          selector_MUX_30_reg_7_0_0_0 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1 = 1'b1;
          selector_MUX_29_reg_6_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b1;
          wrenable_reg_10 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_11 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          _next_state = S_10;
        end
      S_10 :
        begin
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_12 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          _next_state = S_14;
        end
      S_14 :
        begin
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_5 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870 == 1'b1)
            begin
              _next_state = S_17;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_17 :
        begin
          selector_MUX_25_reg_2_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872 == 1'b1)
            begin
              _next_state = S_4;
              selector_MUX_25_reg_2_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_4 :
        begin
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_19;
              done_port = 1'b1;
            end
        end
      S_19 :
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

// Top component for _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z21matrix_multiplicationPKdS0_Pdjjj(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  C,
  n,
  m,
  w,
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
  input [31:0] C;
  input [31:0] n;
  input [31:0] m;
  input [31:0] w;
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
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864;
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868;
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870;
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_15_i0_STORE;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816;
  wire selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  wire selector_MUX_20_reg_0_0_0_0;
  wire selector_MUX_25_reg_2_0_0_0;
  wire selector_MUX_28_reg_5_0_0_0;
  wire selector_MUX_29_reg_6_0_0_0;
  wire selector_MUX_30_reg_7_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z21matrix_multiplicationPKdS0_Pdjjj Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_15_i0_LOAD(fuselector_BMEMORY_CTRLN_15_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_15_i0_STORE(fuselector_BMEMORY_CTRLN_15_i0_STORE),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .selector_MUX_20_reg_0_0_0_0(selector_MUX_20_reg_0_0_0_0),
    .selector_MUX_25_reg_2_0_0_0(selector_MUX_25_reg_2_0_0_0),
    .selector_MUX_28_reg_5_0_0_0(selector_MUX_28_reg_5_0_0_0),
    .selector_MUX_29_reg_6_0_0_0(selector_MUX_29_reg_6_0_0_0),
    .selector_MUX_30_reg_7_0_0_0(selector_MUX_30_reg_7_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z21matrix_multiplicationPKdS0_Pdjjj Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36864),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36868),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36870),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36872),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_C(C),
    .in_port_n(n),
    .in_port_m(m),
    .in_port_w(w),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_15_i0_LOAD(fuselector_BMEMORY_CTRLN_15_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_15_i0_STORE(fuselector_BMEMORY_CTRLN_15_i0_STORE),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36812),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_36068_36816),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .selector_MUX_20_reg_0_0_0_0(selector_MUX_20_reg_0_0_0_0),
    .selector_MUX_25_reg_2_0_0_0(selector_MUX_25_reg_2_0_0_0),
    .selector_MUX_28_reg_5_0_0_0(selector_MUX_28_reg_5_0_0_0),
    .selector_MUX_29_reg_6_0_0_0(selector_MUX_29_reg_6_0_0_0),
    .selector_MUX_30_reg_7_0_0_0(selector_MUX_30_reg_7_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
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

// Minimal interface for function: _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z21matrix_multiplicationPKdS0_Pdjjj(clock,
  reset,
  start_port,
  A,
  B,
  C,
  n,
  m,
  w,
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
  input [31:0] C;
  input [31:0] n;
  input [31:0] m;
  input [31:0] w;
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
  
  __Z21matrix_multiplicationPKdS0_Pdjjj __Z21matrix_multiplicationPKdS0_Pdjjj_i0 (.done_port(done_port),
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
    .C(C),
    .n(n),
    .m(m),
    .w(w),
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


