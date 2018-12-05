{ Included file with random number functions }

procedure gmp_randinit_default(rop: gmp_randstate_t); cdecl; external LIBGMP name '__gmp_randinit_default';
procedure gmp_randinit_lc_2exp(rop: gmp_randstate_t; const p1: mpz_ptr; p2: valuint; p3: mp_bitcnt_t); cdecl; external LIBGMP name '__gmp_randinit_lc_2exp';
function gmp_randinit_lc_2exp_size(rop: gmp_randstate_t; p1: mp_bitcnt_t): integer; cdecl; external LIBGMP name '__gmp_randinit_lc_2exp_size';
procedure gmp_randinit_mt(rop: gmp_randstate_t); cdecl; external LIBGMP name '__gmp_randinit_mt';
procedure gmp_randinit_set(rop: gmp_randstate_t; p1: gmp_randstate_ptr); cdecl; external LIBGMP name '__gmp_randinit_set';
procedure gmp_randseed(rop: gmp_randstate_t; const p1: mpz_ptr); cdecl; external LIBGMP name '__gmp_randseed';
procedure gmp_randseed_ui(rop: gmp_randstate_t; p1: valuint); cdecl; external LIBGMP name '__gmp_randseed_ui';
procedure gmp_randclear(rop: gmp_randstate_t); cdecl; external LIBGMP name '__gmp_randclear';
function gmp_urandomb_ui(rop: gmp_randstate_t; p1: valuint): valuint; cdecl; external LIBGMP name '__gmp_urandomb_ui';
function gmp_urandomm_ui(rop: gmp_randstate_t; p1: valuint): valuint; cdecl; external LIBGMP name '__gmp_urandomm_ui';
