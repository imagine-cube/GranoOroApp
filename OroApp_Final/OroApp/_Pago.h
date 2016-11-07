// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pago.h instead.

#import <CoreData/CoreData.h>

extern const struct PagoAttributes {
	__unsafe_unretained NSString *descripcion;
	__unsafe_unretained NSString *fecha;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *monto;
} PagoAttributes;

extern const struct PagoRelationships {
	__unsafe_unretained NSString *jugador;
	__unsafe_unretained NSString *partido;
} PagoRelationships;

@class Jugador;
@class Partido;

@interface PagoID : NSManagedObjectID {}
@end

@interface _Pago : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PagoID* objectID;

@property (nonatomic, strong) NSString* descripcion;

//- (BOOL)validateDescripcion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* fecha;

//- (BOOL)validateFecha:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDecimalNumber* monto;

//- (BOOL)validateMonto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Jugador *jugador;

//- (BOOL)validateJugador:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Partido *partido;

//- (BOOL)validatePartido:(id*)value_ error:(NSError**)error_;

@end

@interface _Pago (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDescripcion;
- (void)setPrimitiveDescripcion:(NSString*)value;

- (NSDate*)primitiveFecha;
- (void)setPrimitiveFecha:(NSDate*)value;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSDecimalNumber*)primitiveMonto;
- (void)setPrimitiveMonto:(NSDecimalNumber*)value;

- (Jugador*)primitiveJugador;
- (void)setPrimitiveJugador:(Jugador*)value;

- (Partido*)primitivePartido;
- (void)setPrimitivePartido:(Partido*)value;

@end
