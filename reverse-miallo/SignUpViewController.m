//
//  SignUpViewController.m
//  reverse-miallo
//
//  Created by macbookpro1 on 28/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)signUpWithUsername:(NSString*)username password:(NSString*)password email:(NSString*)email{
    PFUser *user = [PFUser user];
    user.username = username;
    user.password = password;
    user.email = email;
    
    // other fields can be set just like with PFObject
    //user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"User created");
            [self dismissViewControllerAnimated:YES completion:^(void) {
                NSLog(@"View Dismissed");
            }];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@", errorString);
        }
    }];
}

-(IBAction)signUp:(id)sender {
    NSLog(@"Sign Up");
    
    NSString* username = [self.usernameField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* password = [self.passwordField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* confirmPassword = [self.confirmPasswordField.text stringByTrimmingCharactersInSet:
                                 [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* email = [self.emailField.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (username.length > 0 && password.length > 0 && confirmPassword > 0 && email > 0) {
        if ([password isEqualToString:confirmPassword]) {
            if ([email isValidEmail]) {
                [self signUpWithUsername:username password:password email:email];
            } else {
                // Email not valid
            }
        } else {
            // Passwords dont match
        }
    } else {
        // Missing fields
    }
    
}

@end

@implementation NSString (emailValidation)

-(BOOL)isValidEmail
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
