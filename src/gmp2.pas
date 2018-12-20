{*********************************************************************
Additional module facilitating work with low-level GMP data types:
  - definitions of arithmetic and comparing operators;
  - Some frequently used procedures made are functions.
 
 Дополнительный модуль, облегчающий работу с низкоуровневыми типами 
 данных GMP:
 - определениы арифметические и сравнивающие операторы;
 - некоторые частоупотребляемые процедуры сделаны функциями.
 *********************************************************************}
{$mode objfpc}{$h+}
{$packrecords c}
Unit gmp2;

interface

Uses gmp;

Type
  // For convertion number to character string
  // Для преобразования числа в строку
  TTypeNumber = (tnFixed, tnScientific);

  // Vector and matrix for mathematical calculations
  // Для математики
  TmpfVector = array of mpf_t;
  TmpfMatrix = array of array of mpf_t;

{--------------------------------------------
 For Real (mpf_t)
 Десятичные дроби
---------------------------------------------}

{********************************************
 Operators
 Операторы
*********************************************}
// Assignment operators
// Операторы присваивания значений
operator := (op: AnsiString): mpf_t;
operator := (op: pchar): mpf_t;
operator := (op: valuint): mpf_t;
operator := (op: valsint): mpf_t;
operator := (op: double): mpf_t;
operator := (op: mpq_t): mpf_t;
operator := (op: mpz_t): mpf_t;

// Arithmetic operators
// Арифетические операторы
operator + (op1: mpf_t; op2: mpf_t): mpf_t;
operator + (op1: mpf_t; op2: valuint): mpf_t;
operator + (op1: valuint; op2: mpf_t): mpf_t;
operator - (op1: mpf_t; op2: mpf_t): mpf_t;
operator - (op1: mpf_t; op2: valuint): mpf_t;
operator - (op1: valuint; op2: mpf_t): mpf_t;
operator * (op1: mpf_t; op2: mpf_t): mpf_t;
operator * (op1: mpf_t; op2: valuint): mpf_t;
operator * (op1: valuint; op2: mpq_t): mpf_t;
operator / (op1: mpf_t; op2: mpf_t): mpf_t;
operator / (op1: mpf_t; op2: valuint): mpf_t;
operator / (op1: valuint; op2: mpq_t): mpf_t;

// The square root
// Функция извлечения кв. корня
function sqrt(op: mpf_t): mpf_t;
function sqrt(op: longword): mpf_t;

// Comparison operators
// Операторы сравнения
operator =  (op1: mpf_t; op2: mpf_t): boolean;
operator <> (op1: mpf_t; op2: mpf_t): boolean;
operator >  (op1: mpf_t; op2: mpf_t): boolean;
operator <  (op1: mpf_t; op2: mpf_t): boolean;
operator >= (op1: mpf_t; op2: mpf_t): boolean;
operator <= (op1: mpf_t; op2: mpf_t): boolean;

{*********************************************************
 Functions
 Функции
**********************************************************}
// Absolute value
// Абсолютное значение
function abs(op: mpf_t): mpf_t;

// Rounding
// Округление
function ceil(op: mpf_t): mpf_t;
function floor(op: mpf_t): mpf_t;
function trunc(op: mpf_t): mpf_t;

// Convert number to character string
// Преобразование в строку
// Параметры:
//	op - число;
//	tn - формат представления числа.
// Возвращаемый результат:
//	число в символьном представлении типа AnsiString
function mpf_ToString(op: mpf_t; tn: TTypeNumber = tnFixed): AnsiString;

// Service information
// Служебная информация
//
// The digits in the mantissa by the number of bits
// Количество разрядов в мантиссе по кол-ву бит
function GetDigits(prec: LongWord): longWord;

// The maximum possible digits in number
// Максимально возможное количество разрядов числа
function GetMaxDigits(op: mpf_t): LongWord;

