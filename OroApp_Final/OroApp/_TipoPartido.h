// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TipoPartido.h instead.

#import <CoreData/CoreData.h>

extern const struct TipoPartidoAttributes {
	__unsafe_unretained NSString *descripcion;
	__unsafe_unretained NSString *id;
} TipoPartidoAttributes;

extern const struct TipoPartidoRelationships {
	__unsafe_unretained NSString *partido;
} TipoPartidoRelationships;

@class Partido;

@interface TipoPartidoID : NSManagedObjectID {}
@end

@interface _TipoPartido : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TipoPartidoID* objectID;

@property (nonatomic, strong) NSString* descripcion;

//- (BOOL)validateDescripcion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Partido *partido;

//- (BOOL)validatePartido:(id*)value_ error:(NSError**)error_;

@end

@interface _TipoPartido (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDescripcion;
- (void)setPrimitiveDescripcion:(NSString*)value;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (Partido*)primitivePartido;
- (void)setPrimitivePartido:(Partido*)value;

@end
