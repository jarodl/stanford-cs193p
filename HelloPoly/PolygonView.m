//
//  PolygonView.m
//  HelloPoly

#import "PolygonView.h"


@implementation PolygonView

@synthesize poly;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGRect bounds = [self bounds];
	NSArray *points = [PolygonView pointsForPolygonInRect:bounds numberOfSides:[poly numberOfSides]];
	
	CGContextBeginPath(context);
	
	for (NSValue *value in points) {
		CGPoint point = [value CGPointValue];
		if([points indexOfObject:value] == 0)
			CGContextMoveToPoint(context, point.x, point.y);
		else
			CGContextAddLineToPoint(context, point.x, point.y);
	}
	CGContextClosePath(context);
	// Draw the shape
	[[UIColor whiteColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextDrawPath(context, kCGPathFillStroke);
	// Draw the label
	UILabel *name = [[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(bounds) - 50, CGRectGetMidY(bounds) - 10, 100, 20) ] autorelease];
	[name setText:poly.name];
	[name setTextAlignment:UITextAlignmentCenter];
	[self addSubview:name];
	[self bringSubviewToFront:name];
}


- (void)dealloc {
    [super dealloc];
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result; 
}


@end
