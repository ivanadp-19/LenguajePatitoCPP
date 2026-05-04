programa conLlamadas ;
vars
  total : entero ;

nula iniciar () {
  { }
} ;

entero suma ( a : entero, b : entero ) {
  { }
} ;

inicio
{
  iniciar () ;
  total = 0 ;
  suma ( total , 5 ) ;
  escribe ( "resultado" , total ) ;
}
fin