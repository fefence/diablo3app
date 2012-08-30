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
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *key = appDelegate.key;
    GemBean *bean = [appDelegate.beans objectForKey:key];
    _gemType.text = key;
    _available.text = [NSString stringWithFormat:@"%ld", bean.available];
    _AHPrice.text = [NSString stringWithFormat:@"%ld", bean.AHPrice];
    _needed.text = [NSString stringWithFormat:@"%ld", bean.amountNeeded];
    _needToCraft.text = [NSString stringWithFormat:@"%ld", bean.amountToCraft];
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
