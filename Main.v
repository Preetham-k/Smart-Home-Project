//Top module definition
module main(rst, clk, ennd, ennl, ennf, ennt, doin, loin, lcin, foin, watlevel, lowll, highll, doout, loout, lcout, foout, moton);
input rst, clk, ennd, ennl, ennf, ennt, doin, loin, lcin, foin, watlevel, lowll, highll;
output doout, loout, lcout, foout, moton;
//Module instantiation
door door1(rst, clk, ennd, doin, doout);
light light1(rst, clk, ennl, loin, lcin, loout, lcout);
fan fan1(rst, clk, ennf, foin, foout);
tank tank1(rst, clk, ennt, watlevel, lowll, highll, moton);
endmodule
// Submodule definition
module door(rstd, clkd, ed, din, dout);
input rstd, clkd, ed, din;
output dout;
reg dout;
always@(posedge clkd)
begin
if(rstd==1)
begin
if(ed==1 && din==1)
dout=1'b1;
else
dout=1'b0;
end
else
dout=1'b0;
end
endmodule
// Submodule definition
module fan(rstf,clkf,ef,fin,fout);
input rstf,clkf,ef,fin;
output fout;
reg fout;
always@(posedge clkf)
begin
if(rstf==1)
begin
if(ef==1 && fin==1)
fout=1'b1;
else
fout=1'b0;
end
else
fout=1'b0;
end
endmodule
// Submodule definition
module light(rstl, clkl, el, lin, lc, lout, lco);
input rstl, clkl, el, lin, lc;
output lout, lco;
reg lout, lco;
always@(posedge clkl)
begin
if(rstl==1)
begin
if(el==1)
begin
if(lc==1)
lco=1'b1;
assign lout=lin?1'b1:1'b0;
end
else
begin
lco=1'b0;
assign lout=lin?1'b1:1'b0;
end
end
else
begin
lco=1'b0;
lout=1'b0;
end
end
endmodule
// Submodule definition
module tank(rstt, clkt, et, watlev, lowl, highl, mon);
input rstt, clkt, et, watlev, lowl, highl;
output mon;
reg mon;
always@(posedge clkt)
begin
if(rstt==1)
	begin
	if(et==1)
	begin
		assign mon=(watlev<=lowl)?1'b1:1'b0;
		assign mon=(watlev>=highl)?1'b0:1'b1;
	end
	else
	mon=1'b0;
	end
else
mon=1'b0;
end
endmodule
