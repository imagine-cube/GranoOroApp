// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Jugador.h instead.

#import <CoreData/CoreData.h>

extern const struct JugadorAttributes {
	__unsafe_unretained NSString *apellido1;
	__unsafe_unretained NSString *apellido2;
	__unsafe_unretained NSString *cedula;
	__unsafe_unretained NSString *dorsal;
	__unsafe_unretained NSString *edad;
	__unsafe_unretained NSString *fechaIngreso;
	__unsafe_unretained NSString *fechaModificacion;
	__unsafe_unretained NSString *fechaNacimiento;
	__unsafe_unretained NSString *fechaSalida;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *posicion;
	__unsafe_unretained NSString *posicionAlternativa;
} JugadorAttributes;

extern const struct JugadorRelationships {
	__unsafe_unretained NSString *detallesJugador;
	__unsafe_unretained NSString *pago;
	__unsafe_unretained NSString *photo;
} JugadorRelationships;

@class DetallesJugador;
@class Pago;
@class Photo;

@interface JugadorID : NSManagedObjectID {}
@end

@interface _Jugador : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JugadorID* objectID;

@property (nonatomic, strong) NSString* apellido1;

//- (BOOL)validateApellido1:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* apellido2;

//- (BOOL)validateApellido2:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* cedula;

//- (BOOL)validateCedula:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* dorsal;

//- (BOOL)validateDorsal:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* edad;

//- (BOOL)validateEdad:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* fechaIngreso;

//- (BOOL)validateFechaIngreso:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* fechaModificacion;

//- (BOOL)validateFechaModificacion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* fechaNacimiento;

//- (BOOL)validateFechaNacimiento:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* fechaSalida;

//- (BOOL)validateFechaSalida:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* posicion;

//- (BOOL)validatePosicion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* posicionAlternativa;

//- (BOOL)validatePosicionAlternativa:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DetallesJugador *detallesJugador;

//- (BOOL)validateDetallesJugador:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *pago;

- (NSMutableSet*)pagoSet;

@property (nonatomic, strong) Photo *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _Jugador (PagoCoreDataGeneratedAccessors)
- (void)addPago:(NSSet*)value_;
- (void)removePago:(NSSet*)value_;
- (void)addPagoObject:(Pago*)value_;
- (void)removePagoObject:(Pago*)value_;

@end

@interface _Jugador (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveApellido1;
- (void)setPrimitiveApellido1:(NSString*)value;

- (NSString*)primitiveApellido2;
- (void)setPrimitiveApellido2:(NSString*)value;

- (NSString*)primitiveCedula;
- (void)setPrimitiveCedula:(NSString*)value;

- (NSString*)primitiveDorsal;
- (void)setPrimitiveDorsal:(NSString*)value;

- (NSString*)primitiveEdad;
- (void)setPrimitiveEdad:(NSString*)value;

- (NSDate*)primitiveFechaIngreso;
- (void)setPrimitiveFechaIngreso:(NSDate*)value;

- (NSDate*)primitiveFechaModificacion;
- (void)setPrimitiveFechaModificacion:(NSDate*)value;

- (NSDate*)primitiveFechaNacimiento;
- (void)setPrimitiveFechaNacimiento:(NSDate*)value;

- (NSDate*)primitiveFechaSalida;
- (void)setPrimitiveFechaSalida:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitivePosicion;
- (void)setPrimitivePosicion:(NSString*)value;

- (NSString*)primitivePosicionAlternativa;
- (void)setPrimitivePosicionAlternativa:(NSString*)value;

- (DetallesJugador*)primitiveDetallesJugador;
- (void)setPrimitiveDetallesJugador:(DetallesJugador*)value;

- (NSMutableSet*)primitivePago;
- (void)setPrimitivePago:(NSMutableSet*)value;

- (Photo*)primitivePhoto;
- (void)setPrimitivePhoto:(Photo*)value;

@end
