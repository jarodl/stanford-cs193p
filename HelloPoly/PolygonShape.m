//
//  PolygonShape.m
//  WhatATool

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (id)init {
	if ( self = [super init] ) {
		[self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
	}
	
	return self;
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if ( self = [super init] ) {
		[self setMinimumNumberOfSides:min];
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
	}
	
	return self;
}

- (void)setNumberOfSides:(int)value {
	if ( value > maximumNumberOfSides ) {
		NSLog(@"Invalid number of sides: %i is greater than the maximum of %i allowed", 
			  value, maximumNumberOfSides);
	}
	else if ( value < minimumNumberOfSides ) {
		NSLog(@"Invalid number of sides: %i is less than the minimum of %i allowed",
			  value, minimumNumberOfSides );
	}
	else
		numberOfSides = value;
}

- (void)setMinimumNumberOfSides:(int)value {
	if ( value > 2 )
		minimumNumberOfSides = value;
	else
		NSLog(@"Invalid minimum: %i is less than 2", value);
}

- (void)setMaximumNumberOfSides:(int)value {
	if ( value <= 12 )
		maximumNumberOfSides = value;
	else
		NSLog(@"Invalid maximum: %i is greater than 12", value);
}

- (float)angleInDegrees {
	return (180 * ([self numberOfSides] - 2) / [self numberOfSides]);
}

- (float)angleInRadians {
	return ( ([self angleInDegrees] / 180) * M_PI );
}

- (void)description {
	NSLog(@"Hello I am a %i-sided polygon (aka a %@) with angles of %0.0f degrees (%0.6f radians).", 
		  [self numberOfSides], [self name], [self angleInDegrees], [self angleInRadians]);
}

- (void)dealloc {
	// Do any cleanup that's necessary
	// . . .
	NSLog(@"%@ is being deallocated", [self name]);
	[super dealloc];
}

- (NSString *)name {
	NSMutableDictionary *names = [NSMutableDictionary dictionaryWithObjectsAndKeys:
						   @"Triangle", [NSNumber numberWithInt:3], @"Square", [NSNumber numberWithInt:4],
						   @"Pentagon", [NSNumber numberWithInt:5], @"Hexagon", [NSNumber numberWithInt:6],
						   @"Heptagon", [NSNumber numberWithInt:7], @"Octagon", [NSNumber numberWithInt:8],
						   @"Enneagon", [NSNumber numberWithInt:9], @"Decagon", [NSNumber numberWithInt:10],
						   @"Hendecagon", [NSNumber numberWithInt:11], @"Dodecagon", [NSNumber numberWithInt:12],
								  nil];
	return ([names objectForKey:[NSNumber numberWithInt:numberOfSides]]);
}



@end
