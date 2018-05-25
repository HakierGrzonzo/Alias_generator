uses crt,sysutils;

type
	wordList = array of string;
	numList = array of integer;
var 
	i,noofwords:integer;
	words1,words2:wordList;
	nums:numlist;

procedure randomList(var list:numList);
	var
		flag0:boolean;
		i,i2,i3:integer;
	begin
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
	
function Readwords:wordList;
	var
		F:textfile;
		i:integer;
		str:string;
	begin
		assign(f,'Lista.txt');
		reset(f);
		i:=1;
		setlength(readwords,i);
		while not eof(f) do
			begin
				readln(f,str);
				readwords[i-1]:=str;
				i+=1;
				setlength(readwords,i);
			end;
		close(f);
	end;
	
procedure writeWordstofile(wordsA:wordlist);
	var
		i,z:integer;
		f:textfile;
	begin
		assign(f,'s³owa.csv');
		rewrite(f);
		z:=0;
		for i:=0 to length(wordsA) do
			begin
				if z=noofwords then
					begin
						z:=0;
						writeln(f,';');
					end;
				z:=z+1;
				write(f,inttostr(z));
				write(f,'.');
				write(f,wordsA[i]);
				writeln(f,';');
			end;
		close(f);
	end;
	
begin
	writeln('ile slow na grupe?');
	readln(noofwords);
	words1:=readwords;
	setlength(nums,length(words1));
	setlength(words2,length(words1));
	randomlist(nums);
	for i:=0 to length(words1) do words2[i]:=words1[nums[i]];
	writewordstofile(words2);
end.