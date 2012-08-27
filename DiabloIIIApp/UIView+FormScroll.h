//
//  UIView.h
//  DiabloIIIApp
//
//  Created by Vesela Popova on 23.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

@interface UIView (FormScroll)

-(void)scrollToY:(float)y;
-(void)scrollToView:(UIView *)view;
-(void)scrollElement:(UIView *)view toPoint:(float)y;

@end
