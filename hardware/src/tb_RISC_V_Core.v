/** @module : tb_RISC_V_Core
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
 *
 */

 module tb_RISC_V_Core(); 
 
reg clock, reset, start; 
reg [19:0] prog_address; 
reg report; // performance reporting
reg [80*8:1] rom_filename;
reg   [31:0] clock_cycles;

// module RISC_V_Core #(parameter CORE = 0, DATA_WIDTH = 32, INDEX_BITS = 6, OFFSET_BITS = 3, ADDRESS_BITS = 20)
RISC_V_Core CORE (
                .clock(clock), 
                .reset(reset), 
                .start(start), 
                .prog_address(prog_address), 
                .report(report)
); 

// Clock generator
always #1 clock = ~clock;

initial begin
  if (!$value$plusargs("ROM_FILE=%s", rom_filename)) begin
    $display("NO ROM_FILE specified. Exiting simulation");
    $finish;
  end
  $readmemh({"../software/applications/binaries/", rom_filename, ".mem"}, CORE.IF.i_mem_interface.RAM.sram);

  clock  = 0;
  reset  = 1;
  report = 0;
  prog_address = 'h0;         
  repeat (1) @ (posedge clock);

  reset = 0;
  start = 1; 
  repeat (1) @ (posedge clock);

  start = 0; 
  repeat (1) @ (posedge clock); 
end

always @(posedge clock) begin
  if (reset) begin
    clock_cycles <= 32'd0;
  end else begin
    clock_cycles <= clock_cycles+1;
  end
end

integer ii;
always @(negedge clock) begin
  //$display("PC is: %0h", CORE.inst_PC);
  if (CORE.inst_PC == 32'h000000b0) begin
    $display("Test Completed after %0d clock cycles", clock_cycles);
    $finish;
  end
end

endmodule
