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

@end
