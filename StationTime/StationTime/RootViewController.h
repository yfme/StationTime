//
//  RootViewController.h
//  StationTime
//
//  Created by yangfei on 11-7-23.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
    NSMutableArray *stations;
}

@property (nonatomic, retain) NSMutableArray *stations;

@end
