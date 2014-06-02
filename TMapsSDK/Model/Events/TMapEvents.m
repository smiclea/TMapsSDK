//
//  TMapEvents.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 02/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TMapEvents.h"

@implementation TMapEvents

+ (NSString *)MAP_IS_PANNING
{
    return @"mapIsPanning";
}

+ (NSString *)MAP_DID_PAN
{
    return @"mapDidPan";
}

+ (NSString *)MAP_LOCATION_SET
{
    return @"mapLocationSet";
}

+ (NSString *)MAP_ZOOM_SET
{
    return @"mapZoomSet";
}

@end
