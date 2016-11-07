// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Jugador.m instead.

#import "_Jugador.h"

const struct JugadorAttributes JugadorAttributes = {
	.apellido1 = @"apellido1",
	.apellido2 = @"apellido2",
	.cedula = @"cedula",
	.dorsal = @"dorsal",
	.edad = @"edad",
	.fechaIngreso = @"fechaIngreso",
	.fechaModificacion = @"fechaModificacion",
	.fechaNacimiento = @"fechaNacimiento",
	.fechaSalida = @"fechaSalida",
	.name = @"name",
	.posicion = @"posicion",
	.posicionAlternativa = @"posicionAlternativa",
};

const struct JugadorRelationships JugadorRelationships = {
	.detallesJugador = @"detallesJugador",
	.pago = @"pago",
	.photo = @"photo",
};

@implementation JugadorID
@end

@implementation _Jugador

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Jugador" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Jugador";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Jugador" inManagedObjectContext:moc_];
}

- (JugadorID*)objectID {
	return (JugadorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic apellido1;

@dynamic apellido2;

@dynamic cedula;

@dynamic dorsal;

@dynamic edad;

@dynamic fechaIngreso;

@dynamic fechaModificacion;

@dynamic fechaNacimiento;

@dynamic fechaSalida;

@dynamic name;

@dynamic posicion;

@dynamic posicionAlternativa;

@dynamic detallesJugador;

@dynamic pago;

- (NSMutableSet*)pagoSet {
	[self willAccessValueForKey:@"pago"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"pago"];

	[self didAccessValueForKey:@"pago"];
	return result;
}

@dynamic photo;

@end