// The number of bits by the digits.
// The result is rounded to the nearest 
// larger whole count of limbs.
// Количество битов по кол-ву разрядов.
// Результат округляется до ближайшего большего
// целого кол-ва лимбов
function GetPrec(digits: LongWord): valuint;

// Если изменилась величина хранилища
// в основной программе, эта процедура
// процедура заносит это значение
// во временные переменные ответов
// для функций операций
procedure RescanDefaultPrec();

{--------------------------------------------
 Integers
 Целые числа
---------------------------------------------}

{********************************************
 Operators
 Операторы
*********************************************}

// Assignment operators
// Операторы присваивания значений
operator := (op: string): mpz_t;
operator := (op: pchar): mpz_t;
operator := (op: longword): mpz_t;
operator := (op: integer): mpz_t;
operator := (op: double): mpz_t;
operator := (op: mpf_t): mpz_t;
operator := (op: mpq_t): mpz_t;

// Comparison operators
// Операторы сравнения
operator =  (op1: mpz_t; op2: mpz_t): boolean;
operator <> (op1: mpz_t; op2: mpz_t): boolean;
operator >  (op1: mpz_t; op2: mpz_t): boolean;
operator <  (op1: mpz_t; op2: mpz_t): boolean;
operator >= (op1: mpz_t; op2: mpz_t): boolean;
operator <= (op1: mpz_t; op2: mpz_t): boolean;

// Целочисленное деление
operator div (op1: mpz_t; op2: mpz_t): mpz_t;

{*********************************************************
 Functions
 Функции
**********************************************************}
// Absolute value
// Абсолютное значение
function abs(op: mpz_t): mpz_t;

{--------------------------------------------
 Rationals
 Обыкновенные дроби
---------------------------------------------}

{********************************************
 Operators
 Операторы
*********************************************}
// Assignment operators
// Операторы присваивания значений
operator := (op: string): mpq_t;
operator := (op: pchar): mpq_t;
operator := (op: mpz_t): mpq_t;

// Comparison operators
// Операторы сравнения
operator =  (op1: mpq_t; op2: mpq_t): boolean;
operator <> (op1: mpq_t; op2: mpq_t): boolean;
operator >  (op1: mpq_t; op2: mpq_t): boolean;
operator <  (op1: mpq_t; op2: mpq_t): boolean;
operator >= (op1: mpq_t; op2: mpq_t): boolean;
operator <= (op1: mpq_t; op2: mpq_t): boolean;

{*********************************************************
 Functions
 Функции
**********************************************************}
// Absolute value
// Абсолютное значение
function abs(op: mpq_t): mpq_t;



implementation

Uses SysUtils;

Var
  TmpResult_f: mpf_t;
  TmpResult_z: mpz_t;
  TmpResult_q: mpq_t;

{--------------------------------------------
 Десятичные дроби
---------------------------------------------}

{------ Присваивание --------------------------------}
operator := (op: string): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_str(@result, pchar(op), 0);
end;

operator := (op: pchar): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_str(@result, op, 0);
end;

operator := (op: valuint): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_ui(@result, op);
end;

operator := (op: valsint): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_si(@result, op);
end;

operator := (op: double): mpf_t;
begin
  result:=TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_d(@result, op);
end;

operator := (op: mpz_t): mpf_t;
begin
  result:=TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_z(@result, @op);
end;

operator := (op: mpq_t): mpf_t;
begin
  result:=TmpResult_f;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_set_q(@result, @op);
end;

// Arithmetic operators
// Арифетические операторы
operator + (op1: mpf_t; op2: mpf_t): mpf_t;
Var
  prec, prec1, prec2: mp_bitcnt_t;
begin
  prec:=mpf_get_prec(@TmpResult_f);
  prec1:=mpf_get_prec(@op1);
  prec2:=mpf_get_prec(@op2);
  If (prec<prec1) or (prec<prec2) Then
  Begin  
    If prec1 < prec2 Then
      prec:=prec2
    Else
      prec:=prec1;
    mpf_set_prec(@TmpResult_f, prec);
  End;
  result:=TmpResult_f;
  
  mpf_add(@result, @op1, @op2);
