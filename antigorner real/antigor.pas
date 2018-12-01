program antigor;

uses crt;

var
  antigorner_str, mantisa_str : string;
  tmp_number, int_copu_number : comp;
  manti_counter : shortint;
  manti_number : extended;
  int_tmp : integer;

  number_to_str : extended;
  power : integer;
  antigorner : string;
begin
  power:= 10;
  number_to_str := 1099509530625;

  if (number_to_str <> 0) then
  begin
    if (number_to_str < 0) then
    begin
      antigorner_str := '-'; // обнуляем строку дял целой части c миусом
      number_to_str := abs(number_to_str);
    end else
      antigorner_str := '';

    int_copu_number :=  trunc(number_to_str); // берем целую часть числа
     writeln(int_copu_number);

    if (int_copu_number <> 0 ) then
    while (int_copu_number > 0) do //целая часть
    begin
      tmp_number := int_copu_number mod power;

      if ((tmp_number >= 0) and (tmp_number <= 9 )) then
        antigorner_str := chr(tmp_number + 48) + antigorner_str
      else
        antigorner_str := chr(tmp_number + 55) + antigorner_str;

      int_copu_number := int_copu_number div power;


    end else
      antigorner_str := '0';


    manti_number := frac(number_to_str);
    if (manti_number <> 0) then
    begin
      mantisa_str := '.'; //для мантисы

      for manti_counter := 1 to 10 do
      begin
        int_tmp :=  trunc(manti_number * power);
        if (int_tmp < 10) then
          mantisa_str := mantisa_str + chr(int_tmp + 48)
        else
          mantisa_str := mantisa_str + chr(int_tmp + 55);

        manti_number := frac(manti_number * power);
      end;

      antigorner := antigorner_str + mantisa_str;
    end else
      antigorner := antigorner_str;

    end else
      antigorner := '0';

    writeln(antigorner);
    readkey();
end.

