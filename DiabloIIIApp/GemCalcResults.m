//
//  GemCalcResults.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 27.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemCalcResults.h"
#import "GemCalcMainController.h"
#import "AppDelegate.h"


@interface GemCalcResults ()

@end

@implementation GemCalcResults


NSMutableArray *beans;
NSString *startingGem;
NSString *desiredGem;
int pageOfJewelcraftingPrice;
int pageOfJewelcraftingAvailable;
int tomeOfJewelcraftingPrice;
int tomeOfJewelcraftingAvailable;
int tomeOfSecretsPrice;
int tomeOfSecretsAvailable;
int amount;

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
    GemCalcMainController *sharedInstance = GemCalcMainController.sharedInstance;
    amount = [sharedInstance.amount.text integerValue];
    pageOfJewelcraftingAvailable =  [sharedInstance.pageOfJewelcraftingAvailable.text integerValue];
    pageOfJewelcraftingPrice = [sharedInstance.pageOfJewelcraftingPrice.text integerValue];
    tomeOfJewelcraftingAvailable = [sharedInstance.tomeOfJewelcraftingAvailable.text integerValue];
    tomeOfJewelcraftingPrice = [sharedInstance.tomeOfJewelcraftingPrice.text integerValue];
    tomeOfSecretsAvailable = [sharedInstance.tomeOfSecretsAvailable.text integerValue];
    tomeOfSecretsPrice = [sharedInstance.tomeOfSecretsPrice.text integerValue];
    startingGem = sharedInstance.startingGem.text;
    desiredGem = sharedInstance.desiredGem.text;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    beans = appDelegate.beans;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
