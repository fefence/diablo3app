//
//  Settings.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"
@interface Settings : UIViewController <PopoverViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *currency;
- (IBAction)saveSettings:(id)sender;
- (IBAction)showPopOver:(UIButton *)sender;

@end
