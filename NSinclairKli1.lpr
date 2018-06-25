program NSinclairKli1;
   uses
      sysutils, crt;
   var
      startDay, numDays, i : integer;
      input : string;
      days : array [1..35] of string;
      intDays : array [1..35] of integer;
begin
   readln(input);
   clrscr;
   numDays := strtoint(input[1] + input[2]);
   startDay := strtoint(input[4]);

   if (numDays = 29) then
   begin
      for i := 1 to 29 do
      begin
         days[i + startDay] := inttostr(i);
         intDays[i + startDay] := i;
      end;
   end
   else if (numDays = 30) then
   begin
      if (startDay = 6) then
      begin
         for i := 0 to 30 do
         begin
             days[i + startDay] := inttostr(i);
             intDays[i + startDay] := i;
         end;
         days[1] := '30';
         intDays[1] := 30
      end
      else
      begin
          for i := 0 to 30 do
          begin
              days[i + startDay] := inttostr(i);
              intDays[i+ startDay] := i;
          end;
      end;
   end
   else if (numDays = 31) then
   begin
      if (startDay = 6) then
      begin
         for i := 0 to 30 do
         begin
             days[i + startDay] := inttostr(i);
             intDays[i + startDay] := i;
         end;
         days[1] := '30';
         intDays[1] := 30;
         days[2] := '31';
         intDays[2] := 31
      end
      else if (startDay = 5) then
      begin
         for i := 0 to 30 do
         begin
             days[i + startDay] := inttostr(i);
             intDays[i + startDay] := i;
         end;
         days[1] := '31';
         intDays[1] := 31
      end
      else
      begin
          for i := 0 to 30 do
          begin
              days[i + startDay] := inttostr(i);
              intDays[i+ startDay] := i;
          end;
      end;
   end;

   for i := 0 to 35 do
   begin
      if (intDays[i] < 1) then
          days[i] := '    '
      else if (intDays[i] <= 9) then
          days[i] := '   ' + days[i]
      else if (intDays[i] >= 9) then
      begin
          days[i] := '  ' + days[i];
      end;
   end;

   writeln(' Sun Mon Tue Wed Thu Fri Sat');
   writeln(days[1], days[2], days[3], days[4], days[5], days[6], days[7]);
   writeln(days[8], days[9], days[10], days[11], days[12], days[13], days[14]);
   writeln(days[15], days[16], days[17], days[18], days[19], days[20], days[21]);
   writeln(days[22], days[23], days[24], days[25], days[26], days[27], days[28]);
   writeln(days[29], days[30], days[31], days[32], days[33], days[34], days[35]);
   readln();
end.
