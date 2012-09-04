//
//  MaxValueByItemStatGroup.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 02.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "MaxValueByItemStatGroup.h"
#import "AppDelegate.h"
#import "MaxValueByItemStatsValues.h"

@interface MaxValueByItemStatGroup ()

@end

@implementation MaxValueByItemStatGroup

@synthesize item;

NSArray *statsGroups;
NSDictionary *tmp;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    tmp = [appDelegate.maxValuesByItemData objectForKey:item];
    statsGroups = tmp.allKeys;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return statsGroups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"StatsGroup";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [statsGroups objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    MaxValueByItemStatsValues *next = [segue destinationViewController];
    next.statsGroup = sender.textLabel.text;
    next.stats = [tmp objectForKey:next.statsGroup];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
