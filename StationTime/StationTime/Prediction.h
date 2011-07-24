//
//  Prediction.h
//  StationTime
//
//  Created by yangfei on 11-7-24.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Prediction : NSObject {
    NSString *destination;
    NSString *estimate;
}

@property (copy) NSString *destination;
@property (copy) NSString *estimate;

@end
