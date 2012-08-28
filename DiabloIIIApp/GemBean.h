//
//  GemCalcBackend.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 25.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GemBean : NSObject

@property NSString *type;
@property long available;
@property long AHPrice;
@property long craftingPrice;
@property long amountNeeded;
@property long amountToCraft;

@end
