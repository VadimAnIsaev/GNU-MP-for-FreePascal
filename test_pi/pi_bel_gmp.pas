{************************************************************
 Вычисление числа PI по формуле Фабриса Беллара
 GMP, типы низкоуровневые. Все!
*************************************************************}
{$mode objfpc}{$H+}
program pi_bel_gmp;
Uses SysUtils, DateUtils, gmp;

Var
  pi_bellard: mpf_t;
  m1, m2, m3, m4, m5, m6, m7, m8: mpf_t;
  tmp_1, tmp1,tmp2,tmp3,tmp5,tmp7,tmp9: mpf_t;
  t1, t2: mpf_t;
  startt, endt: TDateTime;
  k: longword;

Begin
  startt:=Now;
  mpf_set_default_prec(128);
  
  mpf_init(@pi_bellard);
  
  mpf_init_set_str(@tmp_1, '-1.0', 10);
  mpf_init_set_str(@tmp1, '1.0', 10);
  mpf_init_set_str(@tmp2, '2.0', 10);
  mpf_init_set_str(@tmp3, '3.0', 10);
  mpf_init_set_str(@tmp5, '5.0', 10);
  mpf_init_set_str(@tmp7, '7.0', 10);
  mpf_init_set_str(@tmp9, '9.0', 10);
  
  mpf_inits(@m1, @m2, @m3, @m4, @m5, @m6, @m7, @m8, @t1, @t2);
  
  For k:=0 To 20000000 Do
  Begin
    mpf_pow_ui(@t1, @tmp_1, k);
    mpf_pow_ui(@t2, @tmp2, (10*k));
    mpf_div(@m1, @t1,@ t2);
    
    mpf_pow_ui(@t1, @tmp2, 5);
    mpf_neg(@t1, @t1);
    mpf_add_ui(@t2, @tmp1, 4*k);
    mpf_div(@m2, @t1, @t2);
    
    mpf_add_ui(@t2, @tmp3, 4*k);
    mpf_div(@m3, @tmp1, @t2);
    
    mpf_pow_ui(@t1, @tmp2, 8);
    mpf_add_ui(@t2, @tmp1, 10*k);
    mpf_div(@m4, @t1, @t2);
    
    mpf_pow_ui(@t1, @tmp2, 6);
    mpf_add_ui(@t2, @tmp3, 10*k);
    mpf_div(@m5, @t1, @t2);
    
    mpf_pow_ui(@t1, @tmp2, 2);
    mpf_add_ui(@t2, @tmp5, 10*k);
    mpf_div(@m6, @t1, @t2);
    
    mpf_pow_ui(@t1, @tmp2, 2);
    mpf_add_ui(@t2, @tmp7, 10*k);
    mpf_div(@m7, @t1, @t2);
    
    mpf_add_ui(@t2, @tmp9, 10*k);
    mpf_div(@m8, @tmp1, @t2);
    
    mpf_sub(@t1, @m2, @m3);
    mpf_add(@t1, @t1, @m4);
    mpf_sub(@t1, @t1, @m5);
    mpf_sub(@t1, @t1, @m6);
    mpf_sub(@t1, @t1, @m7);
    mpf_add(@t1, @t1, @m8);
    mpf_mul(@t2, @m1, @t1);
    mpf_add(@pi_bellard, @pi_bellard, @t2);
  end;
  mpf_mul(@t1, @pi_bellard, @tmp1);
  mpf_pow_ui(@t2, @tmp2, 6);
  mpf_div(@pi_bellard, @t1, @t2);

  endt := Now;

  gmp_printf('%40.38Ff'#10, @pi_bellard);
  WriteLn('Время: ', SecondsBetween(endt, startt), ' секунд');
  WriteLn('3,14159265358979323846264338327950288');
  
  mpf_clear(@pi_bellard);
  mpf_clears(@tmp_1, @tmp1, @tmp2, @tmp3, @tmp5, @tmp7, @tmp9);

  mpf_clears(@m1, @m2, @m3, @m4, @m5, @m6, @m7, @m8, @t1, @t2);
end.
