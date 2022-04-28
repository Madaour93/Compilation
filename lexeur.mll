(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
    }
rule token = parse
    [' ' '\t''\n']            { token lexbuf }
<<<<<<< HEAD
    | ';'                     { PT_VIRG }
    | ['0'-'9']+              { NOMBRE }
=======
    | ';'                     {PT_VIRG }
    | ['0'-'9']+              { NOMBRE }0
    | ['0'-'9']+('e''-'?['0'-'9']+)? as lexem {NOMBRE(float_of_String lexem)}
    | (['0'-'9']+'.'['0'-'9']*|['0'-'9']*'.'['0'-'9']+)('e''-'?['0'-'9']+) as lexem {NOMBRE(float_of_String)}
>>>>>>> TP
    | '+'                     { PLUS }
    | '-'                     { MOINS }
    | '*'                     { FOIS }
    | '('                     { GPAREN }
    | ')'                     { DPAREN }
    | eof                     { raise Eof }
    | _                       { raise TokenInconu }
