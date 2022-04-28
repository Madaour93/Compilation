
%token <float> NOMBRE
%token PLUS MOINS FOIS MODULO GPAREN DPAREN PT_VIRG EOL
%left PLUS MOINS
%left FOIS MODULO
%nonassoc UMOINS
%type <float> main expression
%start main
%%
main:
expression EOL { $1 }
;
expression:
  expression PLUS expression { $1+$3 }
| expression MOINS expression { $1-$3 }
| expression FOIS expression { $1*$3 }
| expression MODULO expression { $1%$3}
| GPAREN expression DPAREN { $2 }
| MOINS expression %prec UMOINS { -$2 }
| NOMBRE { $1 }
;