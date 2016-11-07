// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TipoPartido.m instead.

#import "_TipoPartido.h"

const struct TipoPartidoAttributes TipoPartidoAttributes = {
	.descripcion = @"descripcion",
	.id = @"id",
};

const struct TipoPartidoRelationships TipoPartidoRelationships = {
	.partido = @"partido",
};

@implementation TipoPartidoID
@end

@implementation _TipoPartido

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TipoPartido" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TipoPartido";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TipoPartido" inManagedObjectContext:moc_];
}

- (TipoPartidoID*)objectID {
	return (TipoPartidoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic descripcion;

@dynamic id;

- (int16_t)idValue {
	NSNumber *result = [self id];
	return [result shortValue];
}

- (void)setIdValue:(int16_t)value_ {
	[self setId:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result shortValue];
}

- (void)setPrimitiveIdValue:(int16_t)value_ {
	[self setPrimitiveId:[NSNumber numberWithShort:value_]];
}

@dynamic partido;

@end

