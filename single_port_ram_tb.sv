
// Single Port RAM testbench

module single_port_ram_tb;
  reg [7:0] data; //input data
  reg [5:0] addr; //address
  reg we; //write enable
  reg clk; //clk
  wire [7:0] q; //output data 	
  
  single_port_ram spr1(
    .data(data),
    .addr(addr),
    .we(we),
    .clk(clk),
    .q(q)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, single_port_ram_tb);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      data = 8'h01;
      addr = 5'd0;
      we = 1'b1;
      #10;
           
	  data = 8'h02;
      addr = 5'd1;     
      #10;
      
      data = 8'h03;
      addr = 5'd2;     
      #10;
      
      addr = 5'd0;
      we = 1'b0;
      #10;
      
      addr = 5'd1;
      #10;
      
      addr = 5'd2;
      #10;
      
      data = 8'h04;
      addr = 5'd1;
      we = 1'b1;
      #10;
      
      addr = 5'd1;
      we = 1'b0;
      #10;
      
      addr = 5'd3;
      #10;
          end
  
  initial
    #90 $stop;
  
endmodule