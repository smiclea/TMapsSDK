//
//  TTile.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTile : UIImageView

- (id)initWithImageUrl:(NSString *)imageUrl positionOnScreen:(CGPoint)position;

+ (unsigned)SIZE;
@end
