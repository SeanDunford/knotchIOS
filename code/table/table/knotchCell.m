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
@synthesize topicBtn, topicLbl, viewController, knotchSentiment, knotchComment, knotchQuotes;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        topicLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 165, 30)];
        //topicLbl.Font = [UIFont systemFontOfSize:14.0];
        topicLbl.backgroundColor = [UIColor clearColor];
        topicLbl.highlightedTextColor = [UIColor whiteColor];
        topicLbl.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:topicLbl];
        
        topicBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        topicBtn.frame = CGRectMake(290, 7, 20, 30);
        [topicBtn setBackgroundImage:[UIImage imageNamed:@"topicArrow.png"] forState:UIControlStateNormal]; 
        [topicBtn addTarget:self action:@selector(logButtonRow:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:topicBtn];
        
        knotchSentiment = [[UIView alloc]initWithFrame:CGRectMake(15, 40, 290, 65)];
        [knotchSentiment setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 1]];
        [self.contentView addSubview:knotchSentiment];

        knotchQuotes = [[UILabel alloc]initWithFrame:CGRectMake(10, 5 , 500, 50)];
        [knotchQuotes setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 0]];
        knotchQuotes.text = @"\"";
        knotchQuotes.Font = [UIFont systemFontOfSize:60.0];
        [self.knotchSentiment addSubview:knotchQuotes];
        
        knotchComment= [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 260, 45)];
        [knotchComment setBackgroundColor:[UIColor colorWithRed:(0.0 / 255.0) green:(255 / 255.0) blue:(100/ 255.0) alpha: 0]];
        //knotchComment.tag = 101;
        [self.knotchSentiment addSubview:knotchComment];
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
