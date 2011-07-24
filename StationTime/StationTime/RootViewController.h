//
//  RootViewController.h
//  StationTime
//
//  Created by yangfei on 11-7-23.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PredictionTableViewController.h"

@interface RootViewController : UITableViewController {
    NSMutableArray *stations;
    PredictionTableViewController *predictionController;
}

@property (nonatomic, retain) NSMutableArray *stations;
@property (nonatomic, retain) IBOutlet PredictionTableViewController *predictionController;

@end
