#import "Pago.h"


@interface Pago ()

+(NSArray *)observableKeyNames;


// Private interface goes here.

@end

@implementation Pago

+(NSArray *) observableKeyNames{
    return @[@"name", @"creationDate", @"notebook", @"photo", @"location"];
    
}

+(instancetype) pagoWithName:(NSString *) descripcion
                       monto:(NSDecimalNumber *) monto
                     partido:(Partido *) partido
                     jugador:(Jugador *)jugador{
    
    Pago *pago;
    
    pago = [Pago MR_createEntity];
    
    pago.fecha = [NSDate date];
    pago.descripcion = descripcion;
    pago.monto = monto;
    pago.partido = partido;
    pago.jugador    = jugador;
 
    return pago;
}



@end
