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
	int defaultNumOfSides = [[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfSides"];
	if (defaultNumOfSides == 0) defaultNumOfSides = 5;
	poly = [[PolygonShape alloc] initWithNumberOfSides:defaultNumOfSides minimumNumberOfSides:3 maximumNumberOfSides:12];
	[self updateInterface];
}

- (void)updateInterface {
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", [poly numberOfSides]];
	increaseButton.enabled = ([poly numberOfSides] < [poly maximumNumberOfSides]);
	decreaseButton.enabled = ([poly numberOfSides] > [poly minimumNumberOfSides]);
	polyView.poly = poly;
	[polyView setNeedsDisplay];
	// save to user defaults
	NSLog(@"Saving %i to defaults", numberOfSidesLabel.text.integerValue);
	[[NSUserDefaults standardUserDefaults] setInteger:numberOfSidesLabel.text.integerValue forKey:@"numberOfSides"];
}

@end
