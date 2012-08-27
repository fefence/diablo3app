//
//  GemCalcMainController.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 20.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GemCalcMainController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
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
@property (strong, nonatomic) IBOutlet UIPickerView *gemPicker;
@property (strong, nonatomic) IBOutlet UISwitch *useMineFirst;
+(GemCalcMainController *)sharedInstance;
- (IBAction)changeCurrentTextField:(id)sender;
- (IBAction)scrollBack:(id)sender;

@end
