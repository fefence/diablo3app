//
//  GemCalcSettingsController.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 24.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GemCalcSettingsController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *tableData;
@property (nonatomic) int cellCount;
@property NSString *startingGem;
@property NSString *desiredGem;
@property int pageOfJewelcraftingPrice;
@property int pageOfJewelcraftingAvailable;
@property int tomeOfJewelcraftingPrice;
@property int tomeOfJewelcraftingAvailable;
@property int tomeOfSecretsPrice;
@property int tomeOfSecretsAvailable;
@property int amount;
@end
