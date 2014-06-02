//
//  TTileLayer.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TTileLayer.h"
#import "TTile.h"

@interface TTileLayer()

@property (strong, nonatomic) NSMutableArray *tiles; //of TTile;

@end

@implementation TTileLayer

- (NSMutableArray *)tiles
{
    if (!_tiles)
        _tiles = [[NSMutableArray alloc] init];
    return _tiles;
}

- (void)renderTiles
{
    if (self.tiles.count == 10)
    {
        return;
    }
    
    for (int i = 0; i < 10; i++) {
        NSString *url = [NSString stringWithFormat:@"http://raster.maporama.com/maporama/6/2/1%d.png", i];

        TTile *tile = [[TTile alloc] initWithImageUrl:url positionOnScreen:CGPointMake(i * [TTile SIZE], i * [TTile SIZE])];
        [self addSubview:tile];
        [self.tiles addObject:tile];
    }
}

- (void)drawMapLayer
{
    [self renderTiles];
}

@end
