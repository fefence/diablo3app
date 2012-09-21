//
//  Button.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "Button.h"

@implementation Button

- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cartographer.png"]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
