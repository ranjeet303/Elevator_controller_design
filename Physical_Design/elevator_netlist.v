/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12-SP5
// Date      : Thu Mar 27 18:08:29 2025
/////////////////////////////////////////////////////////////


module elevator ( Request_Floor, In_Current_Floor, Over_Weight, Door_Open, 
        Floor_Sensor, clk, reset, Out_Current_Floor, Direction, Complete, 
        Door_Alert, Weight_Alert );
  input [3:0] Request_Floor;
  input [3:0] In_Current_Floor;
  output [3:0] Out_Current_Floor;
  input Over_Weight, Door_Open, Floor_Sensor, clk, reset;
  output Direction, Complete, Door_Alert, Weight_Alert;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125;
  wire   [7:0] door_timer;

  DFFARX1_RVT Door_Alert_reg ( .D(n66), .CLK(clk), .RSTB(n124), .Q(Door_Alert)
         );
  DFFARX1_RVT Weight_Alert_reg ( .D(Over_Weight), .CLK(clk), .RSTB(n124), .Q(
        Weight_Alert) );
  DFFARX1_RVT \door_timer_reg[7]  ( .D(n65), .CLK(clk), .RSTB(n124), .Q(
        door_timer[7]) );
  DFFARX1_RVT \door_timer_reg[6]  ( .D(n64), .CLK(clk), .RSTB(n124), .Q(
        door_timer[6]), .QN(n120) );
  DFFARX1_RVT \door_timer_reg[5]  ( .D(n63), .CLK(clk), .RSTB(n125), .Q(
        door_timer[5]), .QN(n114) );
  DFFARX1_RVT \door_timer_reg[4]  ( .D(n62), .CLK(clk), .RSTB(n124), .Q(
        door_timer[4]), .QN(n117) );
  DFFARX1_RVT \door_timer_reg[3]  ( .D(n61), .CLK(clk), .RSTB(n125), .Q(
        door_timer[3]), .QN(n115) );
  DFFARX1_RVT \door_timer_reg[2]  ( .D(n60), .CLK(clk), .RSTB(n125), .Q(
        door_timer[2]), .QN(n122) );
  DFFARX1_RVT \door_timer_reg[1]  ( .D(n59), .CLK(clk), .RSTB(n125), .Q(
        door_timer[1]), .QN(n123) );
  DFFARX1_RVT \door_timer_reg[0]  ( .D(n67), .CLK(clk), .RSTB(n124), .Q(
        door_timer[0]), .QN(n121) );
  DFFARX1_RVT Direction_reg ( .D(n54), .CLK(clk), .RSTB(n125), .Q(Direction)
         );
  DFFASRX1_RVT \Out_Current_Floor_reg[0]  ( .D(n58), .CLK(clk), .RSTB(n51), 
        .SETB(n52), .Q(Out_Current_Floor[0]), .QN(n119) );
  DFFASRX1_RVT \Out_Current_Floor_reg[3]  ( .D(n55), .CLK(clk), .RSTB(n49), 
        .SETB(n50), .Q(Out_Current_Floor[3]) );
  DFFASRX1_RVT \Out_Current_Floor_reg[1]  ( .D(n57), .CLK(clk), .RSTB(n45), 
        .SETB(n46), .Q(Out_Current_Floor[1]), .QN(n118) );
  DFFASRX1_RVT \Out_Current_Floor_reg[2]  ( .D(n56), .CLK(clk), .RSTB(n47), 
        .SETB(n48), .Q(Out_Current_Floor[2]), .QN(n116) );
  DFFASX1_RVT Complete_reg ( .D(n53), .CLK(clk), .SETB(n124), .Q(Complete) );
  INVX0_RVT U70 ( .A(reset), .Y(n124) );
  INVX0_RVT U71 ( .A(reset), .Y(n125) );
  OR2X1_RVT U72 ( .A1(In_Current_Floor[3]), .A2(n125), .Y(n49) );
  OR2X1_RVT U73 ( .A1(In_Current_Floor[1]), .A2(n125), .Y(n45) );
  OR2X1_RVT U74 ( .A1(In_Current_Floor[0]), .A2(n125), .Y(n51) );
  OR2X1_RVT U75 ( .A1(In_Current_Floor[2]), .A2(n125), .Y(n47) );
  NAND2X0_RVT U76 ( .A1(reset), .A2(In_Current_Floor[0]), .Y(n52) );
  NAND2X0_RVT U77 ( .A1(reset), .A2(In_Current_Floor[3]), .Y(n50) );
  NAND2X0_RVT U78 ( .A1(reset), .A2(In_Current_Floor[2]), .Y(n48) );
  NAND2X0_RVT U79 ( .A1(reset), .A2(In_Current_Floor[1]), .Y(n46) );
  NAND3X0_RVT U80 ( .A1(door_timer[1]), .A2(door_timer[0]), .A3(door_timer[2]), 
        .Y(n78) );
  INVX0_RVT U81 ( .A(n78), .Y(n82) );
  NAND3X0_RVT U82 ( .A1(n82), .A2(door_timer[4]), .A3(door_timer[3]), .Y(n72)
         );
  INVX0_RVT U83 ( .A(n72), .Y(n74) );
  AND2X1_RVT U84 ( .A1(door_timer[5]), .A2(n74), .Y(n68) );
  AND4X1_RVT U85 ( .A1(door_timer[6]), .A2(Door_Open), .A3(door_timer[7]), 
        .A4(n68), .Y(n77) );
  AO21X1_RVT U86 ( .A1(Door_Open), .A2(n121), .A3(n77), .Y(n67) );
  AO221X1_RVT U88 ( .A1(1'b1), .A2(n114), .A3(n122), .A4(n115), .A5(n117), .Y(
        n70) );
  NAND2X0_RVT U89 ( .A1(n120), .A2(n70), .Y(n71) );
  OA221X1_RVT U90 ( .A1(Door_Alert), .A2(door_timer[7]), .A3(Door_Alert), .A4(
        n71), .A5(Door_Open), .Y(n66) );
  AND3X1_RVT U91 ( .A1(Door_Open), .A2(door_timer[5]), .A3(n74), .Y(n73) );
  AO22X1_RVT U92 ( .A1(door_timer[6]), .A2(n73), .A3(Door_Open), .A4(
        door_timer[7]), .Y(n65) );
  AND2X1_RVT U93 ( .A1(Door_Open), .A2(n114), .Y(n75) );
  AO21X1_RVT U94 ( .A1(Door_Open), .A2(n72), .A3(n77), .Y(n76) );
  AO222X1_RVT U95 ( .A1(door_timer[6]), .A2(n75), .A3(door_timer[6]), .A4(n76), 
        .A5(n73), .A6(n120), .Y(n64) );
  AO22X1_RVT U96 ( .A1(door_timer[5]), .A2(n76), .A3(n75), .A4(n74), .Y(n63)
         );
  AND2X1_RVT U97 ( .A1(Door_Open), .A2(n115), .Y(n81) );
  AO21X1_RVT U98 ( .A1(Door_Open), .A2(n78), .A3(n77), .Y(n80) );
  AND3X1_RVT U99 ( .A1(Door_Open), .A2(n82), .A3(door_timer[3]), .Y(n79) );
  AO222X1_RVT U100 ( .A1(door_timer[4]), .A2(n81), .A3(door_timer[4]), .A4(n80), .A5(n79), .A6(n117), .Y(n62) );
  AO22X1_RVT U101 ( .A1(n82), .A2(n81), .A3(door_timer[3]), .A4(n80), .Y(n61)
         );
  AND2X1_RVT U102 ( .A1(Door_Open), .A2(n123), .Y(n84) );
  AND3X1_RVT U103 ( .A1(Door_Open), .A2(door_timer[1]), .A3(door_timer[0]), 
        .Y(n83) );
  AO222X1_RVT U104 ( .A1(door_timer[2]), .A2(n84), .A3(door_timer[2]), .A4(n67), .A5(n83), .A6(n122), .Y(n60) );
  AO22X1_RVT U105 ( .A1(door_timer[1]), .A2(n67), .A3(door_timer[0]), .A4(n84), 
        .Y(n59) );
  INVX0_RVT U106 ( .A(Request_Floor[3]), .Y(n89) );
  OR2X1_RVT U107 ( .A1(n89), .A2(Out_Current_Floor[3]), .Y(n91) );
  OA22X1_RVT U108 ( .A1(Request_Floor[2]), .A2(n116), .A3(Request_Floor[1]), 
        .A4(n118), .Y(n90) );
  NAND3X0_RVT U109 ( .A1(n90), .A2(Request_Floor[0]), .A3(n119), .Y(n88) );
  OR2X1_RVT U110 ( .A1(n116), .A2(Request_Floor[2]), .Y(n86) );
  AO22X1_RVT U111 ( .A1(Request_Floor[1]), .A2(n118), .A3(Request_Floor[2]), 
        .A4(n116), .Y(n85) );
  NAND2X0_RVT U112 ( .A1(n86), .A2(n85), .Y(n87) );
  AO22X1_RVT U113 ( .A1(Out_Current_Floor[3]), .A2(n89), .A3(n88), .A4(n87), 
        .Y(n102) );
  NAND2X0_RVT U114 ( .A1(n91), .A2(n102), .Y(n109) );
  AND2X1_RVT U115 ( .A1(Out_Current_Floor[3]), .A2(n89), .Y(n111) );
  NAND2X0_RVT U116 ( .A1(Request_Floor[2]), .A2(n116), .Y(n92) );
  OAI21X1_RVT U117 ( .A1(Request_Floor[0]), .A2(n119), .A3(n90), .Y(n110) );
  OA221X1_RVT U118 ( .A1(n111), .A2(n92), .A3(n111), .A4(n110), .A5(n91), .Y(
        n106) );
  OR3X1_RVT U119 ( .A1(Complete), .A2(Weight_Alert), .A3(Door_Alert), .Y(n108)
         );
  INVX0_RVT U120 ( .A(n108), .Y(n112) );
  AND2X1_RVT U121 ( .A1(n112), .A2(Floor_Sensor), .Y(n93) );
  OA21X1_RVT U122 ( .A1(n109), .A2(n106), .A3(n93), .Y(n96) );
  INVX0_RVT U123 ( .A(n96), .Y(n94) );
  AO22X1_RVT U124 ( .A1(Out_Current_Floor[0]), .A2(n94), .A3(n119), .A4(n96), 
        .Y(n58) );
  AO221X1_RVT U125 ( .A1(Out_Current_Floor[0]), .A2(n106), .A3(n119), .A4(n109), .A5(n94), .Y(n101) );
  AND2X1_RVT U126 ( .A1(Out_Current_Floor[0]), .A2(n109), .Y(n100) );
  AND2X1_RVT U127 ( .A1(n106), .A2(n119), .Y(n97) );
  OA21X1_RVT U128 ( .A1(n100), .A2(n97), .A3(n96), .Y(n95) );
  AO22X1_RVT U129 ( .A1(Out_Current_Floor[1]), .A2(n101), .A3(n118), .A4(n95), 
        .Y(n57) );
  OA221X1_RVT U130 ( .A1(Out_Current_Floor[1]), .A2(n97), .A3(n118), .A4(n100), 
        .A5(n96), .Y(n98) );
  INVX0_RVT U131 ( .A(n98), .Y(n99) );
  AO22X1_RVT U132 ( .A1(Out_Current_Floor[2]), .A2(n99), .A3(n116), .A4(n98), 
        .Y(n56) );
  AND4X1_RVT U133 ( .A1(Out_Current_Floor[1]), .A2(n112), .A3(Floor_Sensor), 
        .A4(n100), .Y(n105) );
  NOR2X0_RVT U134 ( .A1(Out_Current_Floor[1]), .A2(n101), .Y(n103) );
  NAND3X0_RVT U135 ( .A1(n103), .A2(n116), .A3(n102), .Y(n104) );
  AO22X1_RVT U136 ( .A1(Out_Current_Floor[2]), .A2(n105), .A3(
        Out_Current_Floor[3]), .A4(n104), .Y(n55) );
  INVX0_RVT U137 ( .A(n106), .Y(n107) );
  AO222X1_RVT U138 ( .A1(Direction), .A2(n108), .A3(Direction), .A4(n107), 
        .A5(n112), .A6(n109), .Y(n54) );
  NOR3X0_RVT U139 ( .A1(n111), .A2(n110), .A3(n109), .Y(n113) );
  OA21X1_RVT U140 ( .A1(Over_Weight), .A2(n113), .A3(n112), .Y(n53) );
endmodule

