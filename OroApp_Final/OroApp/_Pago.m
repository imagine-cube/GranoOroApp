// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pago.m instead.

#import "_Pago.h"

const struct PagoAttributes PagoAttributes = {
	.descripcion = @"descripcion",
	.fecha = @"fecha",
	.id = @"id",
	.monto = @"monto",
};

const struct PagoRelationships PagoRelationships = {
	.jugador = @"jugador",
	.partido = @"partido",
};

@implementation PagoID
@end

@implementation _Pago

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pago" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pago";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pago" inManagedObjectContext:moc_];
}

- (PagoID*)objectID {
	return (PagoID*)[super objectID];
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

@dynamic monto;

@dynamic jugador;

@dynamic partido;

@end

