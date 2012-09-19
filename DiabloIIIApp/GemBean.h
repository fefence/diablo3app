//
//  GemCalcBackend.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 25.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GemBean : NSObject

@property long available;
@property long AHPrice;
@property long craftingPriceForOne;
@property long craftingPrice;
@property long amountNeeded;
@property long amountToCraft;
@property long pagesNeededForOne;
@property long tjNeededForOne;
@property long tsNeededForOne;
@property NSString *previousGemType;
@property long previousGemAmountNeededForOne;
@property long previousGemPricePerUnit;

@end
