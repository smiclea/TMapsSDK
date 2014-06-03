//
//  TPoint.m
//  TMapsSDK
//
//  Created by Sergiu on 03/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TPoint.h"

@implementation TPoint

- (id)initWithX:(NSNumber *)x y:(NSNumber *)y
{
    self = [super init];
    
    self.x = x;
    self.y = y;
    
    return self;
}

- (id)initWithCGPoint:(CGPoint)point
{
    self = [self initWithX:[NSNumber numberWithFloat:point.x] y:[NSNumber numberWithFloat:point.x]];
    return self;
}

- (id)initWithCGSize:(CGSize)size
{
    self = [self initWithCGPoint:CGPointMake(size.width, size.height)];
    return self;
}

- (void)divideBy:(NSNumber *)value
{
    self.x =[NSNumber numberWithFloat:[self.x floatValue] / [value floatValue]];
    self.y =[NSNumber numberWithFloat:[self.y floatValue] / [value floatValue]];
}

@end
