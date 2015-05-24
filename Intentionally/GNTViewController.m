//
//  GNTViewController.m
//  Intentionally
//
//  Created by Garrett Disco on 5/22/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "GNTViewController.h"
#import "GNTLoginView.h"
#import "GNTTasksViewController.h"
#import "UIView+Autolayout.h"
#import "FontAwesomeKit.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationController.h"

@interface GNTViewController()<UITextFieldDelegate, SlideNavigationControllerDelegate>
@end

@implementation GNTViewController {
    GNTTasksViewController *_tasksViewController;
}

// Main view controller's frame takes up the whole screen.
- (void)loadView {    GNTLoginView *loginView = [[GNTLoginView alloc] init];
    UIView *view = [[UIView alloc] init];
    view.frame = [UIScreen mainScreen].bounds;
    self.view = loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// Just make the tasks view controller the same size as the main view controller
- (void)layoutSubviews {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SlideNavigationControllerDelegate
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

@end
