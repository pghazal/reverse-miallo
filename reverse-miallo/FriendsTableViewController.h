//
//  FriendsTableViewController.h
//  reverse-miallo
//
//  Created by macbookpro1 on 25/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *friendsTable;

@end

