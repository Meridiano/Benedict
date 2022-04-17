program Benedict;

const FFName = '01_01.txt';
const FSName = '01_02.txt';
const SFName = '02_01.txt';
const SSName = '02_02.txt';
const OutputName = 'BenedictOutput.txt';
var FFFile, FSFile, SFFile, SSFile, OutputFile: TextFile;

begin
  var NMax, wNum: integer;
  writeln('How many? With numbers (0/1)?');
  readln(NMax, wNum);
  if (NMax < 1) or ((wNum <> 0) and (wNum <> 1)) then begin
    write('Error!');
    readln;
    exit;
  end;
  
  var FFArray: array[0..999] of string;
  AssignFile(FFFile, FFName);
  reset(FFFile);
  var FFCount: integer = 0;
  while not eof(FFFile) do begin
    readln(FFFile, FFArray[FFCount]);
    FFCount := FFCount + 1;
  end;
  CloseFile(FFFile);
  
  var FSArray: array[0..999] of string;
  AssignFile(FSFile, FSName);
  reset(FSFile);
  var FSCount: integer = 0;
  while not eof(FSFile) do begin
    readln(FSFile, FSArray[FSCount]);
    FSCount := FSCount + 1;
  end;
  CloseFile(FSFile);
  
  var SFArray: array[0..999] of string;
  AssignFile(SFFile, SFName);
  reset(SFFile);
  var SFCount: integer = 0;
  while not eof(SFFile) do begin
    readln(SFFile, SFArray[SFCount]);
    SFCount := SFCount + 1;
  end;
  CloseFile(SFFile);
  
  var SSArray: array[0..999] of string;
  AssignFile(SSFile, SSName);
  reset(SSFile);
  var SSCount: integer = 0;
  while not eof(SSFile) do begin
    readln(SSFile, SSArray[SSCount]);
    SSCount := SSCount + 1;
  end;
  CloseFile(SSFile);
  
  AssignFile(OutputFile, OutputName);
  rewrite(OutputFile);
  
  var Temp: integer;
  var sNMax: string;
  var sNMaxLength: integer;
  var sN: string;
  var sNLength: integer;
  str(NMax, sNMax);
  sNMaxLength := sNMax.Length;
  for var N := 1 to NMax do begin
    if (wNum = 1) then begin
      str(N, sN);
      sNLength := sN.Length;
      while sNLength < sNMaxLength do begin
        sN := '0' + sN;
        sNLength := sNLength + 1;
      end;
      write(OutputFile, sN, ') ');
    end;
    
    Temp := random(FFCount);
    write(OutputFile, FFArray[Temp]);
    
    Temp := random(FSCount);
    write(OutputFile, FSArray[Temp], ' ');
    
    Temp := random(SFCount);
    write(OutputFile, SFArray[Temp]);
    
    Temp := random(SSCount);
    writeln(OutputFile, SSArray[Temp]);
  end;
  
  CloseFile(OutputFile);
  write('Done!');
  readln;
end.