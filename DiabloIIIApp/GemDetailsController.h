//
//  GemDetailsController.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 28.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GemDetailsController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *gemType;
@property (strong, nonatomic) IBOutlet UILabel *available;
@property (strong, nonatomic) IBOutlet UILabel *AHPrice;
@property (strong, nonatomic) IBOutlet UILabel *needed;
@property (strong, nonatomic) IBOutlet UILabel *needToCraft;
@property (strong, nonatomic) IBOutlet UILabel *craftPrice;

@end
