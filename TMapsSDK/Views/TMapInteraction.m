//
//  TMapInteraction.m
//  TMapsSDK
//
//  Created by Sergiu on 03/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TMapInteraction.h"
#import "TMessager.h"
#import "TMapEvents.h"
#import "TPoint.h"

@interface TMapInteraction()

@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;

@end

@implementation TMapInteraction

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self setUpInteraction];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setUpInteraction];
    return self;
}

- (void)setUpInteraction
{
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
    
    [self addGestureRecognizer:self.panRecognizer];
}

- (void)panRecognized:(UIPanGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [self.panRecognizer translationInView:self];
        TPoint *point = [[TPoint alloc] initWithCGPoint:translation];
        [TMessager sendMessage:[TMapEvents MAP_IS_PANNING] withObject:point];
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        [TMessager sendMessage:[TMapEvents MAP_DID_PAN]];
    }
}


@end
