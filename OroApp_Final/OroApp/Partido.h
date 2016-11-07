#import "_Partido.h"

@interface Partido : _Partido {}

// Custom logic goes here.




+(instancetype) partidoWithName:(NSString *)descripcion
                        rival:(NSString *) rival
                        hora:(NSString *) hora
                        lugar:(NSString *) lugar
                        fecha:(NSString *) fecha
;

@end
