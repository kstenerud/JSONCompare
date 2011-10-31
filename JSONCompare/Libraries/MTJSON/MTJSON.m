//
//  MTJSON.m
//
//	MTJSON
//  Written by Adam Kirk.
//	Last Updated: 2/1/2011
//  Copyright 2011 Mysterious Trousers, LLC. All rights reserved.
//
//	Unicode decoding/encoding help received from Hedrobino
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "MTJSON.h"


@implementation MTJSON



+ (NSMutableArray *)MTJSONStringToObject:(NSString *)JSONString {
	NSMutableArray *root = [NSMutableArray array];
	NSMutableString *key = [NSMutableString string];
	NSMutableString *value = [NSMutableString string];
	BOOL keySwitch = YES;
	BOOL withinStringSwitch = NO;
	NSMutableArray *objectStack = [NSMutableArray array];
	id currentObject = root;
	
	for (int i = 0; i < JSONString.length; i ++) {
		
		// grab the next character
		unichar c = [JSONString characterAtIndex:i];
		
		// swap withinStringSwitch on double quotes
		if (c == '"') {
            
            // if it's an empty string
            unichar cNext = [JSONString characterAtIndex:i+1];
            if (!withinStringSwitch && cNext == '"') {
                c = keySwitch ? ':' : ',';
                i++;
            } else {
                withinStringSwitch = !withinStringSwitch;
                continue;
            }
		}
		
		// if we're not in a string and its a space or escaped character, ignore it
		if (!withinStringSwitch) {
			if (c == ' ') {
				continue;
			} else if (c == '\n') {
				continue;
			} else if (c == '\f') {
				continue;
			} else if (c == '\b') {
				continue;
			} else if (c == '\r') {
				continue;
			} else if (c == '\t') {
				continue;
			} 
		}
		
		// if array start
		if (c == '[' && !withinStringSwitch) {
			keySwitch = YES;
			NSMutableArray *array = [[NSMutableArray alloc] init]; // I do this so the autorelease pool doesn't get too big
			if ([currentObject isKindOfClass:[NSMutableDictionary class]]) {
				[currentObject setObject:array forKey:key];
				[key setString:@""];
			} else {
				[currentObject addObject:array];
			}
			[objectStack insertObject:currentObject atIndex:0];
			currentObject = array;
            [array release];
		}
		
		// if object start
		else if	(c == '{' && !withinStringSwitch) {
			keySwitch = YES;
			NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
			if ([currentObject isKindOfClass:[NSMutableDictionary class]]) {
				[currentObject setObject:dict forKey:key];
				[key setString:@""];
			} else {
				[currentObject addObject:dict];
			}
			[objectStack insertObject:currentObject atIndex:0];
			currentObject = dict;
            [dict release];
		}
		
		// if array end
		else if (c == ']' && !withinStringSwitch) {
			if (![key isEqualToString:@""]) {
				[currentObject addObject:key];
				[key setString:@""];
				value = [NSMutableString string];
			}
			
			currentObject = [objectStack objectAtIndex:0];
			[objectStack removeObjectAtIndex:0];
		}
		
		// if object end
		else if (c == '}' && !withinStringSwitch) {
			if (![value isEqualToString:@""] && ![key isEqualToString:@""]) {
				[currentObject setObject:value forKey:key];
				[key setString:@""];
				value = [NSMutableString string];
			}
            
			currentObject = [objectStack objectAtIndex:0];
			[objectStack removeObjectAtIndex:0];
		}		
		
		// if key end
		else if (c == ':' && !withinStringSwitch) {
			keySwitch = NO;
		}
		
		// if value end
		else if (c == ',' && !withinStringSwitch) {
			keySwitch = YES;
			
            if ([currentObject isKindOfClass:[NSMutableDictionary class]]) {
				if (![value isEqualToString:@""] && ![key isEqualToString:@""]) {
					[currentObject setObject:value forKey:key];
					[key setString:@""];
					value = [NSMutableString string];
				}
            }
            if ([currentObject isKindOfClass:[NSMutableArray class]]) {
				if (![key isEqualToString:@""]) {
					[currentObject addObject:key];
					[key setString:@""];
					value = [NSMutableString string];
				}
            }
		}
		
		// otherwise, add this character to key or value
		else {
			unichar ch = c;
			if (c == '\\' && withinStringSwitch) {
				ch = [JSONString characterAtIndex:i+1];
				switch ([JSONString characterAtIndex:++i])
				{
					case '"':
					case '\\':
					case '/': break;
					case 'b': ch = '\b'; break;
					case 'f': ch = '\f'; break;
					case 'n': ch = '\n'; break;
					case 'r': ch = '\r'; break;
					case 't': ch = '\t'; break;
					case 'u':
					{
                        ch = 0;
                        int hexes[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, -1, -1, -1, -1, -1, -1, -1, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf, };
						
						for (int shift = 12; shift >= 0; shift -= 4)
						{
							unichar nextChar = [JSONString characterAtIndex:++i];
							const int digit = hexes[nextChar - '0'];
							ch |= (digit << shift);
						}
					}
				}
			} else if (!withinStringSwitch) {
                
                // if its not in a string and not a number, true, false or null, its a syntax error. return nil.
                switch (c) {
                    case '0': break;
                    case '1': break;
                    case '2': break;
                    case '3': break;
                    case '4': break;
                    case '5': break;
                    case '6': break;
                    case '7': break;
                    case '8': break;
                    case '9': break;
                    case '-': break;
                    case '+': break;
                    case 'e': break;
                    case 'E': break;
                    case '.': break;
                    case 't': break;
                    case 'r': break;
                    case 'u': break;
                    case 'f': break;
                    case 'a': break;
                    case 'l': break;
                    case 's': break;
                    case 'n': break;
                    default:
						NSLog(@"Syntax error: Character: %c, Location: %d", c, i);
                        return nil;
                }
            }
			
			
			if (keySwitch) {
                [key appendString:[NSString stringWithCharacters:&ch length:1]];
			} else {
                [value appendString:[NSString stringWithCharacters:&ch length:1]];
			}
        }
	}
	
	return root;
}


