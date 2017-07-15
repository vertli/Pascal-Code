{
  Pascal Game - Get It At One (verison 1.0)
 
  Created by Calvin (Vert) Li in August 2014.

  This source code file which is not perfect so far,
  can be modified and rebuilt freely,
  or translate it to another programming language.
  But please keep this section when you want to spread a new vision.
  Thanks.
  
  Note: It must not be a good idea to use this as a Pascal paradigm.
}

program GetItAtOne;      
uses Crt;


var
  GameStart : Boolean;                
  guessCorrect : Boolean;             
  menu_num : integer;                   
  ch : char;                          
  answer : integer;
  max_num, min_num : integer;
  guess_num : integer;
  timeCount : integer;


{ Initialize all the variables... }
procedure initialize;
begin
  min_num := 1;
  max_num := 100;
  guess_num := 0;
  timeCount := 0;
  answer := random(98)+2; { 2 <= answer <= 99 }
  guessCorrect := false;
end;


{ Check the guess number is correct or not... }
procedure guessCheck;
begin
  repeat
    { invalid input }
    if (guess_num >= max_num) or (guess_num <= min_num)
      then begin
	         writeln();
	  	     writeln(' Input error. Please enter again.');
		     writeln (' ', min_num, ' to ', max_num);
             write (' Please enter the number which you guess: ');
             readln(guess_num);
	       end;
    until (guess_num < max_num) and (guess_num > min_num);
	{ valid input but the guess is too big }
	if (guess_num > answer) 
	  then begin
	         timeCount := timeCount + 1;
		     writeln(' Your answer is bigger.');
		     max_num := guess_num;
			 guessCorrect := false;
	       end;
	{ valid input but the guess is too small } 
    if (guess_num < answer) 
	  then begin
	         timeCount := timeCount + 1;
		     writeln(' Your answer is smaller');
		     min_num := guess_num;
			 guessCorrect := false;
	       end;
	{ valid input and the guess is correct }	   
    if (guess_num = answer) 
	  then begin
	         timeCount := timeCount + 1;
		     guessCorrect := true;
	       end;    
end;


{ Game starts... }
procedure game;
begin
  ClrScr;
  randomize;  { initialize random }
  initialize;
  while (guessCorrect = false) do
    begin
	  writeln();
      writeln (' ', min_num, ' to ', max_num);
      write (' Please enter the number which you guess: ');
      readln(guess_num);
      guessCheck;
    end;
end;


{ When the player wins... }
procedure winGame;
begin
  writeln();
  writeln(' Congratulation! You are correct.');
  writeln(' The answer is ', answer, '.');
  writeln(' You used ',timeCount, ' to guess the answer');
  writeln();
  write(' Do you want to play again? (Y/N)  ');
  readln(ch);
  { ask player wants to play again or not }  
  while (ch <> 'Y') and (ch <> 'y') and (ch <> 'N') and (ch <> 'n') do
    begin
	  writeln();
	  writeln(' Input error. Please enter again.');
	  write(' Do you want to play again? (Y/N)  ');
      readln(ch);
	end;
  
  if (ch = 'Y') or (ch = 'y')
    then begin
           GameStart := true;
		   write ('Please press <Enter> to start the new game...');
         end
    else begin
	       GameStart := false;
		 end;
  
end;


{ Menu - Start The Game }
procedure menu1;
begin
  GameStart := true;
  menu_num := 1;
  ClrScr;
  writeln('');
  TextColor(White);
  writeln(' Get It At One by Calvin (Vert) Li');
  writeln('');
  TextBackground(Green);
  writeln('  1.Start The Game  ');
  TextBackground(Black);
  writeln('  2.How To Play  ');
  TextBackground(Black);
  writeln('  3.Exit The Game  ');
  writeln('');
  writeln(' Please use the <Up> and <Down> arrow key to select, then press <Enter> key');
end;


{ Menu - How To Play }
procedure menu2;
begin
  GameStart := true;
  menu_num := 2;
  ClrScr;
  writeln('');
  TextColor(White);
  writeln(' Get It At One by Calvin (Vert) Li');
  writeln('');
  TextBackground(Black);
  writeln('  1.Start The Game  ');
  TextBackground(Green);
  writeln('  2.How To Play  ');
  TextBackground(Black);
  writeln('  3.Exit The Game  ');
  writeln('');
  writeln(' Please use the <Up> and <Down> arrow key to select, then press <Enter> key');
end;


{ Menu 3 - Exit }
procedure menu3;
begin
  GameStart := true;
  menu_num := 3;
  ClrScr;
  writeln('');
  TextColor(White);
  writeln(' Get It At One by Calvin (Vert) Li');
  writeln('');
  TextBackground(Black);
  writeln('  1.Start The Game  ');
  TextBackground(Black);
  writeln('  2.How To Play  ');
  TextBackground(Green);
  writeln('  3.Exit The Game  ');
  TextBackground(Black);
  writeln('');
  writeln(' Please use the <Up> and <Down> arrow key to select, then press <Enter> key');
end;


{ When presses <Up>... }
procedure Up;
begin
  if (menu_num <> 1) then
    menu_num := menu_num - 1;
  ClrScr;
  case menu_num of
    1 : menu1;
    2 : menu2;
    3 : menu3;
  end;
end;


{ When presses <Down>... }
procedure Down;
begin
  if (menu_num <> 3) then
    menu_num := menu_num + 1;
  ClrScr;
  case menu_num of
    1 : menu1;
    2 : menu2;
    3 : menu3;
  end;
end;


{ Displays Hot to Play... }
procedure HowToPlay;
begin
  ClrScr;
  writeln();
  writeln(' How To Play');
  writeln();
  writeln(' 1. The game program will random a number(answer) between 1 and 100.');
  writeln(' 2. The player needs to enter a number to guess the answer.');
  writeln(' 3. When the player entered a number(eg. 37), the program will tell you');
  writeln('    the range (eg.3 7 to 100)');
  writeln(' 4. The player continues to enter a number(eg. 71), the program will tell you');
  writeln('    the range (eg. 37 to 71)');
  writeln(' 5. When the player found out the answer, the game will be end.');
  writeln();
  writeln(' Press any key to continue...');
  readkey;
end;


{ When presses <Enter>... }
procedure Enter;
begin
  if (menu_num = 1)
  then begin
         game;
	     winGame;
       end;
	   
  if (menu_num = 2)
  then begin
         HowToPlay;
		 menu1;
       end;
	   
  if (menu_num = 3)
  then begin
         GameStart := false;
       end;	   
end;


{ main program }
begin
  menu1;
  repeat
    ch:=ReadKey;
    case ch of
     #0 : begin
            ch:=ReadKey; {Read ScanCode}
            case ch of
             #72 : Up;
             #80 : Down;
			 #28 : Enter;
            end;
          end;
    #13 : Enter;
    end;
  until (GameStart = false);
end.