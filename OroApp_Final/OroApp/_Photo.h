// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Photo.h instead.

#import <CoreData/CoreData.h>

extern const struct PhotoAttributes {
	__unsafe_unretained NSString *imageFile;
} PhotoAttributes;

extern const struct PhotoRelationships {
	__unsafe_unretained NSString *detallesJugador;
	__unsafe_unretained NSString *jugador;
} PhotoRelationships;

@class DetallesJugador;
@class Jugador;

@interface PhotoID : NSManagedObjectID {}
@end

@interface _Photo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PhotoID* objectID;

@property (nonatomic, strong) NSData* imageFile;

//- (BOOL)validateImageFile:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DetallesJugador *detallesJugador;

//- (BOOL)validateDetallesJugador:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Jugador *jugador;

//- (BOOL)validateJugador:(id*)value_ error:(NSError**)error_;

@end

@interface _Photo (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageFile;
- (void)setPrimitiveImageFile:(NSData*)value;

- (DetallesJugador*)primitiveDetallesJugador;
- (void)setPrimitiveDetallesJugador:(DetallesJugador*)value;

- (Jugador*)primitiveJugador;
- (void)setPrimitiveJugador:(Jugador*)value;

@end
