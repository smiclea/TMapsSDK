//
//  TMap.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLatLng.h"
#import "TMapInteraction.h"
#import "TBounds.h"

@interface TMap : TMapInteraction

@property (strong, nonatomic) TLatLng *location;
@property (nonatomic, strong) NSNumber *zoomLevel;
@property (readonly, strong, nonatomic) TBounds *pixelBounds;
@end
