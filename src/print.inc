{ Included file with input-output functions }

function gmp_asprintf(rop: PChar; p1: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__gmp_asprintf';
function gmp_printf(rop: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__gmp_printf';
function gmp_snprintf(rop: PChar; p1: valuint; p2: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__gmp_snprintf';
function gmp_sprintf(rop: PChar; p1: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__gmp_sprintf';
function gmp_scanf(rop: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__gmp_scanf';
function gmp_sscanf(rop: PChar; p1: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__gmp_sscanf';
