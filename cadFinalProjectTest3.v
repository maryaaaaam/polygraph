`timescale 1ns / 1ps
module detectorTest3;

reg clk;
reg[9:0] bloodP;
reg[9:0] breathR;
reg[9:0] heartB;
reg[9:0] age;
wire	 alarm;
wire	 BP;
wire	 BR;
wire	 HB;

integer               data_file    ; // file handler
integer               scan_file    ; // file handler
integer		      captured_data;

detector m(clk,bloodP,breathR,heartB,age,alarm,BP,BR,HB);

`define NULL 0    

initial begin
  clk = 1;
  data_file = $fopen("C:/Users/asus/Desktop/inputs/input3.txt", "r");
  if (data_file == `NULL) begin
    $display("data_file handle was NULL");
    $finish;
  end
  //alarm <= 0;
  //HB <= 0;
  //BR <= 0;
  //BP <= 0;
  bloodP = 0;
  breathR = 0;
  heartB = 0;
  scan_file = $fscanf(data_file, "%h\n", captured_data);
  age = captured_data;
  

end

always @(posedge clk) begin
  #1 scan_file = $fscanf(data_file, "%d\n", captured_data); 
  if (!$feof(data_file)) begin
		bloodP = captured_data;
  end

  #1 scan_file = $fscanf(data_file, "%d\n", captured_data); 
  if (!$feof(data_file)) begin
		breathR = captured_data;
  end

  #1 scan_file = $fscanf(data_file, "%d\n", captured_data); 
  if (!$feof(data_file)) begin
		heartB = captured_data;
  end

end

always #10 clk=!clk;

endmodule


