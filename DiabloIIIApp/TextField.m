//
//  TextField.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 17.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "TextField.h"
#import <QuartzCore/QuartzCore.h>


@implementation TextField

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setBorderStyle:UITextBorderStyleRoundedRect];
        [self setBackgroundColor:[UIColor colorWithRed:(244.0f/225.0f) green:(233.0f/225.0f) blue:(227.0f/225.0f) alpha:1.0f]];
        [self setTextColor:[UIColor colorWithRed:(139.0f/225.0f) green:(69.0f/225.0f) blue:(19.0f/225.0f) alpha:1.0f]];
        [self setFont:[UIFont fontWithName:@"Gill Sans" size:18.0]];
    }
    return self;
}




@end
