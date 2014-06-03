//
//  TPoint.h
//  TMapsSDK
//
//  Created by Sergiu on 03/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPoint : NSObject

@property (strong, nonatomic) NSNumber *x;
@property (strong, nonatomic) NSNumber *y;

- (id)initWithX:(NSNumber *)x y:(NSNumber *)y;
- (id)initWithCGPoint:(CGPoint)point;
- (id)initWithCGSize:(CGSize)size;
- (void)divideBy:(NSNumber *)value;

@end
