//
//  GemDetailsController.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 28.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemDetailsController.h"
#import "AppDelegate.h"
#import "GemBean.h"

@interface GemDetailsController ()

@end

@implementation GemDetailsController
@synthesize gemType = _gemType;
@synthesize available = _available;
@synthesize AHPrice = _AHPrice;
@synthesize needed = _needed;
@synthesize needToCraft = _needToCraft;
@synthesize craftPrice = _craftPrice;
@synthesize craftPriceForOne = _craftPriceForOne;
@synthesize type = _type;
@synthesize cheaper = _cheaper;
@synthesize enough = _enough;
@synthesize bean = _bean;

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
    _gemType.text = _type;
    _available.text = [NSString stringWithFormat:@"%ld", _bean.available];
    _AHPrice.text = [NSString stringWithFormat:@"%ld", _bean.AHPrice];
    _needed.text = [NSString stringWithFormat:@"%ld", _bean.amountNeeded];
    _needToCraft.text = [NSString stringWithFormat:@"%ld", _bean.amountToCraft];
    _craftPrice.text = [NSString stringWithFormat:@"%ld", _bean.craftingPrice];
    _craftPriceForOne.text = [NSString stringWithFormat:@"%ld", _bean.craftingPriceForOne];
    if (_bean.AHPrice < _bean.craftingPriceForOne) {
        _cheaper.text = @"It is cheaper to buy gems from AH";
    }
    if (_bean.amountNeeded < 0) {
        _enough.text = @"You have enough gems in your stash";
    }
}

- (void)viewDidUnload
{
    [self setGemType:nil];
    [self setAvailable:nil];
    [self setAHPrice:nil];
    [self setNeeded:nil];
    [self setNeedToCraft:nil];
    [self setCraftPrice:nil];
    [self setCraftPriceForOne:nil];
    [self setCheaper:nil];
    [self setEnough:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
