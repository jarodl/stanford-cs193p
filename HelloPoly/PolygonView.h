//
//  PolygonView.h
//  HelloPoly

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
	IBOutlet PolygonShape *poly;
}

@property (retain) IBOutlet PolygonShape *poly;

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
