unit RandomList;

Interface

type
	Cardlist = array of integer;

procedure clrlist(var list:cardlist);	
	
procedure orderedList(var list:cardlist);
	
procedure randomList(var list:cardlist);

implementation

procedure clrlist(var list:cardlist);
	var
		i:integer;
	begin
		for i:=1 to length(list) do list[i]:=0;
	end;
	
procedure orderedList(var list:cardlist);
	var 
		i:integer;
	begin
		for i:=1 to length(list) do list[i]:=i;
	end;

procedure randomList(var list:cardlist);
	var
		flag0:boolean;
		i,i2,i3:integer;
	begin
		clrlist(list);
		for i:=1 to length(list) do
			begin
				flag0:=false;
				while not flag0 do
					begin 
						flag0:=true;
						i2:=random(length(list))+1;
						for i3:=1 to length(list) do if i2=list[i3] then flag0:=false;
					end;
				list[i]:=i2;
			end;
	end;
end.