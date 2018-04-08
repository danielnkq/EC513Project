/** @module : BSRAM
 *  @author : Adaptive & Secure Computing Systems (ASCS) Laboratory
 
 *  Copyright (c) 2018 BRISC-V (ASCS/ECE/BU)
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.

 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
 
//Same cycle read memory access 

 (* ram_style = "block" *)
module BSRAM #(parameter CORE = 0, DATA_WIDTH = 32, ADDR_WIDTH = 8) (
        clock,
        reset,
        readEnable,
        readAddress,
        readData,
        writeEnable,
        writeAddress,
        writeData, 
        report
); 

localparam MEM_DEPTH = 1 << ADDR_WIDTH;

input clock; 
input reset; 
input readEnable;
input [ADDR_WIDTH-1:0]   readAddress;
output [DATA_WIDTH-1:0]  readData;
input writeEnable;
input [ADDR_WIDTH-1:0]   writeAddress;
input [DATA_WIDTH-1:0]   writeData;
input report; 
 
wire [DATA_WIDTH-1:0]     readData;
reg  [DATA_WIDTH-1:0]     sram [0:MEM_DEPTH-1];
 
//--------------Code Starts Here------------------


sramdp32x4096 u_sramdp32x4096_lo (
  .CENYA(),
  .WENYA(),
  .AYA(),
  .CENYB(),
  .WENYB(),
  .AYB(),
  .QA(readData[15:0]),
  .QB(),
  .SOA(),
  .SOB(),
  .CLKA(clock),
  .CENA(readEnable),
  .WENA(readEnable),
  .AA(readAddress),
  .DA(16'd0),
  .CLKB(clock),
  .CENB(~writeEnable),
  .WENB(~writeEnable),
  .AB(writeAddress),
  .DB(writeData[15:0]),
  .EMAA(3'd0),
  .EMAWA(2'd0),
  .EMAB(3'd0),
  .EMAWB(2'd0),
  .TENA(1'b1),
  .TCENA(1'b1),
  .TWENA(1'b1),
  .TAA(12'd0),
  .TDA(16'd0),
  .TENB(1'b1),
  .TCENB(1'b1),
  .TWENB(1'b1),
  .TAB(12'd0),
  .TDB(16'd0),
  .RET1N(1'b1),
  .SIA(2'b00),
  .SEA(1'b0),
  .DFTRAMBYP(1'b0),
  .SIB(2'b00),
  .SEB(1'b0),
  .COLLDISN(1'b1)
);

sramdp32x4096 u_sramdp32x4096_hi (
  .CENYA(),
  .WENYA(),
  .AYA(),
  .CENYB(),
  .WENYB(),
  .AYB(),
  .QA(readData[31:16]),
  .QB(),
  .SOA(),
  .SOB(),
  .CLKA(clock),
  .CENA(readEnable),
  .WENA(readEnable),
  .AA(readAddress),
  .DA(16'd0),
  .CLKB(clock),
  .CENB(~writeEnable),
  .WENB(~writeEnable),
  .AB(writeAddress),
  .DB(writeData[31:16]),
  .EMAA(3'd0),
  .EMAWA(2'd0),
  .EMAB(3'd0),
  .EMAWB(2'd0),
  .TENA(1'b1),
  .TCENA(1'b1),
  .TWENA(1'b1),
  .TAA(12'd0),
  .TDA(16'd0),
  .TENB(1'b1),
  .TCENB(1'b1),
  .TWENB(1'b1),
  .TAB(12'd0),
  .TDB(16'd0),
  .RET1N(1'b1),
  .SIA(2'b00),
  .SEA(1'b0),
  .DFTRAMBYP(1'b0),
  .SIB(2'b00),
  .SEB(1'b0),
  .COLLDISN(1'b1)
);

endmodule

