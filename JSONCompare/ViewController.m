//
//  ViewController.m
//  JSONCompare
//
//  Created by Karl Stenerud on 10/29/11.
//  Copyright (c) 2011 Stenerud. All rights reserved.
//

#import "ViewController.h"
#import "CodecTests.h"

@implementation ViewController


static NSString *g_json;
static id g_object;

+ (void) initialize
{
    NSString* path = [[NSBundle mainBundle] pathForResource: @"twitter_feed" ofType: @"json"];
    g_json = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    g_object = [[CodecTests decodeJSON:g_json] retain];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)onTestEncoding:(id)sender
{
    [CodecTests testEncode:g_object count:100];
}

- (IBAction)onTestDecoding:(id)sender
{
    [CodecTests testDecode:g_json count:100];
}

@end
