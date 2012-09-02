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


NSMutableDictionary *beans;
NSString *startingGem;
NSString *desiredGem;
NSMutableArray *gemTypes;
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
    gemTypes = appDelegate.gemTypes;
    int i;
    for (i = 0; i < gemTypes.count; i ++) {
        NSString * current = [gemTypes objectAtIndex:i];
        if (![current caseInsensitiveCompare:startingGem] == NSOrderedSame) {
            [gemTypes removeObjectAtIndex:0];
        } else {
            break;
        }
    }
    
    for (i = gemTypes.count - 1; i >= 0; i --) {
        if (![[gemTypes objectAtIndex:i] caseInsensitiveCompare:desiredGem] == NSOrderedSame) {
            [gemTypes removeObjectAtIndex:i];
        } else {
            break;
        }
    }
    [self fillInBeans];
}

- (void) fillInBeans {
    long i, count = amount;
    for (i = gemTypes.count - 1; i >= 0; i --) {
        NSString *type = [gemTypes objectAtIndex:i];
        if (([type caseInsensitiveCompare:@"Flawless Square"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Perfect Square"] == NSOrderedSame)|| ([type caseInsensitiveCompare:@"Radiant Square"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Star"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Flawless Star"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Perfect Star"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Radiant Star"] == NSOrderedSame)) {
            count = count * 3;
        } else {
            count = count *2;
        }
        GemBean *bean = [beans objectForKey:type];
        bean.amountNeeded = count;
        bean.amountToCraft = count - bean.available;
    }
    
    long previosSinglePrice = 0;
    for (i = 0; i < beans.count; i ++) {
        NSString *type = [gemTypes objectAtIndex:i];
        GemBean *bean = [beans objectForKey:type];
        if ([type caseInsensitiveCompare:@"chipped"] == NSOrderedSame) {
            bean.craftingPriceForOne = bean.AHPrice;
        } else if ([type caseInsensitiveCompare:@"flawed"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 10;
        } else if ([type caseInsensitiveCompare:@"normal"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 25;
        } else if ([type caseInsensitiveCompare:@"flawless"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 40;
        } else if ([type caseInsensitiveCompare:@"perfect"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 55 + pageOfJewelcraftingPrice;
        } else if ([type caseInsensitiveCompare:@"radiant"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 70 + pageOfJewelcraftingPrice * 2;
        } else if ([type caseInsensitiveCompare:@"square"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 85 + tomeOfJewelcraftingPrice;
        } else if ([type caseInsensitiveCompare:@"flawless square"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 2 + 100 + tomeOfJewelcraftingPrice * 2;
        } else if ([type caseInsensitiveCompare:@"perfect square"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 3 + 30000 + tomeOfSecretsPrice * 3;
        } else if ([type caseInsensitiveCompare:@"radiant square"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 3 + 50000 + tomeOfSecretsPrice * 6;
        } else if ([type caseInsensitiveCompare:@"star"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 3 + 80000 + tomeOfSecretsPrice + 9;
        } else if ([type caseInsensitiveCompare:@"flawless star"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 3 + 100000 + tomeOfSecretsPrice * 12;
        } else if ([type caseInsensitiveCompare:@"perfect star"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 3 + 200000 + tomeOfSecretsPrice * 15;
        } else if ([type caseInsensitiveCompare:@"radiant star"] == NSOrderedSame) {
            bean.craftingPriceForOne = previosSinglePrice * 3 + 400000 + tomeOfSecretsPrice * 20;
        }
        if (bean.amountToCraft < 0) {
            bean.amountToCraft = 0;
        }
        if (bean.craftingPriceForOne < bean.AHPrice) {
            previosSinglePrice = bean.AHPrice;
            bean.craftingPrice = bean.amountToCraft * bean.AHPrice;
        } else {
            previosSinglePrice = bean.craftingPriceForOne;
            bean.craftingPrice = bean.amountToCraft * bean.craftingPriceForOne;
        }
        
    }
    
 //   GemBean *desired = [[GemBean alloc] init];
 //   desired.type = desiredGem;
 //   desired.amountNeeded = amount;
 //   [beans addObject:desired];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GemDetailsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSString *key = [gemTypes objectAtIndex:indexPath.row];
    GemBean *bean = [beans objectForKey:key];
    cell.textLabel.text = key;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Need to buy: %ld  To craft: %ld", bean.amountNeeded - bean.available, bean.craftingPrice];
    if (bean.AHPrice < bean.craftingPriceForOne) {
        cell.textLabel.textColor = [UIColor redColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.gemTable indexPathForCell:sender];
        NSString *type = [gemTypes objectAtIndex:indexPath.row];
        GemBean *bean = [beans objectForKey:type];
        GemDetailsController *viewController = segue.destinationViewController;
        viewController.type = type;
        viewController.bean = bean;
    }
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
