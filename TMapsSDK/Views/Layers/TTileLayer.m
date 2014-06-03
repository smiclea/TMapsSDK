//
//  TTileLayer.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TTileLayer.h"
#import "TTile.h"
#import "TBounds.h"

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

//var zoom	 = this.map.getZoom(),
//bounds	 = this.map.getPixelBounds(),
//tileSize = this.options.tileSize;
//
//var tileBounds = new T.Bounds(
//                              bounds.min.divideBy(tileSize).floor(),
//                              bounds.max.divideBy(tileSize).floor()
//                              );
//
//this.tilesLoaded = 0;
//
//tileBounds.extend(tileBounds.min.add(new T.Point(-1, -1)));
//tileBounds.extend(tileBounds.max.add(new T.Point(1, 1)));
//
//this.addTileFromBounds(tileBounds);
//this.removeInvisibleTiles(tileBounds);

//- (void)renderTiles
//{
//    NSNumber *zoom = self.map.zoomLevel;
//    TBounds *bounds = self.map.pixelBounds;
//    unsigned tileSize = [TTile SIZE];
//}

- (void)renderTiles
{
    if (self.tiles.count == 10)
    {
        return;
    }
    
    for (int i = 0; i < 10; i++) {
        NSString *url = [NSString stringWithFormat:@"http://raster.maporama.com/maporama/6/2/1%d.png", i];
        
        TTile *tile = [[TTile alloc] initWithImageUrl:url positionOnScreen:[[TPoint alloc] initWithCGPoint:CGPointMake(i * [TTile SIZE], i * [TTile SIZE])]];
        [self addSubview:tile];
        [self.tiles addObject:tile];
    }
}

- (void)drawMapLayer
{
    [self renderTiles];
}

@end
