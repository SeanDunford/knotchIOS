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
        UIFont *customFont = [UIFont fontWithName:@"Aller-Light" size:18];
        
        // Initialization code CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        topicLbl = [[UILabel alloc] initWithFrame:CGRectMake(16, 7, 165, 30)];
        //topicLbl.Font = [UIFont systemFontOfSize:14.0];
        topicLbl.backgroundColor = [UIColor clearColor];
        topicLbl.highlightedTextColor = [UIColor whiteColor];
        topicLbl.adjustsFontSizeToFitWidth = NO;
        topicLbl.lineBreakMode = NSLineBreakByTruncatingTail;
        [topicLbl setFont:customFont];
        [self.contentView addSubview:topicLbl];
        
        topicBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        topicBtn.frame = CGRectMake(285, 7, 20, 30);
        [topicBtn setBackgroundImage:[UIImage imageNamed:@"topicArrow.png"] forState:UIControlStateNormal]; 
        [topicBtn addTarget:self action:@selector(logButtonRow:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:topicBtn];
        
        knotchSentiment = [[UIView alloc]initWithFrame:CGRectMake(15, 55, 290, 85)];
        [knotchSentiment setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 1]];
        [self.contentView addSubview:knotchSentiment];

        knotchQuotes = [[UILabel alloc]initWithFrame:CGRectMake(5, 0 , 500, 40)];
        [knotchQuotes setBackgroundColor:[UIColor colorWithRed:(128.0 / 255.0) green:(90.0 / 255.0) blue:(200.0 / 255.0) alpha: 0]];
        knotchQuotes.text = @"\xE2\x80\x9C";
        customFont = [UIFont fontWithName:@"TimesNewRomanPSMT" size:40];
        [knotchQuotes setTextColor:[UIColor whiteColor]];
        [knotchQuotes setFont:customFont];
        [self.knotchSentiment addSubview:knotchQuotes];
        
        knotchComment= [[UILabel alloc]initWithFrame:CGRectMake(5, 20, 260, 45)];
        [knotchComment setBackgroundColor:[UIColor colorWithRed:(0.0 / 255.0) green:(255 / 255.0) blue:(100/ 255.0) alpha: 0]];
        knotchComment.numberOfLines = 2;
        knotchComment.lineBreakMode = NSLineBreakByTruncatingTail;
        customFont = [UIFont fontWithName:@"Georgia" size:18];
        //[knotchComment setTextColor:[UIColor whiteColor]];
        [knotchComment setFont:customFont];
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
