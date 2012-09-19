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
@synthesize goldPrice = _goldPrice;
@synthesize priceInRMAH = _priceInRMAH;
@synthesize priceInGold = _priceInGold;
@synthesize result = _result;

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

}

- (IBAction)calculate:(UIButton *)sender {
    float goldToMoney = [_priceInGold.text integerValue]/1000000000 * [_goldPrice.text integerValue];
    
}


- (void)viewDidUnload
{
    [self setGoldPrice:nil];
    [self setPriceInRMAH:nil];
    [self setPriceInGold:nil];
    [self setResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
