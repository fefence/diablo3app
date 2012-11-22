//
//  LogIn.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 27.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"

@interface LogIn : UIViewController
@property (strong, nonatomic) IBOutlet TextField *userId;
- (IBAction)logIn:(id)sender;
@end
