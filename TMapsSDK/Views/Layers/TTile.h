//
//  TTile.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPoint.h"

@interface TTile : UIImageView

- (id)initWithImageUrl:(NSString *)imageUrl positionOnScreen:(TPoint *)position;

+ (unsigned)SIZE;
@end
