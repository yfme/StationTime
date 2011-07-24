//
//  RootViewController.m
//  StationTime
//
//  Created by yangfei on 11-7-23.
//  Copyright 2011年 appxyz.com. All rights reserved.
//

#import "RootViewController.h"
#import <sqlite3.h>
#import "Station.h"

@implementation RootViewController
@synthesize stations, predictionController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //从静态数据库加载车站列表
    self.stations = [NSMutableArray array];
    
    sqlite3 *database;
    sqlite3_stmt *statement;
    
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"routesy" ofType:@"db"];
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        char *sql = "SELECT id, name, lat, lon FROM stations";
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            
            //迭代处理每一行
            while (sqlite3_step(statement) == SQLITE_ROW) {
                const char* station_id = (const char*)sqlite3_column_text(statement, 0);
                const char* station_name = (const char*)sqlite3_column_text(statement, 1);
                double lat = sqlite3_column_double(statement, 2);
                double lon = sqlite3_column_double(statement, 3);
                
                Station *station = [[Station alloc] init];
                station.stationId = [NSString stringWithUTF8String:station_id];
                station.name = [NSString stringWithUTF8String:station_name];
                station.latitude = lat;
                station.longitude = lon;
                
                [self.stations addObject:station];
                [station release];
            }
            // This is in the book, but not in the sample and the compiler hates it.
			// so out it goes
			//sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stations count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"station";
	Station *station = [self.stations objectAtIndex:indexPath.row];
	
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Set up the cell.
	cell.textLabel.text = station.name;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Station *selectionStation = [self.stations objectAtIndex:indexPath.row];
    self.predictionController.station = selectionStation;
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:self.predictionController animated:YES];
	
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
