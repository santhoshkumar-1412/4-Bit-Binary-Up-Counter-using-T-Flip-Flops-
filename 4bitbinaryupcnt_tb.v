module binary_4bit_upcnt_tb;
wire [3:0]q;
reg clk,rst;
binary_4bit_upcnt dut (.q(q),.clk(clk),.rst(rst));
initial 
begin
clk=0;
rst=1;
#10 rst=0;
#200 $finish;
end
always #5 clk=~clk;
initial
begin
    $monitor("Time=%0t Reset=%b Count=%b(%d)",$time,rst,q,q);
     $dumpfile("4bitbinaryupcnt.vcd");
    $dumpvars(0,binary_4bit_upcnt_tb);
end 
endmodule
