//
//  GemCalcMainController.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 20.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"

@interface GemCalcMainController : UITableViewController <PopoverViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *startingGem;
@property (strong, nonatomic) IBOutlet UITextField *desiredGem;
@property (strong, nonatomic) IBOutlet UITextField *amount;
@property (strong, nonatomic) IBOutlet UITextField *pageOfJewelcraftingAvailable;
@property (strong, nonatomic) IBOutlet UITextField *pageOfJewelcraftingPrice;
@property (strong, nonatomic) IBOutlet UITextField *tomeOfJewelcraftingAvailable;
@property (strong, nonatomic) IBOutlet UITextField *tomeOfJewelcraftingPrice;
@property (strong, nonatomic) IBOutlet UITextField *tomeOfSecretsAvailable;
@property (strong, nonatomic) IBOutlet UITextField *tomeOfSecretsPrice;
@property NSMutableArray *gemTypes;
@property (strong, nonatomic) IBOutlet UISwitch *useMineFirst;
@property (strong, nonatomic) NSMutableArray  *fields;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *pageOfJewelcraftingLabel;
- (IBAction)changeCurrentTextField:(id)sender;
- (IBAction)scrollBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *mineButton;
- (IBAction)useMineSwitch:(id)sender;
- (IBAction)changeDropDown:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *tomeOfSecretsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tomeOfJewelcraftingLabel;
- (IBAction)dropDown:(UITextField *)sender;

@end
