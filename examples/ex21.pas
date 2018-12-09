{*************************************************************
 Вычисление общего наибольшего делителя двух целых чисел. 
 Переделка с сайта НИВЦ МГУ под GMP.
 Низкоуровневые GMP-типы.

 Тестовые данные:
 	на входе 252 и 441
 	на выходе 63
**************************************************************}
{$mode objfpc}{$H+}
program ex21;
Uses gmp;

function PA11I(M, N: mpz_t): mpz_t;
var
  R1,R2,R, R_1, R_2 : mpz_t;

begin
  mpz_init(@Result);
  if ( mpz_cmp_ui(@M, 0) <> 0 ) and ( mpz_cmp_ui(@N, 0) <> 0 ) then 
  begin
    mpz_init(@R1);
    mpz_init(@R2);
    mpz_init(@R);
    mpz_init(@R_1);
    mpz_init(@R_2);
    mpz_set(@R2, @M);
    mpz_set(@R1, @N);
    Repeat
      // R := R2-R1*(R2 div R1);
      mpz_tdiv_q(@R_2, @R2, @R1);
      mpz_mul(@R_1, @R1, @R_2);
      mpz_sub(@R, @R2, @R_1);

      If mpz_cmp_ui(@R, 0) <> 0 Then
      Begin
        mpz_set(@R2, @R1);
        mpz_set(@R1, @R);
      End;
    Until mpz_cmp_ui(@R, 0) = 0;
    mpz_abs(@Result, @R1);
  end
  Else
  begin
    mpz_add(@Result, @M, @N);
    mpz_abs(@Result, @Result);
  end;
end;

Var
  N, M, NOD: mpz_t;
  Ns, Ms: string;
begin
  mpz_init(@NOD);
  Write('Введите первое число: ');
  Readln(Ns);
  Write('Введите второе число: ');
  readLn(Ms);
  mpz_init_set_str(@N, PChar(Ns), 10);
  mpz_init_set_str(@M, PChar(Ms), 10);
  NOD := PA11I(N,M);
  WriteLn('НОД чисел ', Ns, ' и ', Ms, ' равен ', mpz_get_str(NIL, 0, @NOD));
end.
