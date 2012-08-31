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
@synthesize type = _type;
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
}

- (void)viewDidUnload
{
    [self setGemType:nil];
    [self setAvailable:nil];
    [self setAHPrice:nil];
    [self setNeeded:nil];
    [self setNeedToCraft:nil];
    [self setCraftPrice:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
