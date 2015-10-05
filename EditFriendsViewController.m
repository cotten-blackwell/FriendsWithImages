//
//  EditFriendsViewController.m
//  FriendsWithImages
//
//  Created by Cotten Blackwell on 10/3/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import "EditFriendsViewController.h"
#import "MSCellAccessory.h"

@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController

UIColor *disclosureColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error:  %@ %@", error, [error userInfo]);
        }
        else {
            self.allUsers = objects;
            NSLog(@"Users:  %@", self.allUsers);
            [self.tableView reloadData];
        }
    }];
    
    self.currentUser = [PFUser currentUser];
    
    disclosureColor = [UIColor colorWithRed:0.553 green:0.439 blue:0.718 alpha:1.0];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allUsers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if ([self isFriend:user]) {
        //cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_CHECKMARK color:disclosureColor];
    }
    else {
        //cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = nil;
    }
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    
    if ([self isFriend:user]) {
        // 1. Remove the checkmark
        //cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = nil;
        
        // 2. Remove from the array of friends
        for (PFUser *friend in self.friends) {
            if ([friend.objectId isEqualToString:user.objectId]) {
                [self.friends removeObject:friend];
                break;
            }
        }
        
        // 3. Remove from the backend
        [friendsRelation removeObject:user];
    }
    else {
        //add them
        //cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_CHECKMARK color:disclosureColor];
        [self.friends addObject:user];
        [friendsRelation addObject:user];
    }
    
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"Error:  %@ %@", error, [error userInfo]);
    }];
    
    
}

#pragma mark - Helper methods

-(BOOL)isFriend:(PFUser *)user {
    for (PFUser *friend in self.friends) {
        if ([friend.objectId isEqualToString:user.objectId]) {
            return YES;
        }
    }
    return NO;
}

















@end
