//
//  RMtoGold.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 19.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "RMtoGold.h"
#import "KeyboardBar.h"

@interface RMtoGold ()

@end

@implementation RMtoGold
@synthesize button = _button;
@synthesize goldPrice = _goldPrice;
@synthesize priceInRMAH = _priceInRMAH;
@synthesize priceInGold = _priceInGold;
@synthesize itemsOrCommodities = _itemsOrCommodities;
@synthesize result = _result;
@synthesize inGold = _inGold;
@synthesize inMoney = _inMoney;
@synthesize inPaypal = _inPaypal;

KeyboardBar *bar;

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
    bar = [KeyboardBar new];
    NSMutableArray *fields = [[NSMutableArray alloc] initWithObjects:_goldPrice, _priceInRMAH, _priceInGold, nil];
    for (UITextField *f in fields) {
        f.inputAccessoryView = bar;
    }
    bar.fields = fields;
    bar.field = nil;
    bar.index = -1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)editingDidBegin:(UITextField *)sender {
    bar.field = sender;
}

- (IBAction)editingDidEnd:(id)sender {
    if (_priceInRMAH.text.length > 0 && _priceInGold.text.length > 0 && _goldPrice.text.length > 0) {
        _button.enabled = YES;
    } else {
        _button.enabled = NO;
    }
}

- (IBAction)calculate:(UIButton *)sender {
    float gold = _priceInGold.text.integerValue * 0.85;
    _inGold.text = [NSString stringWithFormat:@"%f", gold * _goldPrice.text.floatValue / 1000000];
    if (_itemsOrCommodities.selectedSegmentIndex == 0) {
        _inMoney.text = [NSString stringWithFormat:@"%f", _priceInRMAH.text.floatValue - 1];
    } else {
        _inMoney.text = [NSString stringWithFormat:@"%f", _priceInRMAH.text.floatValue * 0.85];
    }
    if (_inMoney.text.floatValue > _inGold.text.floatValue) {
        _inMoney.textColor = [UIColor redColor];
        _result.text = @"It is better to sell in RMAH";
        _inPaypal.text = [NSString stringWithFormat:@"%f", _inMoney.text.floatValue * 0.85];
    } else if (_inMoney.text.floatValue < _inGold.text.floatValue) {
        _inGold.textColor = [UIColor redColor];
        _result.text = @"It is better to sell in GAH";
        _inPaypal.text = [NSString stringWithFormat:@"%f", _inGold.text.floatValue * 0.85];
    } else {
        _result.text = @"It is the same";
        _inPaypal.text = [NSString stringWithFormat:@"%f", _inGold.text.floatValue * 0.85];
    }
}


- (void)viewDidUnload
{
    [self setGoldPrice:nil];
    [self setPriceInRMAH:nil];
    [self setPriceInGold:nil];
    [self setResult:nil];
    [self setItemsOrCommodities:nil];
    [self setInGold:nil];
    [self setInMoney:nil];
    [self setInPaypal:nil];
    [self setButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
