//
//  TLatLng.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 02/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TLatLng.h"

@implementation TLatLng

- (id)initWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude
{
    self = [super init];
    
    self.latitude = latitude;
    self.longitude = longitude;
    
    return self;
}

- (NSNumber *)latitude
{
    if (!_latitude)
        _latitude = 0;

    return _latitude;
}

- (NSNumber *)longitude
{
    if (!_longitude)
        _longitude = 0;
    
    return _longitude;
}

@end
