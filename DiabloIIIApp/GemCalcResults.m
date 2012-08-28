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
#import "GemBean.h"
#import "GemDetailsController.h"


@interface GemCalcResults ()

@end

@implementation GemCalcResults
@synthesize gemTable = _gemTable;


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
    [self fillInBeans];
}

- (void) fillInBeans {
    long i, count = amount;
    for (i = beans.count - 1; i >= 0; i --) {
        GemBean *bean = [beans objectAtIndex:i];
        if (([bean.type caseInsensitiveCompare:@"Flawless Square"] == NSOrderedSame) || ([bean.type caseInsensitiveCompare:@"Perfect Square"] == NSOrderedSame)|| ([bean.type caseInsensitiveCompare:@"Radiant Square"] == NSOrderedSame) || ([bean.type caseInsensitiveCompare:@"Star"] == NSOrderedSame) || ([bean.type caseInsensitiveCompare:@"Flawless Star"] == NSOrderedSame) || ([bean.type caseInsensitiveCompare:@"Perfect Star"] == NSOrderedSame) || ([bean.type caseInsensitiveCompare:@"Radiant Star"] == NSOrderedSame)) {
            count = count * 3;
        } else {
            count = count *2;
        }
        bean.amountNeeded = count;
        bean.amountToCraft = count - bean.available;
        NSLog(bean.type);
        NSLog(@"%d", count);
    }
    
    long tillNow;
    
    for (i = 0; i < beans.count; i ++) {
        GemBean *bean = [beans objectAtIndex:i];
        if ([bean.type caseInsensitiveCompare:@"chipped"] == NSOrderedSame) {
            tillNow = bean.amountToCraft * bean.AHPrice;
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"flawed"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * 10;
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"normal"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * 25;
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"flawless"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * 40;
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"perfect"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (55 + pageOfJewelcraftingPrice);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"radiant"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (70 + pageOfJewelcraftingPrice * 2);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"square"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (85 + tomeOfJewelcraftingPrice);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"flawless square"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (100 + tomeOfJewelcraftingPrice * 2);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"perfect square"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (30000 + tomeOfSecretsPrice * 3);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"radiant square"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (50000 + tomeOfSecretsPrice * 6);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"star"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (80000 + tomeOfSecretsPrice * 9);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"flawless star"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (100000 + tomeOfSecretsPrice * 12);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"perfect star"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (200000 + tomeOfSecretsPrice * 15);
            bean.craftingPrice = tillNow;
        } else if ([bean.type caseInsensitiveCompare:@"radiant star"] == NSOrderedSame) {
            tillNow += bean.amountToCraft * (400000 + tomeOfSecretsPrice * 20);
            bean.craftingPrice = tillNow;
        }
    }
    
    GemBean *desired = [[GemBean alloc] init];
    desired.type = desiredGem;
    desired.amountNeeded = amount;
    [beans addObject:desired];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GemDetailsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    GemBean *bean = [beans objectAtIndex:indexPath.row];
    cell.textLabel.text = bean.type;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Need to buy: %ld  To craft: %ld", bean.amountNeeded - bean.available, bean.craftingPrice];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return beans.count;
}


- (void)viewDidUnload
{
    [self setGemTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
