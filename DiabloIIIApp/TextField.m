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
        [self setBackgroundColor:[UIColor colorWithRed:(93.0f/225.0f) green:(123.0f/225.0f) blue:(147.0f/225.0f) alpha:1.0f]];
        [self setTextColor:[UIColor whiteColor]];
        [self setFont:[UIFont fontWithName:@"Cochin-Bold" size:15.0]];
    }
    return self;
}




@end
