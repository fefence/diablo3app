//
//  UseMineResults.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 06.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "UseMineResults.h"
#import "AppDelegate.h"

@interface UseMineResults ()

@end

@implementation UseMineResults

@synthesize gems = _gems;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize summary = _summary;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;
@synthesize gemTypes = _gemTypes;

long pages, pagesNeeded;
long tomesJewelcrafting, tjNeeded;
long tomesSecrets, tsNeeded;
NSMutableString *text;

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
    _gems = appDelegate.myGemsAvailable;
    pagesNeeded = 0;
    tjNeeded = 0;
    tsNeeded = 0;
    pages = _pageOfJewelcraftingAvailable;
    tomesJewelcrafting = _tomeOfJewelcraftingAvailable;
    tomesSecrets = _tomeOfSecretsAvailable;
    text = [[NSMutableString alloc] init];
    int i, bigger = 0, price = 0;
    for (i = 0; i < _gemTypes.count - 1; i ++) {
        NSString *type = [_gemTypes objectAtIndex:i];
        NSNumber *available = (NSNumber *)[_gems objectForKey:type];
        if ([type caseInsensitiveCompare:@"chipped"] == NSOrderedSame) {
            bigger = available.integerValue / 2;
            price = bigger * 10;
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"flawed"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 2;
            price = bigger * 25;
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"normal"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 2;
            price = bigger * 40;
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"flawless"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 2;
            price = bigger * 55;
            if (pages > bigger) {
                pages -= bigger;
            } else {
                pagesNeeded += bigger - pages;
                price += pagesNeeded * _pageOfJewelcraftingPrice;
                pages = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"perfect"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 2;
            price = bigger * 55;
            if (pages > bigger * 2) {
                pages -= bigger * 2;
            } else {
                pagesNeeded += bigger * 2 - pages;
                price += pagesNeeded * _pageOfJewelcraftingPrice;
                pages = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"radiant"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 2;
            price = bigger * 85;
            if (tomesJewelcrafting > bigger) {
                tomesJewelcrafting -= bigger;
            } else {
                tjNeeded += bigger - tomesJewelcrafting;
                price += tjNeeded * _tomeOfJewelcraftingPrice;
                tomesJewelcrafting = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"square"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 2;
            price = bigger * 100;
            if (tomesJewelcrafting > bigger * 2) {
                tomesJewelcrafting -= bigger * 2;
            } else {
                tjNeeded += bigger * 2 - pages;
                price += tjNeeded * _tomeOfJewelcraftingPrice;
                tomesJewelcrafting = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 2];
        } else if ([type caseInsensitiveCompare:@"flawless square"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 3;
            price = bigger * 30000;
            if (tomesSecrets > bigger * 3) {
                tomesSecrets -= bigger * 3;
            } else {
                tsNeeded += bigger * 3 - tomesSecrets;
                price += tsNeeded * _tomeOfSecretsPrice;
                tomesSecrets = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 3];
        } else if ([type caseInsensitiveCompare:@"perfect square"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 3;
            price = bigger * 50000;
            if (tomesSecrets > bigger * 6) {
                tomesSecrets -= bigger * 6;
            } else {
                tsNeeded += bigger*6 - tomesSecrets;
                price += tsNeeded * _tomeOfSecretsPrice;
                tomesSecrets = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 3];
        } else if ([type caseInsensitiveCompare:@"radiant square"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 3;
            price = bigger * 80000;
            if (tomesSecrets > bigger * 9) {
                tomesSecrets -= bigger * 9;
            } else {
                tsNeeded += bigger * 9 - tomesSecrets;
                price += tsNeeded * _tomeOfSecretsPrice;
                tomesSecrets = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 3];
        } else if ([type caseInsensitiveCompare:@"star"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 3;
            price = bigger * 100000;
            if (tomesSecrets > bigger * 12) {
                tomesSecrets -= bigger * 12;
            } else {
                tsNeeded += bigger * 12 - tomesSecrets;
                price += tsNeeded * _tomeOfSecretsPrice;
                tomesSecrets = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 3];
        } else if ([type caseInsensitiveCompare:@"flawless star"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 3;
            price = bigger * 200000;
            if (tomesSecrets > bigger * 15) {
                tomesSecrets -= bigger * 15;
            } else {
                tsNeeded += bigger * 15 - tomesSecrets;
                price += tsNeeded * _tomeOfSecretsPrice;
                tomesSecrets = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 3];
        } else if ([type caseInsensitiveCompare:@"perfect star"] == NSOrderedSame) {
            available = [NSNumber numberWithInt:available.integerValue + bigger];
            bigger = available.integerValue / 3;
            price = bigger * 400000;
            if (tomesSecrets > bigger * 20) {
                tomesSecrets -= bigger * 20;
            } else {
                tsNeeded += bigger * 20 - tomesSecrets;
                price += tsNeeded * _tomeOfSecretsPrice;
                tomesSecrets = 0;
            }
            available = [NSNumber numberWithInt:available.integerValue % 3];
        }
    
        [text appendString:[NSString stringWithFormat:@"From %@ left %d\n", type, available.integerValue]];
    }
    [text appendString:[NSString stringWithFormat:@"%d %@ for %d gold.\nPage of Jewelcrafting needed %ld\n Tomes of Jewelcrafting needed %ld\n Tome of Secrets needed %ld", bigger, [_gemTypes objectAtIndex:_gemTypes.count - 1], price, pagesNeeded, tjNeeded, tsNeeded]];
    _summary.text = text;
}

- (void)viewDidUnload
{
    [self setSummary:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
