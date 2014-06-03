//
//  TBaseLayer.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TBaseLayer.h"
#import "TMessager.h"
#import "TMapEvents.h"
#import "TLatLng.h"
#import "TPoint.h"

@interface TBaseLayer()

@property (nonatomic) CGPoint currentPosition;

@end

@implementation TBaseLayer

- (id)initWithMap:(TMap *)map // designated initializer
{
    self = [self initWithFrame:CGRectMake(0, 0, map.bounds.size.width, map.bounds.size.height)];
    self.map = map;
    [self addListeners];
    return self;
}

- (void)drawMapLayer{} // override

- (void)addListeners
{
    [TMessager listenToMessage:[TMapEvents MAP_IS_PANNING] thenPerformSelector:@"mapIsPanning:" onListener:self];
    [TMessager listenToMessage:[TMapEvents MAP_DID_PAN] thenPerformSelector:@"mapDidPan" onListener:self];
    [TMessager listenToMessage:[TMapEvents MAP_LOCATION_SET] thenPerformSelector:@"mapLocationSet:" onListener:self];
    [TMessager listenToMessage:[TMapEvents MAP_ZOOM_SET] thenPerformSelector:@"mapZoomSet:" onListener:self];
}

// Message handlers

- (void)mapIsPanning:(TPoint *)translation
{
    self.transform = CGAffineTransformMakeTranslation(self.currentPosition.x + [translation.x floatValue], self.currentPosition.y + [translation.y floatValue]);
}

- (void)mapDidPan
{
    self.currentPosition = CGPointMake(self.transform.tx, self.transform.ty);
    [self drawMapLayer];
}

- (void)mapLocationSet:(TLatLng *)location
{
    [self drawMapLayer];
}

- (void)mapZoomSet:(NSNumber *)zoom
{
    [self drawMapLayer];
}

@end
