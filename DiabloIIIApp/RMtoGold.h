//
//  RMtoGold.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 19.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMtoGold : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UITextField *goldPrice;
@property (strong, nonatomic) IBOutlet UITextField *priceInRMAH;
@property (strong, nonatomic) IBOutlet UITextField *priceInGold;
@property (strong, nonatomic) IBOutlet UISegmentedControl *itemsOrCommodities;
@property (strong, nonatomic) IBOutlet UILabel *result;
@property (strong, nonatomic) IBOutlet UILabel *inGold;
@property (strong, nonatomic) IBOutlet UILabel *inMoney;
@property (strong, nonatomic) IBOutlet UILabel *inPaypal;
- (IBAction)editingDidBegin:(id)sender;
- (IBAction)editingDidEnd:(id)sender;
- (IBAction)calculate:(id)sender;
@end
