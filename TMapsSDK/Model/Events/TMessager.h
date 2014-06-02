//
//  TEventAggregator.h
//  TMapsSDK
//
//  Created by Sergiu Miclea on 02/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMessager : NSObject

+ (void)sendMessage:(NSString *)withName;
+ (void)sendMessage:(NSString *)withName withObject:(id)object;
+ (void)sendMessage:(NSString *)withName withObject:(id)object from:(id)from;
+ (void)listenToMessage:(NSString *)withName thenPerformSelector:(NSString *)selectorName onListener:(id)listener;

@end
