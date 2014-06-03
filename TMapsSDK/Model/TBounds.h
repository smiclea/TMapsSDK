//
//  TBounds.h
//  TMapsSDK
//
//  Created by Sergiu on 03/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPoint.h"

@interface TBounds : NSObject

@property (nonatomic) TPoint *min;
@property (nonatomic) TPoint *max;

@end
