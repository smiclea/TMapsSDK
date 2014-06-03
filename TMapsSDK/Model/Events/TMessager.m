//
//  TEventAggregator.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 02/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//


#import "TMessager.h"

@implementation TMessager


static NSMutableArray * listeners; // of NSDictionary

+ (void)initialize
{
    listeners = [[NSMutableArray alloc] initWithCapacity:10];
}

+ (void)sendMessage:(NSString *)withName
{
    [self sendMessage:withName withObject:nil];
}

+ (void)sendMessage:(NSString *)withName withObject:(id)object
{
    [self sendMessage:withName withObject:object from:nil];
}

+ (void)sendMessage:(NSString *)withName withObject:(id)object from:(id)from
{
    for (int i = 0; i < listeners.count; i++) {
        NSDictionary *listener = (NSDictionary *)listeners[i];
        
        if ([listener valueForKey:@"messageName"] == withName)
        {
            SEL selector = NSSelectorFromString([listener valueForKey:@"selectorName"]);
            IMP imp = [[listener valueForKey:@"listener"] methodForSelector:selector];
            void (*func)(id, SEL, id) = (void *)imp;
            func([listener valueForKey:@"listener"], selector, object);
        }
    }
}

+ (void)listenToMessage:(NSString *)name thenPerformSelector:(NSString *)selectorName onListener:(id)listener
{
    NSDictionary *listenerData = @{@"messageName": name, @"listener": listener, @"selectorName": selectorName};
    [listeners addObject:listenerData];
}

@end
