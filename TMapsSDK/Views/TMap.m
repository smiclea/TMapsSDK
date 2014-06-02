//
//  TMap.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TMap.h"
#import "TTileLayer.h"
#import "TBaseLayer.h"
#import "TMessager.h"
#import "TMapEvents.h"

@interface TMap()

@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;

@end

@implementation TMap

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self setUpView];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setUpView];
    return self;
}

- (void)setLocation:(TLatLng *)location
{
    _location = location;
    
    [TMessager sendMessage:[TMapEvents MAP_LOCATION_SET] withObject:location];
}

- (void)setZoomLevel:(NSNumber *)zoomLevel
{
    _zoomLevel = zoomLevel;
    
    [TMessager sendMessage:[TMapEvents MAP_ZOOM_SET] withObject:zoomLevel];
}

- (void)setUpView
{
    [self setUpGestureRecognizers];
    
    TTileLayer *layer = [[TTileLayer alloc] initWithMap:self];
    [self addLayerToMap:layer];
}

- (void)setUpGestureRecognizers
{
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
    
    [self addGestureRecognizer:self.panRecognizer];
}

- (void)panRecognized:(UIPanGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [self.panRecognizer translationInView:self];
        [TMessager sendMessage:[TMapEvents MAP_IS_PANNING] withObject:[NSValue valueWithCGPoint:translation] from:self];
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        [TMessager sendMessage:[TMapEvents MAP_DID_PAN]];
    }
}

- (void)addLayerToMap:(TBaseLayer *)layer
{
    [self addSubview:layer];
    [layer drawMapLayer];
}

@end
