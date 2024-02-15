// -------------------------------------------------------------
// 
// File Name: C:\Users\Windows\Documents\Practicas MATLAB\Rampa\rampa\rampa_dpi_tb.sv
// Created: 2022-05-08 12:34:02
// 
// -- Generated by MATLAB 9.2 and HDL Coder 3.10
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.001
// Target subsystem base rate: 0.001
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: rampa_dpi_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module rampa_dpi_tb;


  logic clk;
  logic reset;
  logic enb;
  logic const_true;
  logic snkDone;
  logic const_false;
  logic signed [15:0] gm_rampa_ref_Y_dpi_1;  // sfix16_En10
  logic [15:0] gm_rampa_ref_Y_dpi_1_temp;  // ufix16
  logic signed [15:0] in1;  // sfix16_En10
  logic dpiReset;
  logic dpiEnable;
  logic signed [15:0] out_rsvd;  // sfix16_En10
  logic signed [15:0] gm_rampa_ref_Y_dpi_2;  // sfix16_En10
  logic [15:0] gm_rampa_ref_Y_dpi_2_temp;  // ufix16
  logic signed [15:0] out_rsvd_ref;  // sfix16_En10
  logic out_rsvd_testFailure;
  logic isTestFailed;
  logic rdEnb;


  assign const_true = 1'b1;



  assign #100020 snkDone = const_true;

  always 
    begin : clk_gen
      clk <= 1'b1;
      # (5);
      clk <= 1'b0;
      # (5);
      if (snkDone == 1'b1) begin
        clk <= 1'b1;
        # (5);
        clk <= 1'b0;
        # (5);
        $stop;
      end
    end

  initial
    begin : reset_gen
      reset <= 1'b1;
      # (30);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  assign const_false = 1'b0;



  assign enb = (reset == 1'b0 ? const_true :
              const_false);



  assign gm_rampa_ref_Y_dpi_1_temp = gm_rampa_ref_Y_dpi_1;



  assign in1 = gm_rampa_ref_Y_dpi_1_temp;



  initial
    begin : dpiReset_gen
      dpiReset <= 1'b1;
      # (20);
      @ (posedge clk)
      # (2);
      dpiReset <= 1'b0;
    end

  assign dpiEnable = (dpiReset == 1'b0 ? const_true :
              const_false);



  rampa u_rampa (.in1(in1),  // sfix16_En10
                 .clk(clk),
                 .out_rsvd(out_rsvd)  // sfix16_En10
                 );

  gm_rampa_ref_dpi #(.loop_factor(1),
                     .overclocking_factor(1)
                     )
                   u_gm_rampa_ref_dpi (.clk(clk),
                                       .reset(dpiReset),
                                       .clk_enable(dpiEnable),
                                       .gm_rampa_ref_Y_dpi_1(gm_rampa_ref_Y_dpi_1),  // sfix16_En10
                                       .gm_rampa_ref_Y_dpi_2(gm_rampa_ref_Y_dpi_2)  // sfix16_En10
                                       );

  assign gm_rampa_ref_Y_dpi_2_temp = gm_rampa_ref_Y_dpi_2;



  assign out_rsvd_ref = gm_rampa_ref_Y_dpi_2_temp;



  always @(posedge clk)
    begin : out_rsvd_checker
      if (reset == 1'b1) begin
        out_rsvd_testFailure <= 1'b0;
      end
      else begin
        if (enb == 1'b1 && out_rsvd !== out_rsvd_ref) begin
          out_rsvd_testFailure <= 1'b1;
          $display("ERROR in out_rsvd at time %t : Expected '%h' Actual '%h'", $time, out_rsvd_ref, out_rsvd);
        end
      end
    end

  assign isTestFailed = out_rsvd_testFailure;

  always @(posedge clk)
    begin : completed_msg
      if (snkDone == 1'b1) begin
        if (isTestFailed == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // rampa_dpi_tb

