//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Fri Mar 31 15:39:47 2017
//Host        : elodlt-ro running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    fmc_iic_scl_io,
    fmc_iic_sda_io,
    fmc_prsnt_m2c_l_tri_io);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  inout fmc_iic_scl_io;
  inout fmc_iic_sda_io;
  inout [0:0]fmc_prsnt_m2c_l_tri_io;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire fmc_iic_scl_i;
  wire fmc_iic_scl_io;
  wire fmc_iic_scl_o;
  wire fmc_iic_scl_t;
  wire fmc_iic_sda_i;
  wire fmc_iic_sda_io;
  wire fmc_iic_sda_o;
  wire fmc_iic_sda_t;
  wire [0:0]fmc_prsnt_m2c_l_tri_i_0;
  wire [0:0]fmc_prsnt_m2c_l_tri_io_0;
  wire [0:0]fmc_prsnt_m2c_l_tri_o_0;
  wire [0:0]fmc_prsnt_m2c_l_tri_t_0;

  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .fmc_iic_scl_i(fmc_iic_scl_i),
        .fmc_iic_scl_o(fmc_iic_scl_o),
        .fmc_iic_scl_t(fmc_iic_scl_t),
        .fmc_iic_sda_i(fmc_iic_sda_i),
        .fmc_iic_sda_o(fmc_iic_sda_o),
        .fmc_iic_sda_t(fmc_iic_sda_t),
        .fmc_prsnt_m2c_l_tri_i(fmc_prsnt_m2c_l_tri_i_0),
        .fmc_prsnt_m2c_l_tri_o(fmc_prsnt_m2c_l_tri_o_0),
        .fmc_prsnt_m2c_l_tri_t(fmc_prsnt_m2c_l_tri_t_0));
  IOBUF fmc_iic_scl_iobuf
       (.I(fmc_iic_scl_o),
        .IO(fmc_iic_scl_io),
        .O(fmc_iic_scl_i),
        .T(fmc_iic_scl_t));
  IOBUF fmc_iic_sda_iobuf
       (.I(fmc_iic_sda_o),
        .IO(fmc_iic_sda_io),
        .O(fmc_iic_sda_i),
        .T(fmc_iic_sda_t));
  IOBUF fmc_prsnt_m2c_l_tri_iobuf_0
       (.I(fmc_prsnt_m2c_l_tri_o_0),
        .IO(fmc_prsnt_m2c_l_tri_io[0]),
        .O(fmc_prsnt_m2c_l_tri_i_0),
        .T(fmc_prsnt_m2c_l_tri_t_0));
endmodule
