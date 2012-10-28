//
//  Settings.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"
@interface Settings : UITableViewController <PopoverViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *currency;
- (IBAction)showPopOver:(UIButton *)sender;

@end
