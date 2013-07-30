//
//  profileCell.h
//  table
//
//  Created by Sean Dunford on 7/30/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "seanViewController.h"

@interface profileCell : UITableViewCell{
    seanViewController *viewController;
}
@property (nonatomic, retain) UILabel *profileName;
@property (nonatomic) seanViewController *viewController;
@end
