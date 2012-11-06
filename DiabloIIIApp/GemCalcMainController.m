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
#import "PopoverView.h"

@interface GemCalcMainController ()

@end

@implementation GemCalcMainController
@synthesize tomeOfSecretsLabel = _tomeOfSecretsLabel;
@synthesize tomeOfJewelcraftingLabel = _tomeOfJewelcraftingLabel;
@synthesize mineButton = _mineButton;
@synthesize startingGem = _startingGem;
@synthesize desiredGem = _desiredGem;
@synthesize amount = _amount;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize gemTypes = _gemTypes;
@synthesize useMineFirst = _useMineFirst;
@synthesize fields = _fields;
@synthesize button = _button;
@synthesize pageOfJewelcraftingLabel = _pageOfJewelcraftingLabel;

KeyboardBar * bar;
//int animatedDis;

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
//    animatedDis = 0;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    [self initKeyboardBar];
    [_pageOfJewelcraftingLabel.layer setBorderColor: [[UIColor colorWithRed: 59/255 green: 25/255 blue: 29/255 alpha:1.0] CGColor]];
    [_pageOfJewelcraftingLabel.layer setBorderWidth: 1.0];
    [_tomeOfSecretsLabel.layer setBorderColor: [[UIColor colorWithRed: 59/255 green: 25/255 blue: 29/255 alpha:1.0] CGColor]];
    [_tomeOfSecretsLabel.layer setBorderWidth: 1.0];
    [_tomeOfJewelcraftingLabel.layer setBorderColor: [[UIColor colorWithRed: 59/255 green: 25/255 blue: 29/255 alpha:1.0] CGColor]];
    [_tomeOfJewelcraftingLabel.layer setBorderWidth: 1.0];
    _amount.enabled = NO;
    _button.hidden = YES;
    self.view.backgroundColor = [UIColor clearColor];
}

-(void) initKeyboardBar {
    bar = [KeyboardBar new];
    if (_amount.enabled) {
        _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    } else {
       _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil]; 
    }
    [bar setFields:_fields];
    bar.index = -1;
    int i;
    for (i = 0; i < [_fields count]; i ++) {
        [[_fields objectAtIndex:i] setInputAccessoryView: bar];
    }
}

- (void)viewDidUnload
{
    [self setStartingGem:nil];
    [self setDesiredGem:nil];
    [self setAmount:nil];
    [self setPageOfJewelcraftingAvailable:nil];
    [self setPageOfJewelcraftingPrice:nil];
    [self setTomeOfJewelcraftingAvailable:nil];
    [self setTomeOfJewelcraftingPrice:nil];
    [self setTomeOfSecretsAvailable:nil];
    [self setTomeOfSecretsPrice:nil];
    [self setUseMineFirst:nil];
    [self setButton:nil];
    [self setMineButton:nil];
    [self setPageOfJewelcraftingLabel:nil];
    [self setTomeOfSecretsLabel:nil];
    [self setTomeOfJewelcraftingLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeCurrentTextField:(UITextField *)sender {
    [self initKeyboardBar];
    [bar setField:sender];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    if ([[segue identifier] isEqualToString:@"useMine"]) {
        UseMineSettings *next = [segue destinationViewController];
        next.startingGem = _startingGem.text;
        next.desiredGem = _desiredGem.text;
        next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
        next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
        next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
        next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
        next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
        next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
    } else {
        GemCalcSettingsController *next = [segue destinationViewController];
        next.startingGem = _startingGem.text;
        next.desiredGem = _desiredGem.text;
        next.amount = [_amount.text integerValue];
        next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
        next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
        next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
        next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
        next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
        next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
    }
    
}

- (IBAction)scrollBack:(id)sender {
    if (_desiredGem.text.length > 0 && _startingGem.text.length >0) {
        [_button setEnabled:YES];
    }
  //  [self animateTextField:sender up:NO];
}

- (IBAction)useMineSwitch:(UISwitch *)sender {
    if (sender.on) {
        _mineButton.hidden = NO;
        _mineButton.enabled = YES;
        _button.hidden = YES;
        _button.enabled = NO;
        _amount.enabled = NO;
        _amount.alpha = 0.4;
        [self initKeyboardBar];
    } else {
        _mineButton.hidden = YES;
        _mineButton.enabled = NO;
        _button.hidden = NO;
        _button.enabled = YES;
        _amount.enabled = YES;
        _amount.alpha = 1.0;
        [self initKeyboardBar];
    }
}

- (IBAction)changeDropDown:(UITextField *)sender {
    [self initKeyboardBar];
  //  [self animateTextField:sender up:YES];
    [bar setField:sender];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_gemTypes removeAllObjects];
    [_gemTypes addObjectsFromArray:appDelegate.gemTypes];
    if (sender.tag == 0) {
        _startingGem.text = [_gemTypes objectAtIndex:0];
    } else if (sender.tag == 1) {
        if (_startingGem.text.length > 0) {
            int i;
            for (i = 0; i < _gemTypes.count; i ++) {
                NSString * current = [_gemTypes objectAtIndex:0];
                if (![current caseInsensitiveCompare:_startingGem.text] == NSOrderedSame) {
                    [_gemTypes removeObjectAtIndex:0];
                } else {
                    [_gemTypes removeObjectAtIndex:0];
                    break;
                }
            }
        }
        _desiredGem.text = [_gemTypes objectAtIndex:0];
    }
    [appDelegate.beans removeAllObjects];
    if (_startingGem.text.length > 0 && _desiredGem.text.length > 0) {
        _button.enabled = YES;
        _mineButton.enabled = YES;
    }
}


- (IBAction)dropDown:(UITextField *)sender {
    [self initKeyboardBar];
    CGPoint point = CGPointMake(sender.frame.origin.x + 40, sender.frame.origin.y + 80);
    [PopoverView showPopoverAtPoint:point inView:self.view withStringArray:_gemTypes delegate:self];
    [bar setField:sender];

}

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index {
    _startingGem.text = [_gemTypes objectAtIndex:index];
    [popoverView dismiss];
}
@end
