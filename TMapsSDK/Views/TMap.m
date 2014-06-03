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
#import "TPoint.h"

@interface TMap()

@property (strong, nonatomic, readwrite) TBounds *pixelBounds;

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

//getCenterInPixels: function () {
//    return this.project(this.getViewportCenter(), this.getZoom());
//},

//calculateTopLeft: function () {
//    var half = this.getSize().divideBy(2);
//    var topLeft = this.getCenterInPixels().substract(half).substract(this.getLayersPos());
//    
//    return topLeft;
//},

//getPixelBounds: function () {
//    
//    var topLeft = this.calculateTopLeft();
//    return new T.Bounds(topLeft, topLeft.add(this.getSize()));
//},

- (TBounds *)pixelBounds
{
    TPoint *topLeft = [self calculateTopLeft];
    return _pixelBounds;
}

- (TPoint *)calculateTopLeft
{
    TPoint *half = [[TPoint alloc] initWithCGSize:self.bounds.size];
    [half divideBy:@2];
    //TPoint *topLeft = [self getCenterInPixels];
    
    return [[TPoint alloc] initWithX:0 y:0];
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
    TTileLayer *layer = [[TTileLayer alloc] initWithMap:self];
    [self addLayerToMap:layer];
}

- (void)addLayerToMap:(TBaseLayer *)layer
{
    [self addSubview:layer];
    [layer drawMapLayer];
}

@end
