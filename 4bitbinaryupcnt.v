module tff (output reg q, input t,clk,rst);
always @ (posedge clk)
begin
 if(rst)
	q<=1'b0;
end
always @ (posedge clk )
begin
 if(~rst)
  begin
      if(t)
	 q<=~q;
      else
	 q<=q;
   end
end
endmodule
module binary_4bit_upcnt(output [3:0]q,input clk,rst);
tff tff0 (q[0],1'b1,clk,rst);
tff tff1 (q[1],1'b1,~q[0],rst);
tff tff2 (q[2],1'b1,~q[1],rst);
tff tff3 (q[3],1'b1,~q[2],rst);
endmodule
