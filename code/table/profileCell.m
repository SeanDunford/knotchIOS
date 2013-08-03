//
//  profileCell.m
//  table
//
//  Created by Sean Dunford on 7/30/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "profileCell.h"

@implementation profileCell
@synthesize  viewController, profileTopName, profileSentiment,profileBottomName, profileLocation, profilePicture;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSString *userName = @"Anda Gansca";
    NSString *userLocation = @"San Francisco, California";
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        profileTopName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 350, 42)];
        [profileTopName setText:userName];
        [profileTopName setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:200/255.0 alpha:0.0]];
        [profileTopName setCenter:self.center];
        profileTopName.textAlignment = NSTextAlignmentCenter;
        profileTopName.font = [UIFont systemFontOfSize:16];
        //profileTopName setFont:[UIFont fontNamesForFamilyName:@"Aller_Ltlt.ttf"]];
        UIFont *customFont = [UIFont fontWithName:@"Aller-Light" size:profileTopName.font.pointSize];
        [profileTopName setFont:customFont];
        [self.contentView addSubview:profileTopName];
 
        profileBottomName = [[UILabel alloc]initWithFrame:CGRectMake(105, 165, 320, 40)];
        [profileBottomName setText:userName];
        [profileBottomName setBackgroundColor:[UIColor colorWithRed:100/255.0 green:0/255.0 blue:100/255.0 alpha:0.0]];
        profileBottomName.font = [UIFont systemFontOfSize:18];
        customFont = [UIFont fontWithName:@"Aller" size:profileBottomName.font.pointSize];
        [profileBottomName setFont:customFont];
        //[profileBottomName setCenter:self.center];
        [self.contentView addSubview:profileBottomName];
        
        profileLocation = [[UILabel alloc]initWithFrame:CGRectMake(105, 193, 320, 20)];
        [profileLocation setText:userLocation];
        [profileLocation setBackgroundColor:[UIColor colorWithRed:220/255.0 green:226/255.0 blue:220/255.0 alpha:0.0]];
        [profileLocation setTextColor:[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0]];
        profileLocation.font = [UIFont systemFontOfSize:13];
        customFont = [UIFont fontWithName:@"Aller-Light" size:profileLocation.font.pointSize];
        [profileLocation setFont:customFont];
        [self.contentView addSubview:profileLocation];
        
        profileSentiment = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 320, 115)];
        [profileSentiment setBackgroundColor:[UIColor colorWithRed:100/255.0 green:0/255.0 blue:200/255.0 alpha:1.0]];
        [self.contentView addSubview:profileSentiment];
        
        UIImage *userImage     = [UIImage imageNamed: @"user.png"];
        //When to use _ or regular? Setter and getter in own class
        profilePicture  = [[UIImageView alloc]initWithFrame:CGRectMake(15, 130, 80, 80)];
        [profilePicture setBackgroundColor:[UIColor colorWithRed:0/255.0 green:100/255.0 blue:0/255.0 alpha:1.0]];
        [profilePicture setImage:userImage];
        
        profilePicture.contentMode = UIViewContentModeScaleAspectFill; //UIViewContentModeScaleToFill;
        [self.contentView addSubview:profilePicture];
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
