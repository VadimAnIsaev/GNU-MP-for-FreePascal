{******************************************************************
 Генератор псевдослучайных чисел.
 Переделка программы с сайта НИВЦ МГУ под GMP.
 Использование низкоуровневых GMP-типов.
 ******************************************************************}
{$mode objfpc}
program ex11;
Uses gmp;

{ Остаток от деления для нецелых чисел, согласно фортрановской документации
  (т.к. Паскаль подобных операций не предусматривает):
  result := Arg1 - ( int(Arg1/Arg2) * Arg2) }
function Emod(Arg1, Arg2 : mpf_t): mpf_t;
Var
  f: mpf_t;
begin
  mpf_init(@f);
  mpf_init(@Result);
  mpf_div(@f, @arg1, @arg2);
  mpf_trunc(@f, @f);
  mpf_mul(@f, @f, @arg2);
  mpf_sub(@Result, @arg1, @f);
  mpf_clear(@f);
end;

{Вычисление псевдослучайных чисел с равномерным распределением
 в диапазоне от 0 до 1.
 Входные параметры:
    ISEED - целая переменная, значение которой перед обращением 
	к подпрограмме может быть любым целым числом в пределах 
	[1..2147483646]; по окончании работы ее значение полагается 
	равным (2^31) * R (N), и это значение может быть использовано 
	при последующем вхождении в подпрограмму;
    N - 	заданное количество генерируемых псевдослучайных чисел (тип: целый);
    R - 	вещественный массив длины N, содержащий вычисленные псевдослучайные числа.} 
procedure GSU1R(var ISEED :longword; N :Integer; var R :Array of mpf_t);
var
  I		: Integer;
  Z		: mpf_t;
  D2P31M	: mpf_t;
  D2PN31	: mpf_t;
  
const
  D2P32M :Integer = 16807;

begin
  mpf_init_set_str(@D2P31M, '2147483647.0', 10);
  mpf_init_set_str(@D2PN31, '4.656612873077393e-10', 10);
  mpf_init_set_ui(@Z, ISEED);
  for I:=0 to N-1 do
  begin
    mpf_mul_ui(@Z, @Z, D2P32M);
    Z := Emod(Z, D2P31M);
    mpf_mul(@R[I], @Z, @D2PN31);
  end;
  ISEED := mpf_get_ui( @Z );

  mpf_clears(@Z, @D2P31M, @D2PN31);
end;

var
  ISEED,N, i :longword;
  R :Array [0..2] of mpf_t;
begin
  ISEED := 123457;
  N := 3;
  For i:=0 To N-1 Do
    mpf_init(@R[i]);

  GSU1R(ISEED,N,R);

  for i:=0 to 2 do
    gmp_printf('%20.10Ff'#10, @r[i]);

  For i:=0 To N-1 Do
    mpf_clear(@R[i]);

end.

