
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:062default:default2
00:00:072default:default2
1251.8322default:default2
0.0002default:defaultZ17-268h px? 
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental C:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/utils_1/imports/synth_1/UART_Transmitter.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2t
`C:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/utils_1/imports/synth_1/UART_Transmitter.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
v
Command: %s
53*	vivadotcl2E
1synth_design -top top_UART -part xc7a100tcsg324-32default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
32842default:defaultZ8-7075h px? 
?
%s*synth2?
rStarting Synthesize : Time (s): cpu = 00:00:10 ; elapsed = 00:00:09 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
452default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter bitNumber bound to: 8 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter baudRate bound to: 9600 - type: integer 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter parity bound to: 1'bx 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter stopBits bound to: 1 - type: integer 
2default:defaulth p
x
? 
Q
%s
*synth29
%	Parameter stopLogic bound to: 1'b1 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter clockFreq bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
UART_Transmitter2default:default2j
VC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Transmitter.vhd2default:default2
182default:default2
	TX_Module2default:default2$
UART_Transmitter2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
1232default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2$
UART_Transmitter2default:default2l
VC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Transmitter.vhd2default:default2
412default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter bitNumber bound to: 8 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter baudRate bound to: 9600 - type: integer 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter parity bound to: 1'bx 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter stopBits bound to: 1 - type: integer 
2default:defaulth p
x
? 
Q
%s
*synth29
%	Parameter stopLogic bound to: 1'b1 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter clockFreq bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
?
+Unused sequential element %s was removed. 
4326*oasys2!
paritCalc_reg2default:default2l
VC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Transmitter.vhd2default:default2
1252default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
UART_Transmitter2default:default2
12default:default2
12default:default2l
VC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Transmitter.vhd2default:default2
412default:default8@Z8-256h px? 
^
%s
*synth2F
2	Parameter bitNumber bound to: 8 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter baudRate bound to: 9600 - type: integer 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter parity bound to: 1'bx 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter stopBits bound to: 1 - type: integer 
2default:defaulth p
x
? 
Q
%s
*synth29
%	Parameter stopLogic bound to: 1'b1 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter clockFreq bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter receiveNumber bound to: 100 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
UART_Receiver2default:default2g
SC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Receiver.vhd2default:default2
92default:default2
	RX_Module2default:default2!
UART_Receiver2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
1482default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
UART_Receiver2default:default2i
SC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Receiver.vhd2default:default2
312default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter bitNumber bound to: 8 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter baudRate bound to: 9600 - type: integer 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter parity bound to: 1'bx 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter stopBits bound to: 1 - type: integer 
2default:defaulth p
x
? 
Q
%s
*synth29
%	Parameter stopLogic bound to: 1'b1 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter clockFreq bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter receiveNumber bound to: 100 - type: integer 
2default:defaulth p
x
? 
?
+Unused sequential element %s was removed. 
4326*oasys2"
dataNumber_reg2default:default2i
SC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Receiver.vhd2default:default2
2012default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
resetVar_reg2default:default2i
SC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Receiver.vhd2default:default2
2042default:default8@Z8-6014h px? 
t
+Unused sequential element %s was removed. 
4326*oasys2%
ReceiveBuffer_reg2default:defaultZ8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
UART_Receiver2default:default2
22default:default2
12default:default2i
SC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/UART_Receiver.vhd2default:default2
312default:default8@Z8-256h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tXBuffer[9]2default:default2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
482default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tXBuffer[8]2default:default2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
482default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tXBuffer[7]2default:default2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
482default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tXBuffer[6]2default:default2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
482default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tXBuffer[5]2default:default2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
482default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tXBuffer[4]2default:default2
top_UART2default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
482default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
top_UART2default:default2
32default:default2
12default:default2d
NC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.srcs/sources_1/new/top_UART.vhd2default:default2
452default:default8@Z8-256h px? 
?
%s*synth2?
rFinished Synthesize : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Constraint Validation : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tcsg324-3
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7a100tcsg324-32default:defaultZ21-403h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2$
currentState_reg2default:default2$
UART_Transmitter2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
txState_reg2default:default2
top_UART2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    idle |                               00 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_                startbit |                               01 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_                    data |                               10 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 stopbit |                               11 |                              100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2$
currentState_reg2default:default2

sequential2default:default2$
UART_Transmitter2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    idle |                              001 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                    send |                              010 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                s_finish |                              100 |                               10
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
txState_reg2default:default2
one-hot2default:default2
top_UART2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 4     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 10    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 6     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   8 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   8 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   8 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 7     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 6     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   8 Input    1 Bit        Muxes := 7     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Timing Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
zFinished Technology Mapping : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
tFinished IO Insertion : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Renaming Generated Nets : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    92|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     8|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |   276|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    36|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    10|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    13|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    56|
2default:defaulth px? 
D
%s*synth2,
|9     |FDRE   |   272|
2default:defaulth px? 
D
%s*synth2,
|10    |FDSE   |     1|
2default:defaulth px? 
D
%s*synth2,
|11    |IBUF   |     2|
2default:defaulth px? 
D
%s*synth2,
|12    |OBUF   |    13|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+------------+-----------------+------+
2default:defaulth p
x
? 
[
%s
*synth2C
/|      |Instance    |Module           |Cells |
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+------------+-----------------+------+
2default:defaulth p
x
? 
[
%s
*synth2C
/|1     |top         |                 |   780|
2default:defaulth p
x
? 
[
%s
*synth2C
/|2     |  RX_Module |UART_Receiver    |   370|
2default:defaulth p
x
? 
[
%s
*synth2C
/|3     |  TX_Module |UART_Transmitter |   222|
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+------------+-----------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 11 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Complete : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1251.832 ; gain = 0.000
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0182default:default2
1251.8322default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
922default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1251.8322default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
dd8d1ff02default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272default:default2
122default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:352default:default2
00:00:362default:default2
1251.8322default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2\
HC:/Users/sevin/Desktop/Projects/VHDL/UART/UART.runs/synth_1/top_UART.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2z
fExecuting : report_utilization -file top_UART_utilization_synth.rpt -pb top_UART_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat Feb 12 21:33:57 20222default:defaultZ17-206h px? 


End Record