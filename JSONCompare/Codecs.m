//
//  Codecs.m
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

#import "Codecs.h"

#import "KSJSON.h"
#import "YAJL.h"
#import "CJSONDeserializer.h"
#import "CJSONSerializer.h"
#import "MTJSON.h"
#import "JSONKit.h"
#import "SZJsonParser.h"
#import "SBJson.h"
#import "NSDictionary+BSJSONAdditions.h"
#import "NSArray+BSJSONAdditions.h"
#import "BSJSONEncoder.h"

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


@interface JSONKitCodec : JSONCodec @end
@implementation JSONKitCodec

- (NSString*) name
{
    return @"JSONKit";
}

- (id) decodeString:(NSString*) json
{
    return [json objectFromJSONString];
}

- (NSString*) encodeContainer:(id) container
{
    return [container JSONString];
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
    return [KSJSON deserializeString:json];
}

- (NSString*) encodeContainer:(id) container
{
    return [KSJSON serializeObject:container];
}

@end


@interface YAJLCodec : JSONCodec @end
@implementation YAJLCodec

- (NSString*) name
{
    return @"YAJL";
}

- (id) decodeString:(NSString*) json
{
    return [json yajl_JSON];
}

- (NSString*) encodeContainer:(id) container
{
    YAJLGen* gen = [[YAJLGen alloc] initWithGenOptions:YAJLGenOptionsNone indentString:nil];
    [gen object:container];
    return [gen buffer];
}

@end


@interface TouchJSONCodec : JSONCodec @end
@implementation TouchJSONCodec

- (NSString*) name
{
    return @"TouchJSON";
}

- (id) decodeString:(NSString*) json
{
    NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    return [[CJSONDeserializer deserializer] deserializeAsArray:jsonData error: nil];
}

- (NSString*) encodeContainer:(id) container
{
    // Just return it as NSData...
    NSError* error;
    return [[CJSONSerializer serializer] serializeObject:container error:&error];
}

@end


@interface MTJSONCodec : JSONCodec @end
@implementation MTJSONCodec

- (NSString*) name
{
    return @"MTJSON";
}

- (id) decodeString:(NSString*) json
{
    return [MTJSON MTJSONStringToObject:json];
}

- (NSString*) encodeContainer:(id) container
{
    return [MTJSON MTJSONObjectToString:container];
}

@end


@interface SZJSONCodec : JSONCodec @end
@implementation SZJSONCodec

- (NSString*) name
{
    return @"SZJSON";
}

- (id) decodeString:(NSString*) json
{
    return [json jsonObject];
}

- (NSString*) encodeContainer:(id) container
{
    return nil;
}

@end


@interface SBJSONCodec : JSONCodec @end
@implementation SBJSONCodec

- (NSString*) name
{
    return @"SBJSON";
}

- (id) decodeString:(NSString*) json
{
    return [json JSONValue];
}

- (NSString*) encodeContainer:(id) container
{
    return [container JSONRepresentation];
}

@end


@interface BSJSONCodec : JSONCodec @end
@implementation BSJSONCodec

- (NSString*) name
{
    return @"BSJSON";
}

- (id) decodeString:(NSString*) json
{
    return [NSArray arrayWithJSONString:json];
}

- (NSString*) encodeContainer:(id) container
{
    return [BSJSONEncoder jsonStringForValue:container withIndentLevel:0];
}

@end


@implementation AllJSONCodecs

static NSArray* g_allCodecs;

+ (void) initialize
{
    g_allCodecs = [[NSArray arrayWithObjects:
                    [[JSONKitCodec alloc] init],
                    [[KSJSONCodec alloc] init],
                    [[YAJLCodec alloc] init],
                    [[TouchJSONCodec alloc] init],
                    [[MTJSONCodec alloc] init],
                    [[SZJSONCodec alloc] init],
                    [[SBJSONCodec alloc] init],
                    [[BSJSONCodec alloc] init],
                   nil] retain];
}

+ (NSArray*) codecs
{
    return g_allCodecs;
}

@end