
`timescale 1ns / 1ns

module gm_rampa_ref_dpi
( 
    input clk,
	input reset,
	input clk_enable,
    
/* Simulink signal name: 'dpi_1' */
output shortint gm_rampa_ref_Y_dpi_1,
/* Simulink signal name: 'dpi_2' */
output shortint gm_rampa_ref_Y_dpi_2
); 

    parameter loop_factor = 1;
    parameter overclocking_factor = 5;
    reg [63:0] overclocking_counter;

    chandle objhandle;


    import "DPI-C" function chandle DPI_gm_rampa_ref_initialize(chandle existhandle);
    import "DPI-C" function void DPI_gm_rampa_ref_output(input chandle objhandle,
/*Simulink signal name: 'dpi_1'*/
inout shortint gm_rampa_ref_Y_dpi_1,
/*Simulink signal name: 'dpi_2'*/
inout shortint gm_rampa_ref_Y_dpi_2);
    import "DPI-C" function void DPI_gm_rampa_ref_update(input chandle objhandle);
    

	always @(reset) begin
        objhandle = DPI_gm_rampa_ref_initialize(objhandle);
        overclocking_counter <= 64'b1;
	end 

	always @(posedge clk) begin 
        if(clk_enable == 1'b1) begin
            if(overclocking_counter==1) begin
                for(int ii=0; ii < loop_factor; ii=ii+1) begin       
                    DPI_gm_rampa_ref_output(objhandle,
gm_rampa_ref_Y_dpi_1, gm_rampa_ref_Y_dpi_2);
                    DPI_gm_rampa_ref_update(objhandle);   
                end
                
            end
            if(overclocking_counter == overclocking_factor)
                overclocking_counter <= 64'b1;
            else
                overclocking_counter <= overclocking_counter + 1'b1;
        end
	end

endmodule


