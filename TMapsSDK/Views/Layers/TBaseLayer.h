//
//  TBaseLayer.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMap.h"

@interface TBaseLayer : UIView
@property (strong, nonatomic) TMap *map;

- (id)initWithMap:(TMap *)map;
- (void)drawMapLayer;

@end
