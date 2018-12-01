program gorn;

var
  gorner_ext, mantisa_ext : extended;
  i, switch, modul_switch : shortint;
  divisor : extended;
  str_to_ext : string;
  power : integer;
  gorner : extended;

begin
  power := 16;
  str_to_ext := 'FFFFFFFFFFFFFFF';

  gorner_ext := 0;
  switch := 0;
  divisor := power;
  mantisa_ext := 0;

  if (str_to_ext[1] = '-') then begin
    modul_switch := -1;
    delete(str_to_ext, 1, 1);
  end else
    modul_switch := 1;

  for i := 1 to length(str_to_ext) do
  begin
    if (str_to_ext[i] = '.') then
      switch := 1
    else if ((ord(str_to_ext[i]) >= 65) and (ord(str_to_ext[i]) <= 70) and (switch = 0)) then
      gorner_ext := gorner_ext * power + ord(str_to_ext[i]) - 55
    else if ((ord(str_to_ext[i]) >= 48) and (ord(str_to_ext[i]) <= 57) and (switch = 0)) then
      gorner_ext := gorner_ext * power + ord(str_to_ext[i]) - 48
    else if ((switch = 1) and (ord(str_to_ext[i]) >= 65) and (ord(str_to_ext[i]) <= 70)) then
    begin
      mantisa_ext := mantisa_ext + (ord(str_to_ext[i]) - 55) / divisor;
      divisor := divisor * power;
    end
    else if ((switch = 1) and (ord(str_to_ext[i]) >= 48) and (ord(str_to_ext[i]) <= 57) ) then
    begin
      mantisa_ext := mantisa_ext + ((ord(str_to_ext[i]) - 48)/ divisor);

      divisor := divisor * power;
    end;
  end;

   writeln(mantisa_ext );
  gorner_ext := (gorner_ext + mantisa_ext) * modul_switch ;

  gorner := gorner_ext;
  writeln(gorner);
  readln();
end.

