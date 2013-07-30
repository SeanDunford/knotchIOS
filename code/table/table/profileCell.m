//
//  profileCell.m
//  table
//
//  Created by Sean Dunford on 7/30/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "profileCell.h"

@implementation profileCell
@synthesize profileName; 
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        profileName = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 300, 50)];
        [profileName setBackgroundColor:[UIColor colorWithRed:100/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]];
        [self.contentView addSubview:profileName];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
