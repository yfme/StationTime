//
//  PredictionTableViewController.h
//  StationTime
//
//  Created by yangfei on 11-7-24.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

@interface PredictionTableViewController : UITableViewController {
    
    Station *station;
    
}

@property (nonatomic, retain) Station *station;

@end
