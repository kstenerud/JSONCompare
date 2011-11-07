//
//  CodecTestsARC.m
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

#import "CodecTestsARC.h"
#import "CodecsARC.h"

@implementation CodecTestsARC

+ (id) decodeJSON:(NSString*) json
{
    return [[AllJSONCodecs.codecs objectAtIndex:0] decodeString:json];
}

+ (void) testEncode:(id) container count:(unsigned int) count
{
    NSLog(@"=============================================");
    NSLog(@"======== Beginning encode comparison ========");
    NSLog(@"=============================================");
    NSLog(@"Iterations: %d", count);

    for(JSONCodec* codec in [AllJSONCodecs codecs])
    {
        bool success = YES;
        NSDate* start = [NSDate date];
        for(unsigned int i = 0; i < count; i++)
        {
            if([codec encodeContainer:container] == nil)
            {
                success = NO;
                break;
            }
        }
        NSDate* end = [NSDate date];
        if(!success)
        {
            NSLog(@"Codec %-10s failed", [codec.name UTF8String]);
        }
        else
        {
            NSLog(@"Codec %-10s completed in %2.3f", [codec.name UTF8String],
                  [end timeIntervalSinceDate: start]);
        }
    }
    NSLog(@"=============================================");
    NSLog(@"=========== End encode comparison ===========");
    NSLog(@"=============================================");
}

+ (void) testDecode:(NSString*) json count:(unsigned int) count
{
    NSLog(@"=============================================");
    NSLog(@"======== Beginning decode comparison ========");
    NSLog(@"=============================================");
    NSLog(@"Iterations: %d", count);
    
    for(JSONCodec* codec in [AllJSONCodecs codecs])
    {
        bool success = YES;
        NSDate* start = [NSDate date];
        for(unsigned int i = 0; i < count; i++)
        {
            if([codec decodeString:json] == nil)
            {
                success = NO;
                break;
            }
        }
        NSDate* end = [NSDate date];
        if(!success)
        {
            NSLog(@"Codec %-10s failed", [codec.name UTF8String]);
        }
        else
        {
            NSLog(@"Codec %-10s completed in %2.3f", [codec.name UTF8String],
                  [end timeIntervalSinceDate: start]);
        }
    }
    NSLog(@"=============================================");
    NSLog(@"=========== End decode comparison ===========");
    NSLog(@"=============================================");
}

@end
