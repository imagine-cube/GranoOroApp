// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DetallesJugador.h instead.

#import <CoreData/CoreData.h>

extern const struct DetallesJugadorAttributes {
	__unsafe_unretained NSString *nota;
} DetallesJugadorAttributes;

extern const struct DetallesJugadorRelationships {
	__unsafe_unretained NSString *jugador;
	__unsafe_unretained NSString *photo;
} DetallesJugadorRelationships;

@class Jugador;
@class Photo;

@interface DetallesJugadorID : NSManagedObjectID {}
@end

@interface _DetallesJugador : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DetallesJugadorID* objectID;

@property (nonatomic, strong) NSString* nota;

//- (BOOL)validateNota:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Jugador *jugador;

//- (BOOL)validateJugador:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Photo *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _DetallesJugador (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveNota;
- (void)setPrimitiveNota:(NSString*)value;

- (Jugador*)primitiveJugador;
- (void)setPrimitiveJugador:(Jugador*)value;

- (Photo*)primitivePhoto;
- (void)setPrimitivePhoto:(Photo*)value;

@end
