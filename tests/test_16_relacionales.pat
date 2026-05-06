programa relacionales ;
vars
  x : entero ;
  y : entero ;
inicio
{
  x = 0 ;
  y = 0 ;
  si ( x > 0 ) {
    y = 1 ;
  } ;
  si ( x < 10 ) {
    y = 2 ;
  } ;
  si ( x == y ) {
    y = 3 ;
  } ;
  si ( x != y ) {
    y = 4 ;
  } ;
  mientras ( x < 100 ) haz {
    x = x + 1 ;
  } ;
}
fin
