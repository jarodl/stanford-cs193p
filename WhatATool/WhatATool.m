#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPolygonInfo() {
	PolygonShape *shape1 = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7 ];
	PolygonShape *shape2 = [[PolygonShape alloc] initWithNumberOfSides:6	minimumNumberOfSides:5 maximumNumberOfSides:9 ];
	PolygonShape *shape3 = [[PolygonShape alloc] initWithNumberOfSides:12	minimumNumberOfSides:9 maximumNumberOfSides:12 ];
	
	NSMutableArray *shapes = [NSMutableArray arrayWithObjects:shape1, shape2, shape3, nil];
	for (PolygonShape *element in shapes) {
		[element setNumberOfSides:10];
		[element description];
	}
	
	[shape1 release];
	[shape2 release];
	[shape3 release];
}

void PrintPathInfo() {
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	NSLog(@"My home folder is at '%@'", path);
	
	NSArray *pathComponents = [path pathComponents];
	for (NSString *element in pathComponents) {
		NSLog(element);
	}
}

void PrintProcessInfo() {
	NSString *processName = [[NSProcessInfo processInfo] processName];
	int processID = [[NSProcessInfo processInfo] processIdentifier];
	NSLog(@"Process Name: '%@' Process ID: '%i'", processName, processID);
}

void PrintBookmarkInfo() {
	NSMutableDictionary *bookmarks = 
		[NSMutableDictionary dictionaryWithObjectsAndKeys:
			[NSURL URLWithString:@"http://www.stanford.edu"], @"Stanford University",
			[NSURL URLWithString:@"http://www.apple.com"], @"Apple",
			[NSURL URLWithString:@"http://cs193p.stanford.edu"], @"CS193P",
			[NSURL URLWithString:@"http://itunes.stanford.edu"], @"Stanford on iTunes U",
			[NSURL URLWithString:@"http://stanfordshop.com"], @"Stanford Mall",
			nil
		 ];
	
	for (NSString *key in bookmarks) {
		if ([key hasPrefix:@"Stanford"])
			NSLog(@"Key: '%@' URL: '%@'", key, [bookmarks objectForKey: key]);
	}
}

void PrintIntrospectionInfo() {
	NSMutableArray *array =
		[NSMutableArray arrayWithObjects:
			@"THIS IS A STRING",
			[NSURL URLWithString:@"http://www.google.com"],
			[[NSMutableString alloc] initWithString:@"This is a mutable string"],
			[NSMutableDictionary dictionaryWithObjectsAndKeys: @"Jarod", @"is awesome", nil],
			[NSProcessInfo processInfo],
			nil
		 ];
	
	for (id myObject in array) {
		NSLog(@"Class name: %@", [myObject className]);
		NSLog(@"Is Member of NSString: %@", [myObject isMemberOfClass:[NSString class]] ? @"YES" : @"NO");
		NSLog(@"Is Kind of NSString: %@", [myObject isKindOfClass:[NSString class]] ? @"YES" : @"NO");
		
		SEL sel = @selector(lowercaseString);
		
		if ([myObject respondsToSelector:sel]) {
			NSLog(@"Responds to lowercaseString: YES");
			NSLog(@"lowercaseString is: %@", [myObject performSelector:sel]);
		}
		else {
			NSLog(@"Responds to lowercaseString: NO");
		}
		NSLog(@"================================");
	}
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();			// Section 1
	NSLog(@"################################");
	PrintProcessInfo();			// Section 2
	NSLog(@"################################");
	PrintBookmarkInfo();		// Section 3
	NSLog(@"################################");
	PrintIntrospectionInfo();	// Section 4
	NSLog(@"################################");
	PrintPolygonInfo();
	
    [pool drain];
    return 0;
}
