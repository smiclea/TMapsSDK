//
//  TLatLng.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 02/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLatLng : NSObject

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

- (id)initWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end
