//
//  GNTTasksViewController.m
//  Intentionally
//
//  Created by Garrett Disco on 5/24/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "GNTTasksViewController.h"
#import "GNTFloatingView.h"

@implementation GNTTasksViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithRed:129/255.0 green:185/255.0 blue:90/255.0 alpha:1];
    CGRect centerSquare = CGRectMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0, 100, 100);
    GNTFloatingView *floatingView = [[GNTFloatingView alloc] initWithFrame:centerSquare];
    floatingView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:floatingView];
}

@end
