programa llamadaEnExpr ;
vars
  x : entero ;
  y : entero ;

entero doblar ( n : entero ) {
  { }
} ;

entero sumar ( a : entero, b : entero ) {
  { }
} ;

inicio
{
  x = doblar ( 5 ) ;
  y = sumar ( x , 10 ) ;
  x = doblar ( y + 3 ) * 2 ;
  y = sumar ( doblar ( x ) , doblar ( y ) ) ;
}
fin
