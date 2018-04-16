module tb_directMapped():
  reg             clock;
  reg             reset;
  reg      [31:0] addrFromProc;
  reg             enableFromProc;
  reg             writeFromProc;
  reg      [31:0] dataFromProc;
  wire     [31:0] dataToProc;
  wire            readyToProc;



  module directMappedL1  DUT (
  .clock(clock), 
  .reset(reset), 
  .addrFromProc(addrFromProc),
  .enableFromProc(enableFromProc),
  .writeFromProc(writeFromProc),
  .dataFromProc(dataFromProc),   
  .dataToProc(dataToProc),    
  .readyToProc(readyToProc),
  .addrToLl(addrToLl),    
  .enableToLl(enableToLl),  
  .writeToLl(writeToLl),   
  .dataToLl(dataToLl),    
  .dataFromLl(dataFromLl),  
  .readyFromLl(readyFromLl)  
  );

always #1 clock= ~clock;

initial
    begin
        clock = 0;
        reset = 0;
        enableFromProc = 0;
        writeFromProc = 0;
    end

$display (" --- Start --- ");
  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 7345a392;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 989aa4e6 ;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h bf42dceb;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 77c95820;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 1dc64e96;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 1dc64e96;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 9c5957fc;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 2550b24f;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 49181e26;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h d8acdeb2;
  enableFromProc = 1;
  writeFromProc = 1;
  dataFromProc = 0;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 2550b24f;
  enableFromProc = 1;
  writeFromProc = 0;
  dataFromProc = 1;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h 49181e26;
  enableFromProc = 1;
  writeFromProc = 0;
  dataFromProc = 1;

  repeat (1) @ (posedge clk);

  reset = 0 ;
  addrFromProc = 32'h d8acdeb2;
  enableFromProc = 1;
  writeFromProc = 0;
  dataFromProc = 1;



endmodule

  



