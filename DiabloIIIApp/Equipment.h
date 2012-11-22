//
//  Equipment.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 14.11.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Equipment : UIViewController
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property int heroIndex;
- (IBAction)changePage:(id)sender;

@end
