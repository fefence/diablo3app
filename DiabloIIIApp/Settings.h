//
//  Settings.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDown.h"

@interface Settings : UITableViewController <DropDownDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet DropDown *currency;


@end
