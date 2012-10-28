//
//  GemCalcSettingsController.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 24.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemCalcSettingsController.h"
#import "GemCalcMainController.h"
#import "GemBean.h"
#import "KeyboardBar.h"
#import "GemCalcResults.h"
#import "AppDelegate.h"
#import "UIView+FormScroll.h"


@interface GemCalcSettingsController ()

@end

@implementation GemCalcSettingsController
@synthesize startingGem = _startingGem;
@synthesize desiredGem = _desiredGem;
@synthesize amount = _amount;
@synthesize tableView = _tableView;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;

int animatedDis;
NSMutableArray *gemTypes;
CGPoint svos;

NSMutableDictionary *beans;

KeyboardBar *bar;


- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    svos = _tableView.contentOffset;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    beans = appDelegate.beans;
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
        if ([beans objectForKey:key] == nil) {
            GemBean *tmp = [[GemBean alloc] init];
            tmp.AHPrice = 0;
            tmp.available = 0;
            [beans setValue:tmp forKey:key];
        }
    }
    
    bar = [KeyboardBar new];
    bar.fields = [[NSMutableArray alloc] init];
    for (i = 0; i < gemTypes.count - 1; i ++) {
        [bar.fields addObject:[[UITextField alloc] init]];
        [bar.fields addObject:[[UITextField alloc] init]];
    }
    bar.field = nil;
    bar.index = -1;
    self.view.backgroundColor = [UIColor clearColor];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gemTypes count] - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *myLabel = (UILabel *)[cell viewWithTag:300];
    UITextField *availableInput = (UITextField *) [cell viewWithTag:100];
    UITextField *priceInput = (UITextField *) [cell viewWithTag:200];
    availableInput.inputAccessoryView = bar;
    availableInput.delegate = self;
    priceInput.inputAccessoryView = bar;
    priceInput.delegate = self;
    NSString * tmp = [gemTypes objectAtIndex:indexPath.row];
    GemBean *bean = [beans objectForKey:tmp];
    if (bean) {
        if (bean.AHPrice > 0) {
            priceInput.text = [NSString stringWithFormat:@"%ld", bean.AHPrice];
        } else {
            priceInput.text = @"";
        }
        if (bean.available > 0) {
            availableInput.text = [NSString stringWithFormat:@"%ld", bean.available];
        } else {
            availableInput.text = @"";
        }
    } else {
        priceInput.text = @"";
        availableInput.text = @"";
    }
    myLabel.text = tmp;
    NSLog(@"row for %@ %d", tmp, indexPath.row);
    [bar.fields removeObjectAtIndex:indexPath.row * 2 + 1];
    [bar.fields insertObject:priceInput atIndex:indexPath.row * 2 + 1];
    [bar.fields removeObjectAtIndex:indexPath.row * 2];
    [bar.fields insertObject:availableInput atIndex:indexPath.row * 2];
    
    return cell;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell *)textField.superview.superview;
    NSIndexPath *path = [_tableView indexPathForCell:cell];
    if (textField.tag == 100) {
        bar.index = path.row * 2;
    } else {
        bar.index = path.row * 2 + 1;
    }
    [bar setField:textField];
    
    //[_tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:_tableView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 60;
    [_tableView setContentOffset:pt animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell *)textField.superview;
    UILabel *gemType = (UILabel *)[cell viewWithTag:300];
    GemBean *bean = [beans objectForKey:gemType.text];
    if (!bean) {
        bean = [[GemBean alloc] init];
    }
    if (textField.tag == 100) {
        bean.available = [textField.text integerValue];
    } else if (textField.tag == 200) {
        bean.AHPrice = [textField.text integerValue];
    }
    [beans setValue:bean forKey:gemType.text];
    if (bar.field == nil && bar.index == -1) {
        [_tableView setContentOffset:svos animated:YES];
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    GemCalcResults *next = [segue destinationViewController];
    next.startingGem = _startingGem;
    next.desiredGem = _desiredGem;
    next.amount = _amount;
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
    [self setView:nil];
    [self setTableView:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@end
