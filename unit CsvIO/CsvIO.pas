unit CsvIO;

uses sysutils;

Interface

	var
		useComma:boolean;	
		
	type	
		Tcords = record
			x,y:longint;
		end;
		
		CsvFile = object
			public
				procedure init(name:string);
				function maxX:longint;
				function maxY:longint;
				procedure write(A:string;pos:Tcords);
				procedure write(A:real;pos:Tcords);
				procedure write(A:longint;pos:Tcords);
				function read:(pos:tcords)string;
				function read:(pos:tcords)real;
				function read:(pos:tcords)longint;
				filename:string;
			private
				f:textfile;
				procedure skipString(var i:longint;str:string);
				function readString(xpos:longint):string;
		end;
		
implementation

	function comma:char;
		begin
			if usecomma then comma:=',' else comma:=';';
		end;

	procedure CsvFile.skipstring(var i:longint;str:string);
		begin
			if str[i]='"' then
				begin
					i+=1;
					while not str[i]='"' do i+=1;
				end;
		end;
	
	function CsVFile.readString(xpos:longint):string;
	
	procedure CsvFile.init(name:string);
		begin
			filename:=name;
			assign(f,name);
			pos.x:=1;
			pos.y:=1;
		end;

	function CsvFile.maxX:longint;
		var 
			x,i:longint;
			str:string;
		begin
			x:=0;
			reset(f);
			read(f,str);
			for i:=0 to length(str) do
				begin
					skipstring(i,str);
					if str[i]=comma then x+=1;
				end;
			maxX:=x;
			close(f);
		end;

	function CsvFile.maxY:longint;
		var
			y:longint;
		begin
			reset(f);
			while not eof(f) do
				begin
					y+=1;
					readln;
				end;
			maxY:=y;
			close(f);
		end;			
		
	procedure setX(A:longint);
	procedure setY(A:longint);
	procedure write(A:string);
	procedure write(A:real);
	procedure write(A:longint);
	function read:string;
	function read:real;
	function read:longint;
		
initialization

	begin
		useComma:=true;
	end;
	
end.