//
//  LogIn.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 27.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogIn : UIViewController

- (IBAction)logInUser:(id)sender;
- (IBAction)logInGuest:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *bnetTag;
@end
