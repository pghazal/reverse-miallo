//
//  SettingsViewController.m
//  reverse-miallo
//
//  Created by macbookpro1 on 25/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import "SettingsViewController.h"
#import <Parse/Parse.h>

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Disconnect
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self disconnect];
    }
}

- (void)disconnect {
    NSLog(@"Disconnect");
    
    PFUser *currentUser = [PFUser currentUser];
    
    if (currentUser) {
        [PFUser logOut];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        // Go to Login : should never happen
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

@end
