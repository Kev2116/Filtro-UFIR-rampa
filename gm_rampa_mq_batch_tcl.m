%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Auto generated cosimulation 'tclstart' script 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Source Model         : rampa
%  Generated Model      : gm_rampa
%  Cosimulation Model   : gm_rampa_mq
%
%  Source DUT           : gm_rampa_mq/rampa
%  Cosimulation DUT     : gm_rampa_mq/rampa_mq
%
%  File Location        : C:\Users\Windows\Documents\Practicas MATLAB\Rampa\rampa\gm_rampa_mq_tcl.m
%  Created              : 2022-05-08 12:32:18
%
%  Generated by MATLAB 9.2 and HDL Coder 3.10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ClockName           : clk
%  ResetName           : 
%  ClockEnableName     : 
%
%  ClockLowTime        : 5ns
%  ClockHighTime       : 5ns
%  ClockPeriod         : 10ns
%
%  ResetLength         : 20ns
%  ClockEnableDelay    : 10ns
%  HoldTime            : 2ns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ModelBaseSampleTime   : 0.001
%  DutBaseSampleTime     : 0.001
%  OverClockFactor     : 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Mapping of DutBaseSampleTime to ClockPeriod
%
%  N = (ClockPeriod / DutBaseSampleTime) * OverClockFactor
%  1 sec in Simulink corresponds to 10000ns in the HDL Simulator(N = 10000)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ResetHighAt          : (ClockLowTime + ResetLength + HoldTime)
%  ResetRiseEdge        : 27ns
%  ResetType            : sync
%  ResetAssertedLevel   : 1
%
%  ClockEnableHighAt    : (ClockLowTime + ResetLength + ClockEnableDelay + HoldTime)
%  ClockEnableRiseEdge  : 37ns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function tclCmds = gm_rampa_mq_batch_tcl
tclCmds = {
    'do rampa_compile.do',...% Compile the generated code
    'vsimulink   work.rampa',...% Initiate cosimulation
    'set UserTimeUnit ns',...% Set simulation time unit
    'puts ""',...
    'puts "Ready for cosimulation..."',...
};
end