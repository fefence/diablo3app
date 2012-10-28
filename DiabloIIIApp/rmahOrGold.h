//
//  rmahOrGold.h
//  DiabloIIIApp
//
//  Created by Murat, Deniz on 25.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rmahOrGold : UITableViewController

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *currency;
@property (strong, nonatomic) IBOutlet UITextField *goldPrice;
@property (strong, nonatomic) IBOutlet UITextField *priceInRMAH;
@property (strong, nonatomic) IBOutlet UITextField *priceInGold;
@property (strong, nonatomic) IBOutlet UISegmentedControl *itemsOrCommodities;
@property (strong, nonatomic) IBOutlet UITextField *goldPriceInPaypal;
@property (strong, nonatomic) IBOutlet UITextField *goldPriceInBnet;
@property (strong, nonatomic) IBOutlet UITextField *inMoney;
@property (strong, nonatomic) IBOutlet UITextField *inPaypal;
- (IBAction)editingDidBegin:(id)sender;
- (IBAction)editingDidEnd:(id)sender;
- (IBAction)calculateGoldPricesPerMil:(id)sender;
- (IBAction)clearResults:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *amount;
@property (strong, nonatomic) IBOutlet UITextField *bnetInGold;
@property (strong, nonatomic) IBOutlet UITextField *paypalInGold;

@end
