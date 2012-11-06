//
//  DropDown.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 31.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"

@interface DropDown : UIView <PopoverViewDelegate>

-(void) setStringArray: (NSMutableArray *) array;
-(NSString *) getString;
-(void) setString: (NSString *) string;
@end
