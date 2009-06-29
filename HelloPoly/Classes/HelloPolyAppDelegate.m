//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Jarod Luebbert on 6/19/09.
//  Copyright SIUE 2009. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

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
