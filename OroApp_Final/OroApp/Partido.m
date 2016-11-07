#import "Partido.h"

@interface Partido ()

+(NSArray *)observableKeyNames;

@end


@implementation Partido


+(NSArray *)observableKeyNames{
    return @[@"creationDate", @"name", @"notes"];
}

+(instancetype)  partidoWithName:(NSString *)descripcion
                           rival:(NSString *) rival
                            hora:(NSString *) hora
                           lugar:(NSString *) lugar
                            fecha:(NSString *) fecha
                         {
    
    Partido *partido;
    
    partido = [Partido MR_createEntity];
                             
                             NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                             
                             // this is important - we set our input date format to match our input string
                             
                             // if format doesn't match you'll get nil from your string, so be careful
                             
                             [dateFormatter setDateFormat:@"dd-MM-yyyy"];
                             
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:fecha];
                             
    partido.fecha = dateFromString;
    partido.rival = rival;
    partido.descripcion = descripcion;
    partido.hora = hora;
    partido.lugar  = lugar;
    
    
    return partido;
}



@end
