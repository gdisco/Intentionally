//
//  GNTLoginView.m
//  Intentionally
//
//  Created by Garrett Disco on 5/23/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "GNTLoginView.h"
#import "FontAwesomeKit.h"
#import "UIView+Autolayout.h"
#import "SlideNavigationController.h"
#import "GNTTasksViewController.h"

@interface GNTLoginView()<UIGestureRecognizerDelegate, UITextFieldDelegate>
@end

@implementation GNTLoginView {
    UITextField *_usernameTextField;
    UITextField *_passwordTextField;
}

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:129/255.0 green:185/255.0 blue:90/255.0 alpha:1];
        
        // Create gesture recognizer for tapping out of text fields
        UITapGestureRecognizer *tapOffRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_backgroundTapped)];
        [self addGestureRecognizer:tapOffRecognizer];
        
        // Create username text field
        _usernameTextField = [[UITextField alloc] init];
        _usernameTextField.borderStyle = UITextBorderStyleLine;
        _usernameTextField.textAlignment = NSTextAlignmentLeft;
        _usernameTextField.delegate = self;
        _usernameTextField.placeholder = @"username";
        _usernameTextField.returnKeyType = UIReturnKeyNext;
        
        // Create password text field
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.borderStyle = UITextBorderStyleLine;
        _passwordTextField.textAlignment = NSTextAlignmentLeft;
        _passwordTextField.delegate = self;
        _passwordTextField.placeholder = @"password";
        _passwordTextField.returnKeyType = UIReturnKeyGo;
        
        // Set up icon next to username field
        FAKFontAwesome *userIcon = [FAKFontAwesome userIconWithSize:18];
        [userIcon addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]];
        UIImage *userImage = [userIcon imageWithSize:CGSizeMake(18, 18)];
        UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
        userImageView.frame = CGRectMake(0, 0, userImage.size.width + 10, userImage.size.height);
        userImageView.contentMode = UIViewContentModeCenter;
        _usernameTextField.leftView = userImageView;
        _usernameTextField.leftViewMode = UITextFieldViewModeAlways;
        
        // Set up icon next to password field
        FAKFontAwesome *keyIcon = [FAKFontAwesome keyIconWithSize:18];
        [keyIcon addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]];
        UIImage *keyImage = [keyIcon imageWithSize:CGSizeMake(18, 18)];
        UIImageView *keyImageView = [[UIImageView alloc] initWithImage:keyImage];
        keyImageView.frame = CGRectMake(0, 0, userImage.size.width + 10, keyImage.size.height);
        keyImageView.contentMode = UIViewContentModeCenter;
        _passwordTextField.leftView = keyImageView;
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        
        // Add fields as subviews
        [self addConstrainedSubview:_usernameTextField];
        [self addConstrainedSubview:_passwordTextField];
        
        // Set up text field constraints
        NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_usernameTextField, _passwordTextField);
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_usernameTextField
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_usernameTextField
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[_usernameTextField]-50-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewsDict]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[_passwordTextField]-50-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_usernameTextField(40)]-10-[_passwordTextField(40)]"
                                                                     options:NSLayoutFormatAlignAllCenterX
                                                                     metrics:nil
                                                                       views:viewsDict]];
    }
    return self;
}

#pragma mark - UITapGestureRecognizer

- (void)_backgroundTapped {
    [self endEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField.placeholder isEqualToString:@"username"]) {
        [_passwordTextField becomeFirstResponder];
    }
    else if ([textField.placeholder isEqualToString:@"password"]) {
        GNTTasksViewController *tasksVC = [[GNTTasksViewController alloc] init];
        tasksVC.view.frame = self.bounds;
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:tasksVC withSlideOutAnimation:YES andCompletion:nil];
    }
    return YES;
}

@end
