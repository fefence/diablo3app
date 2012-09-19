//
//  GemDetails.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 18.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GemBean.h"

@interface GemDetails : UIViewController

@property GemBean *bean;
@property (strong, nonatomic) IBOutlet UILabel *prevGemType;
@property (strong, nonatomic) IBOutlet UILabel *prevGemPricePerUnit;
@property (strong, nonatomic) IBOutlet UILabel *prevGemAmount;
@property (strong, nonatomic) IBOutlet UILabel *tomeType;
@property (strong, nonatomic) IBOutlet UILabel *tomePricePerUint;
@property (strong, nonatomic) IBOutlet UILabel *tomeAmount;
@property (strong, nonatomic) IBOutlet UILabel *craftPriceForOne;
@property (strong, nonatomic) IBOutlet UILabel *aHPrice;
@property (strong, nonatomic) IBOutlet UILabel *amountNeeded;
@property (strong, nonatomic) IBOutlet UILabel *available;
@property (strong, nonatomic) IBOutlet UILabel *needToCraft;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property NSString *gemType;

@end
