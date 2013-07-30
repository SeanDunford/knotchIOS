//
//  knotchCell.m
//  table
//
//  Created by sean on 7/28/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "knotchCell.h"
#import "seanViewController.h"

@implementation knotchCell
@synthesize topicBtn, topicLbl, viewController; 
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        topicLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 165, 30)];
        topicLbl.Font = [UIFont systemFontOfSize:14.0];
        topicLbl.backgroundColor = [UIColor clearColor];
        topicLbl.highlightedTextColor = [UIColor whiteColor];
        topicLbl.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:topicLbl];
        
        topicBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        topicBtn.frame = CGRectMake(290, 7, 20, 30);
        [topicBtn setBackgroundImage:[UIImage imageNamed:@"topicArrow.png"] forState:UIControlStateNormal]; 
        [topicBtn addTarget:self action:@selector(logButtonRow:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:topicBtn];
        
        knotchSentiment = [[UIView alloc]initWithFrame:CGRectMake(30, 40, 280, 200)];
        [knotchSentiment setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 1]];
        [self.contentView addSubview:knotchSentiment];

        UILabel *knotchQuotes = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 500, 50)];
        [knotchQuotes setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 0]];
        knotchQuotes.text = @"\"";
        knotchQuotes.Font = [UIFont systemFontOfSize:88.0];
        [knotchSentiment addSubview:knotchQuotes];
        
        UILabel *knotchComment = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 500, 50)];
         [knotchComment setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 0]];
        knotchComment.tag = 101;
        [knotchSentiment addSubview:knotchComment];
        
    }
    return self;
}
- (void)logButtonRow:(UIButton *)sender{
    
    [self.viewController logButtonRow:sender];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