+ (NSString *)MTJSONObjectToString:(id)JSONObject {
	NSMutableString *string = [NSMutableString string];
	if ([JSONObject isKindOfClass:[NSMutableArray class]]) {
		[string appendString:@"["];
		for (id object in JSONObject) {
			if ([object isKindOfClass:[NSMutableArray class]]) {
				[string appendString:[self MTJSONObjectToString:object]];
			}
			else if ([object isKindOfClass:[NSMutableDictionary class]]) {
				[string appendString:[self MTJSONObjectToString:object]];
			}
			else if ([object isKindOfClass:[NSString class]]) {
				object = [object stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
				object = [object stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
				[string appendFormat:@"\"%@\"", object];
			}
			[string appendString:@","];
		}
		NSRange noCommaRange;
		noCommaRange.location = string.length - 1;
		noCommaRange.length = 1;
		[string replaceOccurrencesOfString:@"," withString:@"" options:NSCaseInsensitiveSearch range:noCommaRange];
		[string appendString:@"]"];
	}
	
	if ([JSONObject isKindOfClass:[NSMutableDictionary class]]) {
		NSEnumerator *enumerator = [JSONObject keyEnumerator];
		[string appendString:@"{"];
		id key;
		while ((key = [enumerator nextObject])) {
			id object = [JSONObject objectForKey:key];
			if ([object isKindOfClass:[NSMutableArray class]] || [object isKindOfClass:[NSMutableDictionary class]]) {
				NSString *objectString = [self MTJSONObjectToString:object];
				key = [key stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
				key = [key stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
				[string appendFormat:@"\"%@\":%@", key, objectString];
			} else if ([object isKindOfClass:[NSString class]]) {
				object = [object stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
				object = [object stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
				key = [key stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
				key = [key stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
				[string appendFormat:@"\"%@\":\"%@\"", key, object];
			}
			[string appendString:@","];
		}
		NSRange noCommaRange;
		noCommaRange.location = string.length - 1;
		noCommaRange.length = 1;
		[string replaceOccurrencesOfString:@"," withString:@"" options:NSCaseInsensitiveSearch range:noCommaRange];
		[string appendString:@"}"];
	}
	return string;
}


@end