end;

operator + (op1: mpf_t; op2: valuint): mpf_t;
begin
  result:=TmpResult_f;
  mpf_add_ui(@result, @op1, op2);
end;

operator + (op1: valuint; op2: mpf_t): mpf_t;
begin
  result:=TmpResult_f;
  mpf_add_ui(@result, @op2, op1);
end;

operator - (op1: mpf_t; op2: mpf_t): mpf_t;
Var
  prec, prec1, prec2: mp_bitcnt_t;
begin
  prec:=mpf_get_prec(@TmpResult_f);
  prec1:=mpf_get_prec(@op1);
  prec2:=mpf_get_prec(@op2);
  If (prec<prec1) or (prec<prec2) Then
  Begin  
    If prec1 < prec2 Then
      prec:=prec2
    Else
      prec:=prec1;
    mpf_set_prec(@TmpResult_f, prec);
  End;
  result:=TmpResult_f;
  
  mpf_sub(@result, @op1, @op2);
end;

operator - (op1: mpf_t; op2: valuint): mpf_t;
begin
  result:=TmpResult_f;
  mpf_sub_ui(@result, @op1, op2);
end;

operator - (op1: valuint; op2: mpf_t): mpf_t;
begin
  result:=TmpResult_f;
  mpf_ui_sub(@result, op1, @op2);
end;

operator * (op1: mpf_t; op2: mpf_t): mpf_t;
Var
  prec, prec1, prec2: mp_bitcnt_t;
begin
  prec:=mpf_get_prec(@TmpResult_f);
  prec1:=mpf_get_prec(@op1);
  prec2:=mpf_get_prec(@op2);
  If (prec<prec1) or (prec<prec2) Then
  Begin  
    If prec1 < prec2 Then
      prec:=prec2
    Else
      prec:=prec1;
    mpf_set_prec(@TmpResult_f, prec);
  End;
  result:=TmpResult_f;
  
  mpf_mul(@result, @op1, @op2);
end;

operator * (op1: mpf_t; op2: valuint): mpf_t;
begin
  result:=TmpResult_f;
  mpf_mul_ui(@result, @op1, op2);
end;

operator * (op1: valuint; op2: mpq_t): mpf_t;
begin
  result:=TmpResult_f;
  mpf_sub_ui(@result, @op2, op1);
end;

operator / (op1: mpf_t; op2: mpf_t): mpf_t;
Var
  prec, prec1, prec2: mp_bitcnt_t;
begin
  prec:=mpf_get_prec(@TmpResult_f);
  prec1:=mpf_get_prec(@op1);
  prec2:=mpf_get_prec(@op2);
  If (prec<prec1) or (prec<prec2) Then
  Begin  
    If prec1 < prec2 Then
      prec:=prec2
    Else
      prec:=prec1;
    mpf_set_prec(@TmpResult_f, prec);
  End;
  result:=TmpResult_f;
  
  mpf_div(@result, @op1, @op2);
end;

operator / (op1: mpf_t; op2: valuint): mpf_t;
begin
  result:=TmpResult_f;
  mpf_div_ui(@result, @op1, op2);
end;

operator / (op1: valuint; op2: mpq_t): mpf_t;
begin
  result:=TmpResult_f;
  mpf_ui_div(@result, op1, @op2);
end;


{------ Корень квадратный ---------------------------}
function sqrt(op: mpf_t): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_prec(@op));
  mpf_sqrt(@result, @op);
end;

function sqrt(op: longword): mpf_t;
begin
  result := TmpResult_z;
  mpf_set_prec(@result, mpf_get_default_prec());
  mpf_sqrt_ui(@result, op);
end;

{------ Сравнение ------------------------------------}
operator = (op1: mpf_t; op2: mpf_t): boolean;
begin
  result:=False;
  If mpf_cmp(@op1, @op2) = 0 Then
    result:=True;
