//
//  GemCalcResults.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 27.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GemCalcResults : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *gemTable;
@property int pageOfJewelcraftingPrice;
@property int pageOfJewelcraftingAvailable;
@property int tomeOfJewelcraftingPrice;
@property int tomeOfJewelcraftingAvailable;
@property int tomeOfSecretsPrice;
@property int tomeOfSecretsAvailable;
@property int amount;
@property NSString *startingGem;
@property NSString *desiredGem;
@property NSMutableArray *gemTypes;

@end
