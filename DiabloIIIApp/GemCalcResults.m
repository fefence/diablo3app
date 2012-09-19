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
#import "GemDetails.h"


@interface GemCalcResults ()

@end

@implementation GemCalcResults
@synthesize gemTable = _gemTable;


NSMutableDictionary *beans;

@synthesize amount = _amount;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;
@synthesize gemTypes = _gemTypes;

long pages, tomesJ, tomesS;

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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    beans = appDelegate.beans;
    pages = _pageOfJewelcraftingAvailable;
    tomesJ = _tomeOfJewelcraftingAvailable;
    tomesS = _tomeOfSecretsAvailable;
    [self fillInBeans];
}

- (void) fillInBeans {
    GemBean *first = [beans objectForKey:[_gemTypes objectAtIndex:0]];
    first.previousGemType = @"Previous gem";
    int i, count = _amount;
    for (i = _gemTypes.count - 2; i >= 0; i --) {
        NSString *type = [_gemTypes objectAtIndex:i];
        if (([type caseInsensitiveCompare:@"Flawless Square"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Perfect Square"] == NSOrderedSame)|| ([type caseInsensitiveCompare:@"Radiant Square"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Star"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Flawless Star"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Perfect Star"] == NSOrderedSame) || ([type caseInsensitiveCompare:@"Radiant Star"] == NSOrderedSame)) {
            count = count * 3;
        } else {
            count = count *2;
        }
        GemBean *bean = [beans objectForKey:type];
        bean.amountNeeded = count;
        bean.amountToCraft = count - bean.available;
    }
    first.craftingPrice = first.AHPrice * first.amountToCraft;

    long previosSinglePrice = first.AHPrice;
    for (i = 1; i < beans.count; i ++) {
        NSString *type = [_gemTypes objectAtIndex:i];
        GemBean *bean = [beans objectForKey:type];
        if (bean.amountToCraft < 0) {
            bean.amountToCraft = 0;
        }
        if ([type caseInsensitiveCompare:@"flawed"] == NSOrderedSame) {
            bean.previousGemType = @"Chipped";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 10;
        } else if ([type caseInsensitiveCompare:@"normal"] == NSOrderedSame) {
            bean.previousGemType = @"Flawed";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 25;
        } else if ([type caseInsensitiveCompare:@"flawless"] == NSOrderedSame) {
            bean.previousGemType = @"Normal";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 40;
        } else if ([type caseInsensitiveCompare:@"perfect"] == NSOrderedSame) {
            bean.previousGemType = @"Flawless";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 1;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 55 + _pageOfJewelcraftingPrice;
        } else if ([type caseInsensitiveCompare:@"radiant"] == NSOrderedSame) {
            bean.previousGemType = @"Perfect";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 2;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 70 + _pageOfJewelcraftingPrice * 2;
        } else if ([type caseInsensitiveCompare:@"square"] == NSOrderedSame) {
            bean.previousGemType = @"Radiant";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 1;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 85 + _tomeOfJewelcraftingPrice;
        } else if ([type caseInsensitiveCompare:@"flawless square"] == NSOrderedSame) {
            bean.previousGemType = @"Square";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 0;
            bean.tjNeededForOne = 2;
            bean.craftingPriceForOne = previosSinglePrice * 2 + 100 + _tomeOfJewelcraftingPrice * 2;
        } else if ([type caseInsensitiveCompare:@"perfect square"] == NSOrderedSame) {
            bean.previousGemType = @"Flawless square";
            bean.previousGemAmountNeededForOne = 2;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 3;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 3 + 30000 + _tomeOfSecretsPrice * 3;
        } else if ([type caseInsensitiveCompare:@"radiant square"] == NSOrderedSame) {
            bean.previousGemType = @"Perfect square";
            bean.previousGemAmountNeededForOne = 3;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 6;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 3 + 50000 + _tomeOfSecretsPrice * 6;
        } else if ([type caseInsensitiveCompare:@"star"] == NSOrderedSame) {
            bean.previousGemType = @"Radiant square";
            bean.previousGemAmountNeededForOne = 3;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 9;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 3 + 80000 + _tomeOfSecretsPrice + 9;
        } else if ([type caseInsensitiveCompare:@"flawless star"] == NSOrderedSame) {
            bean.previousGemType = @"Star";
            bean.previousGemAmountNeededForOne = 3;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 12;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 3 + 100000 + _tomeOfSecretsPrice * 12;
        } else if ([type caseInsensitiveCompare:@"perfect star"] == NSOrderedSame) {
            bean.previousGemType = @"Flawless star";
            bean.previousGemAmountNeededForOne = 3;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 15;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 3 + 200000 + _tomeOfSecretsPrice * 15;
        } else if ([type caseInsensitiveCompare:@"radiant star"] == NSOrderedSame) {
            bean.previousGemType = @"Perfect star";
            bean.previousGemAmountNeededForOne = 3;
            bean.pagesNeededForOne = 0;
            bean.tsNeededForOne = 20;
            bean.tjNeededForOne = 0;
            bean.craftingPriceForOne = previosSinglePrice * 3 + 400000 + _tomeOfSecretsPrice * 20;
        }
        bean.previousGemPricePerUnit = previosSinglePrice;
        bean.craftingPrice = bean.amountToCraft * bean.craftingPrice;
        previosSinglePrice = bean.craftingPrice;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GemDetailsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSString *key = [_gemTypes objectAtIndex:indexPath.row];
    GemBean *bean = [beans objectForKey:key];
    cell.textLabel.text = key;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Need to buy: %ld  To craft: %ld", bean.amountNeeded - bean.available, bean.craftingPrice];
    if (bean.AHPrice < bean.craftingPriceForOne) {
        cell.textLabel.textColor = [UIColor redColor];
    }
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        NSIndexPath *indexPath = [self.gemTable indexPathForCell:sender];
        GemBean *bean = [beans objectForKey:[_gemTypes objectAtIndex:indexPath.row]];
        GemDetails *viewController = segue.destinationViewController;
        viewController.gemType = [_gemTypes objectAtIndex:indexPath.row];
        viewController.bean = bean;
        //viewController.previousGemType.text = [_gemTypes objectAtIndex:indexPath.row - 1];
        //viewController.previosPricePerUnit.text = [NSString stringWithFormat:@"%ld", prev.craftingPriceForOne];
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
