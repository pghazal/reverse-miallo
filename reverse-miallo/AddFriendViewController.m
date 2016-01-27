//
//  AddFriendViewController.m
//  reverse-miallo
//
//  Created by macbookpro1 on 27/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import "AddFriendViewController.h"
#import "FriendTableCell.h"
#import "Friend.h"

@implementation AddFriendViewController {
    NSArray *searchResults;
    
    // TEST:
    NSMutableArray *datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TEST:
    datas = [[NSMutableArray alloc] init];
    [datas addObject:[[Friend alloc] initWithName:@"Martin"]];
    [datas addObject:[[Friend alloc] initWithName:@"Julien"]];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    // Install the search bar as the table header.
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    
    searchResults = [[NSArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"FriendTableCell";
    
    FriendTableCell *cell = (FriendTableCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FriendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    Friend *friend = [searchResults objectAtIndex:indexPath.row];
    
    cell.friendLabel.text = friend.name;
    
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self filterContentForSearchText:searchController.searchBar.text];
}

- (void)filterContentForSearchText:(NSString*)searchText {
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name beginswith[c] %@", searchText];
    searchResults = (NSArray*)[datas filteredArrayUsingPredicate:resultPredicate];
    
    [self.tableView reloadData];
}


@end
