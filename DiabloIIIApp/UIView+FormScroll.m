//
//  UIView.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 23.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "UIView+FormScroll.h"


@implementation UIView (FormScroll)


-(void)scrollToY:(float)y
{
    
    //[UIView beginAnimations:@"registerScroll" context:NULL];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //[UIView setAnimationDuration:0.4];
    self.transform = CGAffineTransformMakeTranslation(0, y);
   // [UIView commitAnimations];
    
}

-(void)scrollToView:(UIView *)view
{
    CGRect theFrame = view.frame;
    float y = theFrame.origin.y - 15;
    y -= 90;
    if (theFrame.origin.y > 100) {
        [self scrollToY:-y];
    } else {
        [self scrollToY:0];
    }
}


-(void)scrollElement:(UIView *)view toPoint:(float)y
{
    CGRect theFrame = view.frame;
    float orig_y = theFrame.origin.y;
    float diff = y - orig_y;
    if (diff < 0) {
        [self scrollToY:diff];
    }
    else {
        [self scrollToY:0];
    }
    
}

@end
