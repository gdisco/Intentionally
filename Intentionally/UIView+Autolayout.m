//
//  UIView+Autolayout.m
//  Intentionally
//
//  Created by Garrett Disco on 5/23/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

- (void)addConstrainedSubview:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
}

@end
