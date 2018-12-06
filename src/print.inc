{ Included file with input-output functions }

function gmp_asprintf(rop: PChar; p1: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__ggmp_asprintf';
function gmp_printf(rop: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__ggmp_printf';
function gmp_snprintf(rop: PChar; p1: valuint; p2: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__ggmp_snprintf';
function gmp_sprintf(rop: PChar; p1: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__ggmp_sprintf';
function gmp_scanf(rop: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__ggmp_scanf';
function gmp_sscanf(rop: PChar; p1: PChar{; ...}): integer; cdecl; varargs; external LIBGMP name '__ggmp_sscanf';
