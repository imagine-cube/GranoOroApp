// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Partido.h instead.

#import <CoreData/CoreData.h>

extern const struct PartidoAttributes {
	__unsafe_unretained NSString *descripcion;
	__unsafe_unretained NSString *fecha;
	__unsafe_unretained NSString *hora;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *lugar;
	__unsafe_unretained NSString *rival;
} PartidoAttributes;

extern const struct PartidoRelationships {
	__unsafe_unretained NSString *pagos;
	__unsafe_unretained NSString *tipo;
} PartidoRelationships;

@class Pago;
@class TipoPartido;

@interface PartidoID : NSManagedObjectID {}
@end

@interface _Partido : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PartidoID* objectID;

@property (nonatomic, strong) NSString* descripcion;

//- (BOOL)validateDescripcion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* fecha;

//- (BOOL)validateFecha:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* hora;

//- (BOOL)validateHora:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lugar;

//- (BOOL)validateLugar:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* rival;

//- (BOOL)validateRival:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *pagos;

- (NSMutableSet*)pagosSet;

@property (nonatomic, strong) TipoPartido *tipo;

//- (BOOL)validateTipo:(id*)value_ error:(NSError**)error_;

@end

@interface _Partido (PagosCoreDataGeneratedAccessors)
- (void)addPagos:(NSSet*)value_;
- (void)removePagos:(NSSet*)value_;
- (void)addPagosObject:(Pago*)value_;
- (void)removePagosObject:(Pago*)value_;

@end

@interface _Partido (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDescripcion;
- (void)setPrimitiveDescripcion:(NSString*)value;

- (NSDate*)primitiveFecha;
- (void)setPrimitiveFecha:(NSDate*)value;

- (NSString*)primitiveHora;
- (void)setPrimitiveHora:(NSString*)value;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSString*)primitiveLugar;
- (void)setPrimitiveLugar:(NSString*)value;

- (NSString*)primitiveRival;
- (void)setPrimitiveRival:(NSString*)value;

- (NSMutableSet*)primitivePagos;
- (void)setPrimitivePagos:(NSMutableSet*)value;

- (TipoPartido*)primitiveTipo;
- (void)setPrimitiveTipo:(TipoPartido*)value;

@end
