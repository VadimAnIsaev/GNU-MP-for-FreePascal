{ Included file with low level functions }

function mpn_add(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_add';
function mpn_add_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_add_1';
function mpn_add_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_add_n';
function mpn_addmul_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_addmul_1';
function mpn_cmp(const rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t): integer; cdecl; external LIBGMP name '__gmpn_cmp';
function mpn_zero_p(const rop: mp_ptr; p1: mp_size_t): integer; cdecl; external LIBGMP name '__gmpn_zero_p';
procedure mpn_divexact_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t); cdecl; external LIBGMP name '__gmpn_divexact_1';
function mpn_divexact_by3c(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_divexact_by3c';
function mpn_divrem(rop: mp_ptr; p1: mp_size_t; p2: mp_ptr; p3: mp_size_t; const p4: mp_ptr; p5: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_divrem';
function mpn_divrem_1(rop: mp_ptr; p1: mp_size_t; const p2: mp_ptr; p3: mp_size_t; p4: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_divrem_1';
function mpn_divrem_2(rop: mp_ptr; p1: mp_size_t; p2: mp_ptr; p3: mp_size_t; const p4: mp_ptr): mp_limb_t; cdecl; external LIBGMP name '__gmpn_divrem_2';
function mpn_div_qr_1(rop: mp_ptr; p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t; p4: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_div_qr_1';
function mpn_div_qr_2(rop: mp_ptr; p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t; const p4: mp_ptr): mp_limb_t; cdecl; external LIBGMP name '__gmpn_div_qr_2';
function mpn_gcd(rop: mp_ptr; p1: mp_ptr; p2: mp_size_t; p3: mp_ptr; p4: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_gcd';
function mpn_gcd_1(const rop: mp_ptr; p1: mp_size_t; p2: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_gcd_1';
function mpn_gcdext_1(rop: mp_limb_signed_ptr; p1: mp_limb_signed_ptr; p2: mp_limb_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_gcdext_1';
function mpn_gcdext(rop: mp_ptr; p1: mp_ptr; p2: mp_size_ptr; p3: mp_ptr; p4: mp_size_t; p5: mp_ptr; p6: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_gcdext';
function mpn_get_str(rop: PByte; p1: integer; p2: mp_ptr; p3: mp_size_t): valuint; cdecl; external LIBGMP name '__gmpn_get_str';
function mpn_hamdist(const rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t): mp_bitcnt_t; cdecl; external LIBGMP name '__gmpn_hamdist';
function mpn_lshift(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: dword): mp_limb_t; cdecl; external LIBGMP name '__gmpn_lshift';
function mpn_mod_1(const rop: mp_ptr; p1: mp_size_t; p2: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_mod_1';
function mpn_mul(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_mul';
function mpn_mul_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_mul_1';
procedure mpn_mul_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_mul_n';
procedure mpn_sqr(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t); cdecl; external LIBGMP name '__gmpn_sqr';
function mpn_neg(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_neg';
procedure mpn_com(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t); cdecl; external LIBGMP name '__gmpn_com';
function mpn_perfect_square_p(const rop: mp_ptr; p1: mp_size_t): integer; cdecl; external LIBGMP name '__gmpn_perfect_square_p';
function mpn_perfect_power_p(const rop: mp_ptr; p1: mp_size_t): integer; cdecl; external LIBGMP name '__gmpn_perfect_power_p';
function mpn_popcount(const rop: mp_ptr; p1: mp_size_t): mp_bitcnt_t; cdecl; external LIBGMP name '__gmpn_popcount';
function mpn_pow_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t; p4: mp_ptr): mp_size_t; cdecl; external LIBGMP name '__gmpn_pow_1';
function mpn_preinv_mod_1(const rop: mp_ptr; p1: mp_size_t; p2: mp_limb_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_preinv_mod_1';
procedure mpn_random(rop: mp_ptr; p1: mp_size_t); cdecl; external LIBGMP name '__gmpn_random';
procedure mpn_random2(rop: mp_ptr; p1: mp_size_t); cdecl; external LIBGMP name '__gmpn_random2';
function mpn_rshift(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: dword): mp_limb_t; cdecl; external LIBGMP name '__gmpn_rshift';
function mpn_scan0(const rop: mp_ptr; p1: mp_bitcnt_t): mp_bitcnt_t; cdecl; external LIBGMP name '__gmpn_scan0';
function mpn_scan1(const rop: mp_ptr; p1: mp_bitcnt_t): mp_bitcnt_t; cdecl; external LIBGMP name '__gmpn_scan1';
function mpn_set_str(rop: mp_ptr; p1: PByte; p2: valuint; p3: integer): mp_size_t; cdecl; external LIBGMP name '__gmpn_set_str';
function mpn_sizeinbase(const rop: mp_ptr; p1: mp_size_t; p2: integer): valuint; cdecl; external LIBGMP name '__gmpn_sizeinbase';
function mpn_sqrtrem(rop: mp_ptr; p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sqrtrem';
function mpn_sub(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_sub';
function mpn_sub_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_sub_1';
function mpn_sub_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_sub_n';
function mpn_submul_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_submul_1';
procedure mpn_tdiv_qr(rop: mp_ptr; p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_size_t; const p5: mp_ptr; p6: mp_size_t); cdecl; external LIBGMP name '__gmpn_tdiv_qr';
procedure mpn_and_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_and_n';
procedure mpn_andn_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_andn_n';
procedure mpn_nand_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_nand_n';
procedure mpn_ior_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_ior_n';
procedure mpn_iorn_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_iorn_n';
procedure mpn_nior_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_nior_n';
procedure mpn_xor_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_xor_n';
procedure mpn_xnor_n(rop: mp_ptr; const p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_xnor_n';
procedure mpn_copyi(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t); cdecl; external LIBGMP name '__gmpn_copyi';
procedure mpn_copyd(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t); cdecl; external LIBGMP name '__gmpn_copyd';
procedure mpn_zero(rop: mp_ptr; p1: mp_size_t); cdecl; external LIBGMP name '__gmpn_zero';
function mpn_cnd_add_n(rop: mp_limb_t; p1: mp_ptr; const p2: mp_ptr; const p3: mp_ptr; p4: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_cnd_add_n';
function mpn_cnd_sub_n(rop: mp_limb_t; p1: mp_ptr; const p2: mp_ptr; const p3: mp_ptr; p4: mp_size_t): mp_limb_t; cdecl; external LIBGMP name '__gmpn_cnd_sub_n';
function mpn_sec_add_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t; p4: mp_ptr): mp_limb_t; cdecl; external LIBGMP name '__gmpn_sec_add_1';
function mpn_sec_add_1_itch(rop: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_add_1_itch';
function mpn_sec_sub_1(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_limb_t; p4: mp_ptr): mp_limb_t; cdecl; external LIBGMP name '__gmpn_sec_sub_1';
function mpn_sec_sub_1_itch(rop: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_sub_1_itch';
procedure mpn_cnd_swap(rop: mp_limb_t; p1: mp_ptr; p2: mp_ptr; p3: mp_size_t); cdecl; external LIBGMP name '__gmpn_cnd_swap';
procedure mpn_sec_mul(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_size_t; p5: mp_ptr); cdecl; external LIBGMP name '__gmpn_sec_mul';
function mpn_sec_mul_itch(rop: mp_size_t; p1: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_mul_itch';
procedure mpn_sec_sqr(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; p3: mp_ptr); cdecl; external LIBGMP name '__gmpn_sec_sqr';
function mpn_sec_sqr_itch(rop: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_sqr_itch';
procedure mpn_sec_powm(rop: mp_ptr; const p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_bitcnt_t; const p5: mp_ptr; p6: mp_size_t; p7: mp_ptr); cdecl; external LIBGMP name '__gmpn_sec_powm';
function mpn_sec_powm_itch(rop: mp_size_t; p1: mp_bitcnt_t; p2: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_powm_itch';
procedure mpn_sec_tabselect(rop: mp_ptr; p1: mp_ptr; p2: mp_size_t; p3: mp_size_t; p4: mp_size_t); cdecl; external LIBGMP name '__gmpn_sec_tabselect';
function mpn_sec_div_qr(rop: mp_ptr; p1: mp_ptr; p2: mp_size_t; const p3: mp_ptr; p4: mp_size_t; p5: mp_ptr): mp_limb_t; cdecl; external LIBGMP name '__gmpn_sec_div_qr';
function mpn_sec_div_qr_itch(rop: mp_size_t; p1: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_div_qr_itch';
procedure mpn_sec_div_r(rop: mp_ptr; p1: mp_size_t; const p2: mp_ptr; p3: mp_size_t; p4: mp_ptr); cdecl; external LIBGMP name '__gmpn_sec_div_r';
function mpn_sec_div_r_itch(rop: mp_size_t; p1: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_div_r_itch';
function mpn_sec_invert(rop: mp_ptr; p1: mp_ptr; const p2: mp_ptr; p3: mp_size_t; p4: mp_bitcnt_t; p5: mp_ptr): integer; cdecl; external LIBGMP name '__gmpn_sec_invert';
function mpn_sec_invert_itch(rop: mp_size_t): mp_size_t; cdecl; external LIBGMP name '__gmpn_sec_invert_itch';