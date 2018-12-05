{
    An header for the GMP library
    Copyright (c) 2018 by Vadim Isaev

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

{$mode objfpc}{$h+}
{$packrecords c}

Unit gmp;

interface

uses
  sysutils;

const
  BASE10 = 10;
  LIBGMP = 'gmp';
  LOG_10_2 = 0.3010299956639812;
  
  ERROR_NONE                 = 0;
  ERROR_UNSUPPORTED_ARGUMENT = 1;
  ERROR_DIVISION_BY_ZERO     = 2;
  ERROR_SQRT_OF_NEGATIVE     = 4;
  ERROR_INVALID_ARGUMENT     = 8;
  
  RAND_ALG_DEFAULT           = 0;
  RAND_ALG_LC                = RAND_ALG_DEFAULT;

// Major version number is the value of __GNU_MP__ too, above.
  __GNU_MP_VERSION            = 6;
  __GNU_MP_VERSION_MINOR      = 1;
  __GNU_MP_VERSION_PATCHLEVEL = 2;
  __GNU_MP_RELEASE            = __GNU_MP_VERSION * 10000 + __GNU_MP_VERSION_MINOR * 100 + __GNU_MP_VERSION_PATCHLEVEL;

type
{  gmp_randalg_t = ( GMP_RAND_ALG_DEFAULT = 0, 
                    GMP_RAND_ALG_LC      = GMP_RAND_ALG_DEFAULT
                  );
}
  // ---- GMP types ----

  { low level multi precision integer atom = machine size uint }
  mp_bitcnt_t        = valuint;
  mp_limb_t          = valuint;
  mp_limb_signed_t   = valsint;
  mp_limb_signed_ptr = ^valsint;
  mp_ptr             = ^mp_limb_t;
  mp_size_t          = sizeint;
  mp_size_ptr        = ^sizeint;
  mp_exp_t           = valsint;
  mp_exp_ptr         = ^valsint;
  randalg_t          = longint;
  Pvaluint           = ^valuint;
  Pvalsint           = ^valsint;

  { multi precision integer number record }
  mpz_t = record
    alloc: longint;
    size : longint;
    data : mp_ptr;
  end;
  mpz_ptr = ^mpz_t;

  { multi precision rational number record }
  mpq_t = record
    num: mpz_t;
    den: mpz_t;
  end;
  mpq_ptr = ^mpq_t;

  { multi precision real number record }
  mpf_t = record
    prec: longint;
    size: longint;
    exp : mp_exp_t;
    data: mp_ptr;
  end;
  mpf_ptr = ^mpf_t;

  gmp_randstate_t = record
    seed   : mpz_t;
    alg    : randalg_t;
    algdata: record
      case longint of
        0 : (lc : pointer);
    end;
  end;
  gmp_randstate_ptr = ^gmp_randstate_t;
  randstate_t = gmp_randstate_t;
  randstate_ptr = ^gmp_randstate_t;

  { Return a pointer to newly allocated space with at least alloc size bytes }
  alloc_func_t = procedure(alloc_size: sizeuint); cdecl;
  palloc_func = ^alloc_func_t;
  { Resize a previously allocated block ptr of old size bytes to be new size bytes }
  reallocate_func_t = procedure(p: pointer; old_size, new_size: sizeuint); cdecl;
  preallocate_func = ^reallocate_func_t;
  { De-allocate the space pointed to by ptr }
  free_proc_t = procedure(p: pointer; size: sizeuint); cdecl;
  pfree_proc = ^free_proc_t;
  
  procedure mp_set_memory_functions (f1: palloc_func; f2: preallocate_func; f3: pfree_proc); cdecl; external LIBGMP name '__gmp_set_memory_functions';
  procedure mp_get_memory_functions (f1: palloc_func; f2: preallocate_func; f3: pfree_proc); cdecl; external LIBGMP name '__gmp_get_memory_functions';

  function bits_per_limb: valuint;

  {$include mpz.inc}
  {$include mpq.inc}
  {$include mpf.inc}
  {$include mpn.inc}
  {$include print.inc}
  {$include random.inc}

implementation

function bits_per_limb: valuint;
begin
{$ifdef CPU64}
  Result:=64;
{$endif CPU64}
{$ifdef CPU32}
  Result:=32;
{$endif CPU32}
end;

function mpz_sgn(op: mpz_t): integer;
begin
  If op.size<0 Then
    Result:=-1
  Else If op.size>0 Then
    Result:=1
  Else
    Result:=0;
end;

function mpq_sgn(op: mpq_t): integer;
begin
  If op.num.size<0 Then
    Result:=-1
  Else If op.num.size>0 Then
    Result:=1
  Else
    Result:=0;
end;

function mpf_sgn(op: mpf_t): integer;
begin
  If op.size<0 Then
    Result:=-1
  Else If op.size>0 Then
    Result:=1
  Else
    Result:=0;
end;

end.