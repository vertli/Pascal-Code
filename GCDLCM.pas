{
  GCD and LCM Calculator (verison 1.0)
 
  Created by Calvin (Vert) Li in June 2016.

  This source code file which is not perfect so far,
  can be modified and rebuilt freely,
  or translate it to another programming language.
  But please keep this section when you want to spread a new vision.
  Thanks.
  
}

program GCDLCM;
uses Crt;

var
  x, y, temp : integer;


{
  Calculate gcd(x, y).
  pre: integer x, integer y
  post: integer gcd(x, y) has been returned.
}  
function GCD (x, y : integer) : integer;
begin
  if (y = 0) then
  begin
    GCD := x;
  end else
  begin
    GCD := GCD (y, x mod y);
  end;
end;


{
  Calculate lcm(x, y).
  pre: integer x, integer y
  post: integer lcm(x, y) has been returned.
} 
function LCM (x,y : integer) :integer;
begin
  LCM := (x * y) div GCD (x, y);
end;


{ main program }
begin
  writeln ('GCD and LCM Calculator');
  writeln;
  write('Please enter the first number: ');
  readln(x);
  write('Please enter the second number: ');
  readln(y);
  
  { make sure x >= y }
  if (x < y) then
  begin
    temp := x;
	x := y;
	y := temp;
  end;

  { displays the GCD and LCM }
  writeln ('The GCD is ', GCD (x,y));
  writeln ('The LCM is ', LCM (x,y));
  
  writeln ('Press any key to end this program.');
  ReadKey;
  
end.