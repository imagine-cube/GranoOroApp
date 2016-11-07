// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Partido.m instead.

#import "_Partido.h"

const struct PartidoAttributes PartidoAttributes = {
	.descripcion = @"descripcion",
	.fecha = @"fecha",
	.hora = @"hora",
	.id = @"id",
	.lugar = @"lugar",
	.rival = @"rival",
};

const struct PartidoRelationships PartidoRelationships = {
	.pagos = @"pagos",
	.tipo = @"tipo",
};

@implementation PartidoID
@end

@implementation _Partido

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Partido" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Partido";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Partido" inManagedObjectContext:moc_];
}

- (PartidoID*)objectID {
	return (PartidoID*)[super objectID];
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

@dynamic fecha;

@dynamic hora;

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

@dynamic lugar;

@dynamic rival;

@dynamic pagos;

- (NSMutableSet*)pagosSet {
	[self willAccessValueForKey:@"pagos"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"pagos"];

	[self didAccessValueForKey:@"pagos"];
	return result;
}

@dynamic tipo;

@end