end;

operator <> (op1: mpf_t; op2: mpf_t): boolean;
begin
  result:=False;
  If mpf_cmp(@op1, @op2) <> 0 Then
    result:=True;
end;

operator > (op1: mpf_t; op2: mpf_t): boolean;
begin
  result:=False;
  If mpf_cmp(@op1, @op2) > 0 Then
    result:=True;
end;

operator < (op1: mpf_t; op2: mpf_t): boolean;
begin
  result:=False;
  If mpf_cmp(@op1, @op2) < 0 Then
    result:=True;
end;

operator >= (op1: mpf_t; op2: mpf_t): boolean;
begin
  result:=False;
  If mpf_cmp(@op1, @op2) >= 0 Then
    result:=True;
end;

operator <= (op1: mpf_t; op2: mpf_t): boolean;
begin
  result:=False;
  If mpf_cmp(@op1, @op2) <= 0 Then
    result:=True;
end;

{*************************************************************
 Функции
**************************************************************}
{------ Абсолютное значение ----------------------------------}
function abs(op: mpf_t): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_prec(@op));
  mpf_abs(@result, @op);
end;

{------ Округление ------------------------------------------}
function ceil(op: mpf_t): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_prec(@op));
  mpf_ceil(@result, @op);
end;

function floor(op: mpf_t): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_prec(@op));
  mpf_floor(@result, @op);
end;

function trunc(op: mpf_t): mpf_t;
begin
  result := TmpResult_f;
  mpf_set_prec(@result, mpf_get_prec(@op));
  mpf_trunc(@result, @op);
end;

{------ Преобразование в строку ----------------------}
function mpf_ToString(op: mpf_t; tn: TTypeNumber = tnFixed): AnsiString;
Var
  pc: PChar;
  cnt: longword;
  view: string;
begin
  cnt := GetDigits(mpf_get_prec(@op));
  GetMem(pc, cnt);
  If tn = tnFixed Then
    view := '.Ff'
  Else
    view := '.Fe';
  gmp_sprintf(pc, PChar('%'+IntToStr(cnt)+view), @op);
  result := pc;
  FreeMem(pc);
  result := Trim(result);
end;


{------ Служебная информация -------------------------}
function GetDigits(prec: LongWord): longWord;
begin
  result := Round(prec * LOG_10_2);
end;

function GetMaxDigits(op: mpf_t): LongWord;
begin
  result:=GetDigits(mpf_get_prec(@op));
end;

function GetPrec(digits: LongWord): valuint;
Var
  ost: valuint;
  bpl: valuint;
begin
  result:=Round(digits/LOG_10_2);
  bpl:=bits_per_limb();
  ost:=result mod bpl;
  result:=result + bpl - ost;
end;

procedure RescanDefaultPrec();
begin
  mpf_set_prec(@TmpResult_f, mpf_get_default_prec());
end;

{--------------------------------------------
 Целые числа
---------------------------------------------}
{------ Присваивание --------------------------------}
operator := (op: string): mpz_t;
begin
  result := TmpResult_z;
  mpz_set_str(@result, pchar(op), 0);
end;

operator := (op: pchar): mpz_t;
begin
  result := TmpResult_z;
  mpz_set_str(@result, op, 0);
end;

operator := (op: longword): mpz_t;
begin
  result := TmpResult_z;
  mpz_set_ui(@result, op);
end;

operator := (op: integer): mpz_t;
begin
  result := TmpResult_z;
  mpz_set_si(@result, op);
end;

operator := (op: double): mpz_t;
begin
  result:=TmpResult_z;
  mpz_set_d(@result, op);
end;

operator := (op: mpf_t): mpz_t;
begin
  result:=TmpResult_z;
  mpz_set_f(@result, @op);
end;

operator := (op: mpq_t): mpz_t;
begin
  result:=TmpResult_z;
  mpz_set_q(@result, @op);
end;

