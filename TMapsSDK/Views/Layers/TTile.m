//
//  TTile.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TTile.h"

@implementation TTile

- (id)initWithImageUrl:(NSString *)imageUrl positionOnScreen:(CGPoint)position
{
    self = [super initWithFrame:CGRectMake(position.x, position.y, [TTile SIZE], [TTile SIZE])];
    
    [self downloadImageWithURL:[NSURL URLWithString:imageUrl] completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            self.image = image;
        }
    }];
    
    return self;
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}

+ (unsigned)SIZE
{
    return 256;
}

@end
