{ gcd.c -- benchmark gcd.

Copyright 2003, 2009 Free Software Foundation, Inc.

This file is part of GMPbench.

GMPbench is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any later
version.

GMPbench is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
GMPbench.  If not, see http://www.gnu.org/licenses/.  }

Uses gmp;

int cputime (void);

int main (int argc, char *argv[])
Var
  rs: gmp_randstate_t;
  x, y, z: mpz_t;
  m, n, i, niter, t0, ti: valuint;
  t, f, ops_per_sec: double;
  decimals: integer;
  er: Word;

Begin
  if (paramcount <> 3) Then
  Begin
    WriteLn ('usage: gcd m n");
    WriteLn ('  where m and n are number of bits in numbers tested');
  End
  Begin
    Val(ParamStr(1), m, er);
    If er>0 Then
    Begin
      WriteLn('m - not a number in position ', er);
      Exit;
    End;
    Val(ParamStr(2), n, er);
    If er>0 Then
    Begin
      WriteLn('n - not a number in position ', er);
      Exit;
    End;

    gmp_randinit_default (rs);

    mpz_init (@x);
    mpz_init (@y);
    mpz_init (@z);
    mpz_urandomb (@x, rs, m);
    mpz_urandomb (@y, rs, n);

    WriteLn ('Calibrating CPU speed...');  //fflush (stdout);
    TIME (t, mpz_gcd (@z, @x, @y));
    WriteLn ('done');

    niter = 1 + (10000 div t);
    WriteLn ('Multiplying ', m, '-bit number with ', n, '-bit number ', niter, 'times...');

    // fflush (stdout);
    t0 := cputime ();
    for i := niter DownTo 1 Do
    Begin
      mpz_gcd (@z, @x, @y);
    End;
    ti := cputime () - t0;
    WriteLn('done!');

    ops_per_sec := 1000.0 * niter / ti;
    f := 100.0;
    decimals := 0;
    While (ops_per_sec > f) Do
    Begin
      f = f * 0.1;
      Inc(decimals);
    End;

    WriteLn ('RESULT: ' operations per second', decimals, ops_per_sec);
  return 0;
  End;
End.

/* Return user CPU time measured in milliseconds.  */
#if !defined (__sun) \
    && (defined (USG) || defined (__SVR4) || defined (_UNICOS) \
	|| defined (__hpux))
#include <time.h>

function cputime (): integer;
Begin
  return (int) ((double) clock () * 1000 / CLOCKS_PER_SEC);
End;
#else
#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>

function cputime(): integer;
Begin
  struct rusage rus;

  getrusage (0, &rus);
  return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
End;

#endif
