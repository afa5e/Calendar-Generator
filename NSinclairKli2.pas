program NSinclairKli2;
  uses
    sysutils, crt;
  var
    month, check, input, inputyear, start : string;
    year, daydifference, leap, leapnumber, nummonth, numstart, daysInMonth, i : integer;
    leapState : boolean;
    days : array [1..42] of string;
    integerDays : array [1..42] of integer;

begin
  readln(input);
  clrscr;
  inputyear := input[1] + input[2] + input[3] + input[4]; // Extracts the first 4 digits of the input and sets it as the year
  check := input[6] + input[7]; // Checks if the 6th and 7th digits combined to create a 2 digit number is higher that 9. If the 7th digit is empty the result is a single digit.
  if strtoint(check) < 9 then
     month := input[6]
  else
     month := input[6] + input[7];
  year := strtoint(inputyear);

  if (month = '1') then // converts numerical month to string
  begin
     month := '        January';
     nummonth := 1
  end
  else if (month = '2') then
  begin
     month := '        Febuary';
     nummonth := 2
  end
  else if (month = '3') then
  begin
     month := '         March';
     nummonth := 3
  end
  else if (month = '4') then
  begin
     month := '         April';
     nummonth := 4
  end
  else if (month = '5') then
  begin
     month := '          May';
     nummonth := 5
  end
  else if (month = '6') then
  begin
     month := '         June';
     nummonth := 6
  end
  else if (month = '7') then
  begin
     month := '         July';
     nummonth := 7
  end
  else if (month = '8') then
  begin
     month := '        August';
     nummonth := 8
  end
  else if (month = '9') then
  begin
     month := '       September';
     nummonth := 9
  end
  else if (month = '10') then
  begin
     month := '        October';
     nummonth := 10
  end
  else if (month = '11') then
  begin
     month := '       November';
     nummonth := 11
  end
  else if (month = '12') then
  begin
     month := '       December';
     nummonth := 12
  end;

  leap := year-1968;
  leapnumber := leap div 4;
  daydifference := year - 1970; // offset the starting day of the year by this amount, not accounting for leap years
  daydifference := daydifference + leapnumber; // accounts for leap years
  // Daydifference is how many days to offset the start day of the year from thursday


  if ((year mod 4) = 0) then // Checks if the stated year is a leap year
  begin
     if ((year mod 100) = 0) AND ((year mod 400) <> 0) then
        leapState := false
     else if ((year mod 400) = 0) then
        leapState := true
     else
        leapState := true;
  end;

  if (leapState = false) then // If the year isn't a leap year
  begin
      if nummonth = 1 then
      begin
         daysInMonth := 31
      end
      else if nummonth = 2 then
      begin
         daydifference := daydifference + 31;
         daysInMonth := 28
      end
      else if nummonth = 3 then
      begin
         daydifference := daydifference + 59;
         daysInMonth := 31
      end
      else if nummonth = 4 then
      begin
         daydifference := daydifference + 90;
         daysInMonth := 30
      end
      else if nummonth = 5 then
      begin
         daydifference := daydifference + 120;
         daysInMonth := 31
      end
      else if nummonth = 6 then
      begin
         daydifference := daydifference + 151;
         daysInMonth := 30
      end
      else if nummonth = 7 then
      begin
         daydifference := daydifference + 181;
         daysInMonth := 31
      end
      else if nummonth = 8 then
      begin
         daydifference := daydifference + 212;
         daysInMonth := 31
      end
      else if nummonth = 9 then
      begin
         daydifference := daydifference + 242;
         daysInMonth := 30
      end
      else if nummonth = 10 then
      begin
         daydifference := daydifference + 253;
         daysInMonth := 31
      end
      else if nummonth = 11 then
      begin
         daydifference := daydifference + 283;
         daysInMonth := 30
      end
      else
      begin
         daydifference := daydifference + 313;
         daysInMonth := 31;
      end;
  end
  else //If the year is a leap year
  begin
      if nummonth = 1 then
      begin
         daydifference := daydifference - 1;
         daysInMonth := 31
      end
      else if nummonth = 2 then
      begin
         daydifference := daydifference + 31;
         daysInMonth := 29
      end
      else if nummonth = 3 then
      begin
         daydifference := daydifference + 60;
         daysInMonth := 31
      end
      else if nummonth = 4 then
      begin
         daydifference := daydifference + 91;
         daysInMonth := 30
      end
      else if nummonth = 5 then
      begin
         daydifference := daydifference + 121;
         daysInMonth := 31
      end
      else if nummonth = 6 then
      begin
         daydifference := daydifference + 152;
         daysInMonth := 30
      end
      else if nummonth = 7 then
      begin
         daydifference := daydifference + 182;
         daysInMonth := 31
      end
      else if nummonth = 8 then
      begin
         daydifference := daydifference + 213;
         daysInMonth := 31
      end
      else if nummonth = 9 then
      begin
         daydifference := daydifference + 243;
         daysInMonth := 30
      end
      else if nummonth = 10 then
      begin
         daydifference := daydifference + 254;
         daysInMonth := 31
      end
      else if nummonth = 11 then
      begin
         daydifference := daydifference + 284;
         daysInMonth := 30
      end
      else
      begin
         daydifference := daydifference + 314;
         daysInMonth := 31;
      end;
  end;

  daydifference := daydifference mod 7; //If the remainder is 0 then the first day of the month is a thursday, 1 is Friday ...
  if daydifference = 1 then
  begin
     start := 'Friday';
     numstart := 5
  end
  else if daydifference = 2 then
  begin
     start := 'Saturday';
     numstart := 6
  end
  else if daydifference = 3 then
  begin
     start := 'Sunday';
     numstart := 7
  end
  else if daydifference = 4 then
  begin
     start := 'Monday';
     numstart := 1
  end
  else if daydifference = 5 then
  begin
     start := 'Tuesday';
     numstart := 2
  end
  else if daydifference = 6 then
  begin
     start := 'Wednesday';
     numstart := 3
  end
  else
  begin
     start := 'Thursday';
     numstart := 4;
  end;

  if (daysInMonth = 30) and (numstart > 6) then
  begin
     days[1] := '30';
     integerDays[1] := 30;
     for i := 1 to 29 do
         days[i + 2] := inttostr(i + 2)
  end
  else if (daysInMonth = 31) and (numstart > 5) then
  begin
     days[1] := '30';
     days[2] := '31';
     integerDays[1] := 30;
     integerDays[2] := 31;
     for i := 1 to daysInMonth do
         days[i + 3] := inttostr(i + 3);
         integerDays[i + 2] := i + 2
  end
  else
  begin
     for i := 1 to daysInMonth do
     begin
         days[i + numstart] := inttostr(i);
         integerDays[i + numstart] := i
     end
  end;

  for i := 0 to daysInMonth do
  begin
     if (integerDays[i] < 1) then
         days[i] := '    '
     else if (integerDays[i] <= 9) then
         days[i] := '   ' + days[i]
     else if (integerDays[i] >= 9) then
         days[i] := '  ' + days[i];
  end;

  writeln(month, ' ', year);
  writeln(' Sun Mon Tue Wed Thu Fri Sat');
  writeln(days[1], days[2], days[3], days[4], days[5], days[6], days[7]);
  writeln(days[8], days[9], days[10], days[11], days[12], days[13], days[14]);
  writeln(days[15], days[16], days[17], days[18], days[19], days[20], days[21]);
  writeln(days[22], days[23], days[24], days[25], days[26], days[27], days[28]);
  writeln(days[29], days[30], days[31], days[32], days[33], days[34], days[35]);
  writeln(days[36], days[37], days[38], days[39], days[40], days[41], days[42]);
  readln;
end.
