//
//  knotchCell.h
//  table
//
//  Created by sean on 7/28/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "seanViewController.h"

@interface knotchCell : UITableViewCell{
    UILabel     *topicLbl;
    UIButton    *topicBtn;
    
    seanViewController *viewController;
}
@property (nonatomic, retain) UILabel *topicLbl;
@property (nonatomic, retain) UIButton *topicBtn;
@property (nonatomic) seanViewController *viewController;
@property (nonatomic) UIView *knotchSentiment;
@property (nonatomic, retain) UILabel *knotchComment;
@property (nonatomic, retain) UILabel *knotchQuotes; 
@end
