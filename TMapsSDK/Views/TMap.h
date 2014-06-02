//
//  TMap.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLatLng.h"

@interface TMap : UIView

@property (strong, nonatomic) TLatLng *location;
@property (nonatomic, strong) NSNumber *zoomLevel;

@end
