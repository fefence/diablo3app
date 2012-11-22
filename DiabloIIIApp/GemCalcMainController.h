//
//  GemCalcMainController.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 20.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDown.h"
#import "TextField.h"

@interface GemCalcMainController : UITableViewController <DropDownDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet DropDown *startingGem;
@property (strong, nonatomic) IBOutlet DropDown *desiredGem;
@property (strong, nonatomic) IBOutlet UISwitch *upradeMine;
@property (strong, nonatomic) IBOutlet TextField *amount;
@property (strong, nonatomic) IBOutlet TextField *pageOfJewelcraftingAvailable;
@property (strong, nonatomic) IBOutlet TextField *pageOfJewelcraftingPrice;
@property (strong, nonatomic) IBOutlet TextField *tomeOfJewelcraftingAvailable;
@property (strong, nonatomic) IBOutlet TextField *tomeOfJewelcraftingPrice;
@property (strong, nonatomic) IBOutlet TextField *tomeOfSecretsAvailable;
@property (strong, nonatomic) IBOutlet TextField *tomeOfSecretsPrice;
- (IBAction)editingDidEnd:(id)sender;
- (IBAction)editingDidBegin:(id)sender;

@end
