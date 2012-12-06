//
//  GemCalcMainController.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 20.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemCalcMainController.h"
#import "AppDelegate.h"
#import "KeyboardBar.h"
#import "GemCalcSettingsController.h"
#import "UseMineSettings.h"
#import "QuartzCore/QuartzCore.h"

@interface GemCalcMainController ()

@end

@implementation GemCalcMainController
@synthesize tableView = _tableView;
@synthesize startingGem = _startingGem;
@synthesize desiredGem = _desiredGem;
@synthesize upradeMine = _upradeMine;
@synthesize amount = _amount;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize goCraftSettingsButton = _goCraftSettingsButton;
@synthesize goMineSettingsButton = _goMineSettingsButton;

KeyboardBar * bar;
NSMutableArray *gemTypes;
CGPoint offset;

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
    offset = [_tableView contentOffset];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    [_startingGem setDelegate:self];
    [_desiredGem setDelegate:self];
    [_startingGem setStringArray:gemTypes];
    [_desiredGem setStringArray:gemTypes];
    _amount.enabled = NO;
    [self hideAmountRow];
    [self initKeyboardBar];
    
}

-(void) initKeyboardBar {
    bar = [KeyboardBar new];
    NSMutableArray *fields;
    if (_upradeMine.isOn == YES) {
        fields = [[NSMutableArray alloc] initWithObjects:_pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    } else {
        fields = [[NSMutableArray alloc] initWithObjects:_amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    }
    int i;
    for (i = 0; i < fields.count; i ++) {
        [[fields objectAtIndex:i] setInputAccessoryView:bar];
    }
    bar.index = -1;
    bar.field = nil;
    [bar setFields:fields];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)editingDidEnd:(id)sender {
    if (bar.field == nil && bar.index == -1) {
        [_tableView setContentOffset:offset];
    }
}

- (IBAction)editingDidBegin:(id)sender {
    [bar setField:sender];
    [bar setIndex:[bar.fields indexOfObject:sender]];
    CGPoint pt;
    CGRect rc = [sender bounds];
    rc = [sender convertRect:rc toView:_tableView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 60;
    [_tableView setContentOffset:pt animated:YES];

}

- (IBAction)changeUpgradeMine:(UISwitch *)sender {
    if (sender.isOn == YES) {
        _amount.enabled = NO;
        _amount.alpha = 0.4;
        _goCraftSettingsButton.enabled = NO;
        _goCraftSettingsButton.hidden = YES;
        _goMineSettingsButton.enabled = YES;
        _goMineSettingsButton.hidden = NO;
        [self hideAmountRow];
        [self initKeyboardBar];
    } else {
        _amount.enabled = YES;
        _amount.alpha = 1;
        _goCraftSettingsButton.enabled = YES;
        _goCraftSettingsButton.hidden = NO;
        _goMineSettingsButton.enabled = NO;
        _goMineSettingsButton.hidden = YES;
        [self showAmountRow];
        [self initKeyboardBar];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
        if ([[segue identifier] isEqualToString:@"useMine"]) {
            UseMineSettings *next = [segue destinationViewController];
            next.startingGem = [_startingGem getString];
            next.desiredGem = [_desiredGem getString];
            next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
            next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
            next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
            next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
            next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
            next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
        } else {
            GemCalcSettingsController *next = [segue destinationViewController];
            next.startingGem = [_startingGem getString];
            next.desiredGem = [_desiredGem getString];
            next.amount = [_amount.text integerValue];
            next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
            next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
            next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
            next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
            next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
            next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
        }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

-(void)showAmountRow {
    [self.view viewWithTag:1000].hidden = NO;
    [_tableView reloadData];
}


-(void)hideAmountRow {
    [self.view viewWithTag:1000].hidden = YES;
    [_tableView reloadData];
}


- (void)viewDidUnload
{
    [self setStartingGem:nil];
    [self setDesiredGem:nil];
    [self setUpradeMine:nil];
    [self setAmount:nil];
    [self setPageOfJewelcraftingAvailable:nil];
    [self setPageOfJewelcraftingPrice:nil];
    [self setTomeOfJewelcraftingAvailable:nil];
    [self setTomeOfJewelcraftingPrice:nil];
    [self setTomeOfSecretsAvailable:nil];
    [self setTomeOfSecretsPrice:nil];
    [self setStartingGem:nil];
    [self setDesiredGem:nil];
    [self setTableView:nil];
    [self setGoCraftSettingsButton:nil];
    [self setGoMineSettingsButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
