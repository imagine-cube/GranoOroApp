#import "_Pago.h"
#import "Partido.h"

@interface Pago : _Pago {}


+(instancetype) pagoWithName:(NSString *) descripcion
                       monto:(NSDecimalNumber *) monto
                     partido:(Partido *) partido
                        jugador:(Jugador *)jugador;




@end
