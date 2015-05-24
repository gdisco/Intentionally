//
//  GNTViewController.m
//  Intentionally
//
//  Created by Garrett Disco on 5/22/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "GNTViewController.h"
#import "UIView+Autolayout.h"

@interface GNTViewController()<UITextFieldDelegate>
@end

@implementation GNTViewController

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor colorWithRed:129/255.0 green:185/255.0 blue:90/255.0 alpha:1];
    
    UITapGestureRecognizer *tapOffRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_backgroundTapped)];
    [view addGestureRecognizer:tapOffRecognizer];
    
    UITextField *funTextField = [[UITextField alloc] init];
    funTextField.borderStyle = UITextBorderStyleLine;
    funTextField.textAlignment = NSTextAlignmentCenter;
    funTextField.placeholder = @"username";
    [view addConstrainedSubview:funTextField];

    // Line up the text field in the center of the view.
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(funTextField);
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:funTextField attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:funTextField attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[funTextField]-50-|" options:0 metrics:nil views:viewsDict]];
    
    self.view = view;
 }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Touch Event Handling
- (void)_backgroundTapped {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate

@end
