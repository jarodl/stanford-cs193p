#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
	[poly setNumberOfSides:[poly numberOfSides] - 1];
	[self updateInterface];
}

- (IBAction)increase {
	[poly setNumberOfSides:[poly numberOfSides] + 1];
	[self updateInterface];
}

- (void)awakeFromNib {
	poly = [[PolygonShape alloc] initWithNumberOfSides:numberOfSidesLabel.text.integerValue minimumNumberOfSides:3 maximumNumberOfSides:12];
}

- (void)updateInterface {
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", [poly numberOfSides]];
	increaseButton.enabled = ([poly numberOfSides] < [poly maximumNumberOfSides]);
	decreaseButton.enabled = ([poly numberOfSides] > [poly minimumNumberOfSides]);
	polyView.poly = poly;
	[polyView setNeedsDisplay];
	// save to user defaults
	[[NSUserDefaults standardUserDefaults] setObject:numberOfSidesLabel.text forKey:@"numberOfSides"];
}

@end
