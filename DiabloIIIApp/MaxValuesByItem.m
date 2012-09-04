//
//  MaxValuesByItem.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 02.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "MaxValuesByItem.h"
#import "AppDelegate.h"
#import "MaxValueByItemStatGroup.h"

@interface MaxValuesByItem ()

@end

@implementation MaxValuesByItem
@synthesize table = _table;

NSArray *tableData;

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
    tableData = [[NSArray alloc] initWithArray:appDelegate.maxValuesByItemData.allKeys];
	// Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ItemRow";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ItemRow" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }

    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"amulet14_barbarian_male.png"];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tableData count];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    MaxValueByItemStatGroup *next = [segue destinationViewController];
    next.item = sender.textLabel.text;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