{------ Корень квадратный ---------------------------}
function sqrt(op: mpz_t): mpz_t;
begin
  result := TmpResult_z;
  mpz_sqrt(@result, @op);
end;

{------ Сравнение ------------------------------------}
operator = (op1: mpz_t; op2: mpz_t): boolean;
begin
  result:=False;
  If mpz_cmp(@op1, @op2) = 0 Then
    result:=True;
end;

operator <> (op1: mpz_t; op2: mpz_t): boolean;
begin
  result:=False;
  If mpz_cmp(@op1, @op2) <> 0 Then
    result:=True;
end;

operator > (op1: mpz_t; op2: mpz_t): boolean;
begin
  result:=False;
  If mpz_cmp(@op1, @op2) > 0 Then
    result:=True;
end;

operator < (op1: mpz_t; op2: mpz_t): boolean;
begin
  result:=False;
  If mpz_cmp(@op1, @op2) < 0 Then
    result:=True;
end;

operator >= (op1: mpz_t; op2: mpz_t): boolean;
begin
  result:=False;
  If mpz_cmp(@op1, @op2) >= 0 Then
    result:=True;
end;

operator <= (op1: mpz_t; op2: mpz_t): boolean;
begin
  result:=False;
  If mpz_cmp(@op1, @op2) <= 0 Then
    result:=True;
end;

operator div (op1: mpz_t; op2: mpz_t): mpz_t;
begin
  result := TmpResult_z;
  mpz_tdiv_q(@result, @op1, @op2);
end;

{*************************************************************
 Функции
**************************************************************}
{------ Абсолютное значение ----------------------------------}
function abs(op: mpz_t): mpz_t;
begin
  result := TmpResult_z;
  mpz_abs(@result, @op);
end;

{--------------------------------------------
 Обычные дроби
---------------------------------------------}
{------ Присваивание --------------------------------}
operator := (op: string): mpq_t;
begin
  result := TmpResult_q;
  mpq_set_str(@result, pchar(op), 0);
end;

operator := (op: pchar): mpq_t;
begin
  result := TmpResult_q;
  mpq_set_str(@result, op, 0);
end;

operator := (op: mpz_t): mpq_t;
begin
  result:=TmpResult_q;
  mpq_set_z(@result, @op);
end;

{------ Сравнение ------------------------------------}
operator = (op1: mpq_t; op2: mpq_t): boolean;
begin
  result:=False;
  If mpq_cmp(@op1, @op2) = 0 Then
    result:=True;
end;

operator <> (op1: mpq_t; op2: mpq_t): boolean;
begin
  result:=False;
  If mpq_cmp(@op1, @op2) <> 0 Then
    result:=True;
end;

operator > (op1: mpq_t; op2: mpq_t): boolean;
begin
  result:=False;
  If mpq_cmp(@op1, @op2) > 0 Then
    result:=True;
end;

operator < (op1: mpq_t; op2: mpq_t): boolean;
begin
  result:=False;
  If mpq_cmp(@op1, @op2) < 0 Then
    result:=True;
end;

operator >= (op1: mpq_t; op2: mpq_t): boolean;
begin
  result:=False;
  If mpq_cmp(@op1, @op2) >= 0 Then
    result:=True;
end;

operator <= (op1: mpq_t; op2: mpq_t): boolean;
begin
  result:=False;
  If mpq_cmp(@op1, @op2) <= 0 Then
    result:=True;
end;

{*************************************************************
 Функции
**************************************************************}
{------ Абсолютное значение ----------------------------------}
function abs(op: mpq_t): mpq_t;
begin
  result := TmpResult_q;
  mpq_abs(@result, @op);
end;

Initialization
  mpf_init(@TmpResult_f);
  mpz_init(@TmpResult_z);
  mpq_init(@TmpResult_q);

finalization
  mpf_clear(@TmpResult_f);
  mpz_clear(@TmpResult_z);
  mpq_clear(@TmpResult_q);

End.  
