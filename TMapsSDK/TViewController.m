//
//  TViewController.m
//  TMapsSDK
//
//  Created by Sergiu Miclea on 01/06/14.
//  Copyright (c) 2014 Sergiu Miclea. All rights reserved.
//

#import "TViewController.h"
#import "TMap.h"
#import "TLatLng.h"

@interface TViewController ()

@property (weak, nonatomic) IBOutlet TMap *map;

@end

@implementation TViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpMap];
}

- (void)setUpMap
{
   // self.map.location = [[TLatLng alloc] initWithLatitude:@22 longitude:@5];
    //self.map.zoomLevel = @6;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
