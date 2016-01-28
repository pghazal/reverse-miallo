//
//  SignUpViewController.h
//  reverse-miallo
//
//  Created by macbookpro1 on 28/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end

@interface NSString (emailValidation)

- (BOOL)isValidEmail;

@end
