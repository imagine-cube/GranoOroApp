#import "_Jugador.h"

@interface Jugador : _Jugador {}



+(instancetype) jugadorWithName:(NSString *)name
                          apellido1:(NSString *) apellido1
                           apellido2:(NSString *) apellido2
                          edad:(NSString *) edad
                          cedula:(NSString *) cedula
                           dorsal:(NSString *) dorsal
                           posicion:(NSString *) posicion
                          photo:( UIImage *) photo
            posicionAlternativa:(NSString *) posicionAlternativa;


@end
