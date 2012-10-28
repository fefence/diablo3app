//
//  GemDetails.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 18.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemDetails.h"

@interface GemDetails ()

@end

@implementation GemDetails

@synthesize bean = _bean;
@synthesize prevGemType = _prevGemType;
@synthesize prevGemPricePerUnit = _prevGemPricePerUnit;
@synthesize prevGemAmount = _prevGemAmount;
@synthesize tomeType = _tomeType;
@synthesize tomePricePerUint = _tomePricePerUint;
@synthesize tomeAmount = _tomeAmount;
@synthesize craftPriceForOne = _craftPriceForOne;
@synthesize aHPrice = _aHPrice;
@synthesize amountNeeded = _amountNeeded;
@synthesize available = _available;
@synthesize needToCraft = _needToCraft;
@synthesize price = _price;
@synthesize gemType = _gemType;

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
    _prevGemType.text = _bean.previousGemType;
    _prevGemPricePerUnit.text = (_bean.previousGemPricePerUnit == 0? @"-" :[NSString stringWithFormat:@"%ld", _bean.previousGemPricePerUnit]);
    _prevGemAmount.text = (_bean.previousGemAmountNeededForOne == 0? @"-" :[NSString stringWithFormat:@"%ld", _bean.previousGemAmountNeededForOne]);
    _aHPrice.text = (_bean.AHPrice == 0? @"-": [NSString stringWithFormat:@"%ld", _bean.AHPrice]);
    _craftPriceForOne.text = (_bean.craftingPriceForOne == 0? @"-": [NSString stringWithFormat:@"%ld", _bean.craftingPriceForOne]);
    _price.text = (_bean.craftingPrice == 0? @"-": [NSString stringWithFormat:@"%ld", _bean.craftingPrice]);
    _needToCraft.text = (_bean.amountToCraft == 0? @"-": [NSString stringWithFormat:@"%ld", _bean.amountToCraft]);
    _amountNeeded.text = (_bean.amountNeeded == 0? @"-": [NSString stringWithFormat:@"%ld", _bean.amountNeeded]);
    _available.text = (_bean.available == 0? @"-": [NSString stringWithFormat:@"%ld", _bean.available]);
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidUnload
{
    [self setPrevGemType:nil];
    [self setPrevGemPricePerUnit:nil];
    [self setPrevGemAmount:nil];
    [self setTomeType:nil];
    [self setTomePricePerUint:nil];
    [self setTomeAmount:nil];
    [self setCraftPriceForOne:nil];
    [self setAHPrice:nil];
    [self setAmountNeeded:nil];
    [self setAvailable:nil];
    [self setNeedToCraft:nil];
    [self setPrice:nil];
    self.bean = nil;
    self.gemType = nil;
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
