//
//  ViewController.m
//  JSONCompare
//
//  Created by Karl Stenerud on 10/29/11.
//  Copyright (c) 2011 Stenerud. All rights reserved.
//

#import "ViewController.h"
#import "CodecTestsARC.h"

@implementation ViewController


static NSString *g_json;
static id g_object;

+ (void) initialize
{
    NSString* path = [[NSBundle mainBundle] pathForResource: @"twitter_feed" ofType: @"json"];
    g_json = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    g_object = [CodecTestsARC decodeJSON:g_json];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)onTestEncoding:(id)sender
{
    [CodecTestsARC testEncode:g_object count:100];
}

- (IBAction)onTestDecoding:(id)sender
{
    [CodecTestsARC testDecode:g_json count:100];
}

@end
