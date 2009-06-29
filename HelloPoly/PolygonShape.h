//
//  PolygonShape.h
//  WhatATool
#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject {
	// instance variables
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
- (void)setNumberOfSides:(int)value;
- (void)setMinimumNumberOfSides:(int)value;
- (void)setMaximumNumberOfSides:(int)value;
- (float)angleInDegrees;
- (float)angleInRadians;
- (NSString *)name;

// property declarations
@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

@end
