#import "Jugador.h"
#import "Photo.h"

@interface Jugador ()

// Private interface goes here.

@end

@implementation Jugador


+(instancetype) jugadorWithName:(NSString *)name
                      apellido1:(NSString *) apellido1
                      apellido2:(NSString *) apellido2
                           edad:(NSString *) edad
                         cedula:(NSString *) cedula
                         dorsal:(NSString *) dorsal
                       posicion:(NSString *) posicion
                          photo:( UIImage *) photo
            posicionAlternativa:(NSString *) posicionAlternativa{
    
    Jugador *jugador;
    
    jugador  = [Jugador MR_createEntity];
    
    jugador.name = name;
    jugador.apellido1 = apellido1;
    jugador.apellido2 = apellido2;
    jugador.edad= edad;
    jugador.dorsal = dorsal;
    jugador.posicion = posicion ;
    jugador.posicionAlternativa = posicion;
    
    if(jugador){
        
        
        if (photo) {
            
            Photo *objPhoto;
            
            objPhoto =[Photo MR_createEntity];
            
            objPhoto.imageFile = UIImageJPEGRepresentation(photo, 1.0);

        
            
            jugador.photo = objPhoto ;
            
        }
        
       
        
    }
    

    return jugador;
    
}

@end
