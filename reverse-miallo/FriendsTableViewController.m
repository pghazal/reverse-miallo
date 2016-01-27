//
//  FriendsTableViewController.m
//  reverse-miallo
//
//  Created by macbookpro1 on 25/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "FriendTableCell.h"
#import "Friend.h"

@interface FriendsTableViewController ()

@end

@implementation FriendsTableViewController {
    NSMutableArray *friendsData;
    NSMutableArray *friendsSelected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    friendsData = [[NSMutableArray alloc] init];
    friendsSelected = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i++) {
        [friendsData addObject:[[Friend alloc] initWithName:@"Pierre"]];
        [friendsData addObject:[[Friend alloc] initWithName:@"Paul"]];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - Table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [friendsData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"FriendTableCell";
    
    FriendTableCell *cell = (FriendTableCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FriendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if ([friendsSelected containsObject:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    Friend *friend = [friendsData objectAtIndex:indexPath.row];
    
    cell.friendLabel.text = friend.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([friendsSelected containsObject:indexPath]) {
        [friendsSelected removeObject:indexPath];
    }
    else {
        [friendsSelected addObject:indexPath];
    }
    
    [tableView reloadData];
}

/*
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [tableView cellForRowAtIndexPath:indexPath];
    tableViewCell.accessoryView.hidden = YES;
    tableViewCell.accessoryType = UITableViewCellAccessoryNone;
} */

@end
