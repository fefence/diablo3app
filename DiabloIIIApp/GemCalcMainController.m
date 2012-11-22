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

KeyboardBar * bar;
NSMutableArray *gemTypes;
float scrollOffsetY;

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
    gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    [_startingGem setDelegate:self];
    [_desiredGem setDelegate:self];
    [_startingGem setStringArray:gemTypes];
    [_desiredGem setStringArray:gemTypes];
    
    [self initKeyboardBar];
    bar.index = -1;
    bar.field = nil;
}

-(void) initKeyboardBar {
    bar = [KeyboardBar new];
    NSMutableArray *fields;
    if (_upradeMine.state == YES) {
        fields = [[NSMutableArray alloc] initWithObjects:_pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    } else {
        fields = [[NSMutableArray alloc] initWithObjects:_amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    }
    int i;
    for (i = 0; i < fields.count; i ++) {
        [[fields objectAtIndex:i] setInputAccessoryView:bar];
    }
    [bar setFields:fields];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)editingDidEnd:(id)sender {
    if (bar.field == nil && bar.index == -1) {
        [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}

- (IBAction)editingDidBegin:(id)sender {
    [bar setField:sender];
    [bar setIndex:[bar.fields indexOfObject:sender]];
    scrollOffsetY = _tableView.contentOffset.y;
    
    // Get a pointer to the text field's cell
    UITableViewCell *theTextFieldCell = (UITableViewCell *)[sender superview];
    
    // Get the text fields location
    CGPoint point = [theTextFieldCell convertPoint:theTextFieldCell.frame.origin toView:self.tableView];
    
    // Scroll to cell
    [self.tableView setContentOffset:CGPointMake(0, point.y - 12) animated: YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    //    if ([[segue identifier] isEqualToString:@"useMine"]) {
    //        UseMineSettings *next = [segue destinationViewController];
    //        next.startingGem = _startingGem.text;
    //        next.desiredGem = _desiredGem.text;
    //        next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
    //        next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
    //        next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
    //        next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
    //        next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
    //        next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
    //    } else {
    //        GemCalcSettingsController *next = [segue destinationViewController];
    //        next.startingGem = _startingGem.text;
    //        next.desiredGem = _desiredGem.text;
    //        next.amount = [_amount.text integerValue];
    //        next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
    //        next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
    //        next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
    //        next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
    //        next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
    //        next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
    //    }
    
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
