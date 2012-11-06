//
//  Button.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"

@interface Button : UIButton <PopoverViewDelegate>

@property NSMutableArray *stringArrays;

@end
