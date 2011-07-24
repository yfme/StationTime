//
//  Prediction.m
//  StationTime
//
//  Created by yangfei on 11-7-24.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import "Prediction.h"


@implementation Prediction
@synthesize destination, estimate;

- (void)dealloc {
    [destination release];
    [estimate release];
    [super dealloc];
}

@end
