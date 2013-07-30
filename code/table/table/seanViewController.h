//
//  seanViewController.h
//  table
//
//  Created by sean on 7/28/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface seanViewController : UIViewController{
    IBOutlet  UITableView *mainTableView;
    NSMutableArray *knotches;
    
 }
-(void)logButtonRow:(UIButton *)sender;


@end
