//
//  CodecsARC.m
//  JSONCompare
//
//  Created by Karl Stenerud on 10/29/11.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall remain in place
// in this source code.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "CodecsARC.h"

#import "KSJSON.h"

@implementation JSONCodec

- (NSString*) name
{
    NSAssert(NO, @"Subclass must implement %s", __PRETTY_FUNCTION__);
    return nil;
}

- (id) decodeString:(NSString*) string
{
    NSAssert(NO, @"Subclass must implement %s", __PRETTY_FUNCTION__);
    return nil;
}

- (NSString*) encodeContainer:(id) container
{
    NSAssert(NO, @"Subclass must implement %s", __PRETTY_FUNCTION__);
    return nil;
}

@end


@interface KSJSONCodec : JSONCodec @end
@implementation KSJSONCodec

- (NSString*) name
{
    return @"KSJSON";
}

- (id) decodeString:(NSString*) json
{
    NSError* error;
    id result = [KSJSON deserializeString:json error:&error];
    if(result == nil)
    {
        NSLog(@"%@", error);
    }
    return result;
}

- (NSString*) encodeContainer:(id) container
{
    return [KSJSON serializeObject:container error:nil];
}

@end


@implementation AllJSONCodecs

static NSArray* g_allCodecs;

+ (void) initialize
{
    g_allCodecs = [NSArray arrayWithObjects:
                    [[KSJSONCodec alloc] init],
                   nil];
}

+ (NSArray*) codecs
{
    return g_allCodecs;
}

@end