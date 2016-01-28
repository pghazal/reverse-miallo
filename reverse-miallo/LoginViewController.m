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

-(IBAction)logIn:(id)sender {
    NSLog(@"Log In");
    
    NSString* username = [self.usernameField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* password = [self.passwordField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (username.length > 0 && password.length > 0) {
        [self logInWithUsername:username password:password];
    } else {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"User wrong"
                                                      message:@"Fill up again the user info"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
}

- (void) segueLoginToFriends {
    [self performSegueWithIdentifier:@"LoginToFriends" sender:nil];
}

@end
