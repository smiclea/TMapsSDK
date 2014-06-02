//
//  TMapEvents.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 02/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMapEvents : NSObject

+ (NSString *)MAP_IS_PANNING;
+ (NSString *)MAP_DID_PAN;
+ (NSString *)MAP_LOCATION_SET;
+ (NSString *)MAP_ZOOM_SET;

@end
