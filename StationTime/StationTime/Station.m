//
//  Station.m
//  StationTime
//
//  Created by yangfei on 11-7-24.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import "Station.h"


@implementation Station
@synthesize stationId, name, latitude, longitude, distance;

- (void) dealloc {
    [stationId release];
    [name release];
    [super dealloc];
}

@end
