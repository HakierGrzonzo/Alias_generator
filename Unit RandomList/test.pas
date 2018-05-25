uses randomlist,crt;

var
	proszedzialaj:cardlist;
	i:integer;
	
begin
	setlength(proszedzialaj,40);
	randomize;
	randomlist.randomlist(proszedzialaj);
	for i:=1 to length(proszedzialaj) do
		begin
			writeln(proszedzialaj[i]);
			delay(300);
		end;
	readln;
end.