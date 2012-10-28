//
//  rmahOrGold.m
//  DiabloIIIApp
//
//  Created by Murat, Deniz on 25.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "rmahOrGold.h"
#import "KeyboardBar.h"
#import "AppDelegate.h"
@interface rmahOrGold ()

@end

@implementation rmahOrGold

@synthesize button = _button;
@synthesize goldPrice = _goldPrice;
@synthesize priceInRMAH = _priceInRMAH;
@synthesize priceInGold = _priceInGold;
@synthesize itemsOrCommodities = _itemsOrCommodities;
@synthesize inMoney = _inMoney;
@synthesize inPaypal = _inPaypal;
@synthesize amount = _amount;
@synthesize tableView = _tableView;

KeyboardBar *bar;
NSNumberFormatter *formatter;
NSString *currency = @"$";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    AppDelegate *delegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"User"
                inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if ([objects count] == 0) {
        currency = @"EUR";
    } else {
        NSManagedObject *matches = [objects objectAtIndex:0];
        currency = [matches valueForKey:@"currency"];
    }
    
    _currency.text = currency;
    [super viewDidLoad];
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setDecimalSeparator:[[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator]];

    bar = [KeyboardBar new];
    [self barFields:NO];
    bar.field = nil;
    bar.index = -1;
    [self hideAmountRow];
}

- (void) barFields : (BOOL) all {
    NSMutableArray *fields;
    if (all) {
        fields = [[NSMutableArray alloc] initWithObjects:_goldPrice, _amount, _priceInRMAH, _priceInGold, nil];
    } else {
        fields = [[NSMutableArray alloc] initWithObjects:_goldPrice, _priceInRMAH, _priceInGold, nil];
    }
    for (UITextField *f in fields) {
        f.inputAccessoryView = bar;
    }
    bar.fields = fields;
}

- (IBAction)editingDidBegin:(UITextField *)sender {
    bar.field = sender;
}

- (IBAction)editingDidEnd:(id)sender {
    if (_itemsOrCommodities.selectedSegmentIndex == 2) {
        [self showAmountRow];
        [self barFields:YES];
        if (_goldPrice.text.length > 0 && _amount.text.length > 0) {
            [self calculateGold];
        }
    } else {
        if (_itemsOrCommodities.selectedSegmentIndex == 0) {
            [self barFields:NO];
            [self hideAmountRow];
        } else {
            [self barFields:YES];
            [self showAmountRow];
        }
        _priceInGold.enabled = YES;
        _priceInRMAH.enabled = YES;
        if (_priceInRMAH.text.length > 0 && _priceInGold.text.length > 0 && _goldPrice.text.length > 0) {
            [self calculate];
        }
    }
}

- (void) calculate {
    float gold = _priceInGold.text.integerValue * 0.85;
    float inMoney, inGold;
    inGold = _amount.text.integerValue * gold * [formatter numberFromString: _goldPrice.text].floatValue / 1000000 * 0.85;
    if (_itemsOrCommodities.selectedSegmentIndex == 0) {
        inMoney = _amount.text.integerValue * [formatter numberFromString: _priceInRMAH.text].floatValue - 1;
    } else if (_itemsOrCommodities.selectedSegmentIndex == 1) {
        inMoney = _amount.text.integerValue * [formatter numberFromString: _priceInRMAH.text].floatValue * 0.85;
    }
    _inMoney.text = [NSString stringWithFormat:@"%.02f", inMoney];
    _inPaypal.text = [NSString stringWithFormat:@"%.02f", inMoney * 0.85];
    _bnetInGold.text = [NSString stringWithFormat:@"%.02f", inGold];
    _paypalInGold.text = [NSString stringWithFormat:@"%.02f", inGold * 0.85];
    if (inMoney > inGold) {
        _priceInRMAH.superview.backgroundColor = [UIColor greenColor];
        _priceInGold.superview.backgroundColor = [UIColor clearColor];
        
    } else if (inMoney < inGold) {
        _priceInGold.superview.backgroundColor = [UIColor greenColor];
        _priceInRMAH.superview.backgroundColor = [UIColor clearColor];
    } else {
        _priceInRMAH.superview.backgroundColor = [UIColor clearColor];
        _priceInGold.superview.backgroundColor = [UIColor clearColor];
    }
}

- (IBAction)calculateGoldPricesPerMil:(id)sender {
     
    _goldPriceInBnet.text = [NSString localizedStringWithFormat:@"%.02f", [formatter numberFromString: _goldPrice.text].floatValue * 0.85];
    _goldPriceInPaypal.text = [NSString localizedStringWithFormat:@"%.02f", [formatter numberFromString: _goldPriceInBnet.text].floatValue * 0.85];
}

- (IBAction)clearResults:(id)sender {
    _inMoney.text = @"";
    _inPaypal.text = @"";
    _bnetInGold.text = @"";
    _paypalInGold.text = @"";
    _priceInGold.text = @"";
    _amount.text = @"";
    _priceInRMAH.text = @"";
    _priceInRMAH.superview.backgroundColor = [UIColor clearColor];
    _priceInGold.superview.backgroundColor = [UIColor clearColor];
}

- (void)calculateGold {
    _inMoney.text = [NSString stringWithFormat:@"%.02f", [formatter numberFromString: _goldPriceInBnet.text].floatValue * _amount.text.integerValue / 1000000];
    _inPaypal.text = [NSString stringWithFormat:@"%.02f", [formatter numberFromString: _goldPriceInPaypal.text].floatValue * _amount.text.integerValue / 1000000];
    _priceInGold.text = @"-";
    _priceInGold.enabled = NO;
    _priceInRMAH.enabled = NO;
    _priceInRMAH.text = @"-";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
}

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    
}

-(void)showAmountRow {
    [self.view viewWithTag:1000].hidden = NO;
    [_tableView reloadData];
}


-(void)hideAmountRow {
    [self.view viewWithTag:1000].hidden = YES;
    [_tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 69;
    } else {
        if (indexPath.row == 0) {
            return 40;
        } else if (indexPath.row == 1) {
            if (_itemsOrCommodities.selectedSegmentIndex == 0) return 0;
        }
    }
    return 35;
}

- (void)viewDidUnload {
    [self setGoldPriceInBnet:nil];
    [self setGoldPriceInPaypal:nil];
    [self setAmount:nil];
    [self setInMoney:nil];
    [self setBnetInGold:nil];
    [self setPaypalInGold:nil];
    [self setTableView:nil];
    [self setCurrency:nil];
    [super viewDidUnload];
}


@end
