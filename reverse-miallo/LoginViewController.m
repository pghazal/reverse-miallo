//
//  LoginViewController.m
//  reverse-miallo
//
//  Created by macbookpro1 on 27/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import "LoginViewController.h"
#import "FriendsTableViewController.h"
#import <Parse/Parse.h>

@implementation LoginViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    
    if (currentUser) {
        // Go to Friends View
        [self segueLoginToFriends];
    } else {
        // Do nothing
    }
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
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@", errorString);
        }
    }];
}

- (void)logInWithUsername:(NSString*)username password:(NSString*)password {
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Successfully logged in");
                                            [self segueLoginToFriends];
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
    
    if (username.length > 0 && password.length > 0) {
        [self signUpWithUsername:username password:password email:nil];
    } else {
        
    }
    
}

-(IBAction)logIn:(id)sender {
    NSLog(@"Log In");
    
    NSString* username = [self.usernameField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* password = [self.passwordField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (username.length > 0 && password.length > 0) {
        [self logInWithUsername:username password:password];
    } else {
        
    }
}

- (void) segueLoginToFriends {
    FriendsTableViewController* viewController = [[FriendsTableViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
