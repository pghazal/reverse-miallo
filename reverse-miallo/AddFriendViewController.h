//
//  AddFriendViewController.h
//  reverse-miallo
//
//  Created by macbookpro1 on 27/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddFriendViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>

@property (strong, nonatomic) UISearchController *searchController;

//- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;

@end
