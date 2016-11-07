// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DetallesJugador.m instead.

#import "_DetallesJugador.h"

const struct DetallesJugadorAttributes DetallesJugadorAttributes = {
	.nota = @"nota",
};

const struct DetallesJugadorRelationships DetallesJugadorRelationships = {
	.jugador = @"jugador",
	.photo = @"photo",
};

@implementation DetallesJugadorID
@end

@implementation _DetallesJugador

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DetallesJugador" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DetallesJugador";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DetallesJugador" inManagedObjectContext:moc_];
}

- (DetallesJugadorID*)objectID {
	return (DetallesJugadorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic nota;

@dynamic jugador;

@dynamic photo;

@end

