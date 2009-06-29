#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonShape *poly;
	IBOutlet PolygonView *polyView;
}
- (IBAction)decrease;
- (IBAction)increase;
- (void)updateInterface;
@end
