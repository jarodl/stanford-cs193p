//
//  Assignment1AAppDelegate.m
//  Assignment1A
//
//  Created by Jarod Luebbert on 6/14/09.
//  Copyright SIUE 2009. All rights reserved.
//

#import "Assignment1AAppDelegate.h"

@implementation Assignment1AAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
