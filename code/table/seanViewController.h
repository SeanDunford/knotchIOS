//
//  seanViewController.h
//  table
//
//  Created by sean on 7/28/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userProfile.h"
#import "userFeed.h"

@interface seanViewController : UIViewController{
    IBOutlet  UITableView *mainTableView;
    IBOutlet  UILabel *profileTopName;
    NSMutableArray *knotches;
    NSDictionary *userFeed;
    NSString *name;
    NSString *profilePicUrl;
    NSString *location; 
    NSString *numGlory;
    NSString *numFollowing;
    NSString *numFollowers;
    NSInteger profileSentiment;
    float knotchesToGet;
    NSString *userId;
    int *sentimentCount[11];
     }
-(void)logButtonRow:(UIButton *)sender;
-(void)initTableView;
-(void)reloadTableData:(userProfile *)profile withFeed:(userFeed *)feed;
@end
