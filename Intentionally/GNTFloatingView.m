//
//  GNTFloatingView.m
//  Intentionally
//
//  Created by Garrett Disco on 5/25/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "GNTFloatingView.h"

@implementation GNTFloatingView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw view as a red circle
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, rect.size.height/2.0);
    CGContextAddArc(context, rect.size.width/2.0, rect.size.height/2.0, rect.size.width/2, 0, M_PI, 1);
        CGContextAddArc(context, rect.size.width/2.0, rect.size.height/2.0, rect.size.width/2, 0, M_PI, 0);
    CGContextSetRGBFillColor(context, 255/255.0, 0, 0, 1);
    CGContextFillPath(context);
}

@end
