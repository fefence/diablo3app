//
//  UseMineResults.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 06.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UseMineResults : UIViewController
@property NSMutableDictionary *gems;
@property int pageOfJewelcraftingPrice;
@property NSMutableArray *gemTypes;
@property int pageOfJewelcraftingAvailable;
@property int tomeOfJewelcraftingPrice;
@property int tomeOfJewelcraftingAvailable;
@property int tomeOfSecretsPrice;
@property int tomeOfSecretsAvailable;
@property (strong, nonatomic) IBOutlet UITextView *summary;
@end
