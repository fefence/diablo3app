//
//  UseMineSettings.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 06.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "UseMineSettings.h"
#import "AppDelegate.h"
#import "KeyboardBar.h"
#import "UseMineResults.h"

@interface UseMineSettings ()

@end

@implementation UseMineSettings

@synthesize startingGem = _startingGem;
@synthesize desiredGem = _desiredGem;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize tableView = _tableView;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;

NSMutableArray *gemTypes;
NSMutableDictionary *gems;
KeyboardBar *bar;
CGPoint svos;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    svos = _tableView.contentOffset;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    gems = appDelegate.myGemsAvailable;
    int i;
    for (i = 0; i < gemTypes.count; i ++) {
        NSString * current = [gemTypes objectAtIndex:0];
        if (![current caseInsensitiveCompare:_startingGem] == NSOrderedSame) {
            [gemTypes removeObjectAtIndex:0];
        } else {
            break;
        }
    }
    
    for (i = gemTypes.count - 1; i >= 0; i --) {
        if (![[gemTypes objectAtIndex:i] caseInsensitiveCompare:_desiredGem] == NSOrderedSame) {
            [gemTypes removeObjectAtIndex:i];
        } else {
            break;
        }
    }
    
    NSString *key;
    for (i = 0; i < gemTypes.count; i ++) {
        key = [gemTypes objectAtIndex:i];
        if ([gems objectForKey:key] == nil) {
            [gems setValue:@"" forKey:key];
        }
    }
    
    bar = [KeyboardBar new];
    bar.fields = [[NSMutableArray alloc] init];
    for (i = 0; i < gemTypes.count - 1; i++) {
        [bar.fields addObject:[[UITextField alloc] init]];
    }
    bar.index = -1;
    bar.field = nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"GemSettingsRow";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    UITextField *available = (UITextField *)[cell viewWithTag:200];
    label.text = [gemTypes objectAtIndex:indexPath.row];
    NSNumber *val = [gems objectForKey:label.text];
    if (val == nil || [val integerValue] == 0) {
        available.text = @"";
    } else {
        available.text = [NSString stringWithFormat:@"%d", val.integerValue];
    }
    available.inputAccessoryView = bar;
    [bar.fields removeObjectAtIndex:indexPath.row];
    [bar.fields insertObject:available atIndex:indexPath.row];
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
    return [gemTypes count] - 1;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell *)textField.superview;
    UILabel *gemType = (UILabel *)[cell viewWithTag:100];
    NSNumber *tmp = [NSNumber numberWithInt:[textField.text integerValue]];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.myGemsAvailable setObject:tmp forKey:gemType.text];
    if (bar.field == nil && bar.index == -1) {
        [_tableView setContentOffset:svos animated:YES];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell *)textField.superview.superview;
    NSIndexPath *path = [_tableView indexPathForCell:cell];
    bar.index = path.row;
    [bar setField:textField];
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:_tableView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 60;
    [_tableView setContentOffset:pt animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    UseMineResults *next = [segue destinationViewController];
    next.pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
    next.pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
    next.tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;
    next.tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
    next.tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
    next.tomeOfSecretsPrice = _tomeOfSecretsPrice;
    next.gemTypes = gemTypes;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
