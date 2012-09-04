//
//  MaxValueByStatsItems.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 04.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "MaxValueByStatsItems.h"

@interface MaxValueByStatsItems ()

@end

@implementation MaxValueByStatsItems
@synthesize stat = _stat;
@synthesize items = _items;
NSArray *keys;

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
    keys = [_items allKeys];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"StatRow";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"StatRow" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    UILabel *stat = (UILabel *)[cell viewWithTag:100];
    stat.text = [keys objectAtIndex:indexPath.row];
    UILabel *val = (UILabel *)[cell viewWithTag:200];
    val.text = [_items objectForKey:stat.text];
    
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
    return _items.count;
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
