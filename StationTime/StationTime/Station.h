//
//  Station.h
//  StationTime
//
//  Created by yangfei on 11-7-24.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Station : NSObject {
    NSString *stationId;
    NSString *name;
    float latitude;
    float longitude;
    float distance;
}

@property (copy) NSString *stationId;
@property (copy) NSString *name;
@property float latitude;
@property float longitude;
@property float distance;

@end
