//
//  seanViewController.m
//  table
//
//  Created by sean on 7/28/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "seanViewController.h"
#import "knotchCell.h"
#import "profileCell.h" 
#import "knotch.h"
#import "knotchWebHandler.h"
#import "userProfile.h"
#import "userFeed.h"
#import "colors.h"

@interface seanViewController ()
-(void)initTableView;
-(void)getUserFeedResponse;
-(void)getKnotches: (NSInteger) count;

@end

@implementation seanViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self getKnotchUserFeed];
}
-(void)reloadTableData:(userProfile *)profile withFeed:(userFeed *)feed{
    //updateTableData
    knotches = feed.knotches;
    profileSentiment = [feed getMostUsedSentiment] *2;
    for (int i = 0; i < 11; i++) {
        sentimentCount[i] = (int *)[feed getSentimentCount:i];
    }
    
    name            = profile.name;
    location        = profile.location;
    profilePicUrl   = profile.picURI;
    numGlory        = profile.numGlory;
    NSLog(@"%@",profile.numGlory);
    NSLog(@"%@",numGlory); 
    numFollowing    = profile.numFollowing;
    numFollowers    = profile.numFollowers;

    [mainTableView reloadData];
}
- (void)getKnotchUserFeed{
    //500e3b57bbcd08696800000a
    //5019296f1f5dc55304003c58
    userId = @"500e3b57bbcd08696800000a";
    knotchesToGet = 10;
    NSString *count = [NSString stringWithFormat:@"%d", (int)knotchesToGet];
    knotchWebHandler *knotchWH = [[knotchWebHandler alloc]init:userId andCount:count andView:self];
    [knotchWH getUserFeed];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    int height = 0;
    if (section >0)
        height= 90;
    return (float) height; 
        
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //This should be an object similar to Cell....do that later. 
    UIView *headerView = nil;
    if(section == 1){
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    headerView                  = [[UIView alloc] initWithFrame:CGRectMake(0,    0, 320,   0)];
    UILabel *titleGlory         = [[UILabel alloc]initWithFrame:CGRectMake(0,   21,  80,  21)];
    UILabel *numberGlory        = [[UILabel alloc]initWithFrame:CGRectMake(0,    0,  80,  21)];
    UILabel *titleFollowers     = [[UILabel alloc]initWithFrame:CGRectMake(80,  21,  80,  21)];
    UILabel *numberFollowers    = [[UILabel alloc]initWithFrame:CGRectMake(80,   0,  80,  21)];
    UILabel *titleFollowing     = [[UILabel alloc]initWithFrame:CGRectMake(160, 21,  80,  21)];
    UILabel *numberFollowing    = [[UILabel alloc]initWithFrame:CGRectMake(160,  0,  80,  21)];
    UILabel *following          = [[UILabel alloc]initWithFrame:CGRectMake(240,  0,  80,  42)];
    
    titleGlory.text      = @"Glory";
    titleFollowers.text  = @"Followers";
    titleFollowing.text  = @"Following";
        
    numberGlory.text     = [NSString stringWithFormat:@"%@",numGlory]; 
    numberFollowers.text = [NSString stringWithFormat:@"%@",numFollowers];
    numberFollowing.text = [NSString stringWithFormat:@"%@",numFollowing];
    following.text       = @"✓Following"; 
        
    titleGlory.textAlignment      = NSTextAlignmentCenter;
    titleFollowers.textAlignment  = NSTextAlignmentCenter;
    titleFollowing.textAlignment  = NSTextAlignmentCenter;
    numberGlory.textAlignment     = NSTextAlignmentCenter;
    numberFollowers.textAlignment = NSTextAlignmentCenter;
    numberFollowing.textAlignment = NSTextAlignmentCenter;
    following.textAlignment       = NSTextAlignmentCenter;
        
    titleGlory.font      = [UIFont systemFontOfSize:11];
    titleFollowers.font  = [UIFont systemFontOfSize:11];
    titleFollowing.font  = [UIFont systemFontOfSize:11];
        
    numberGlory.font     = [UIFont systemFontOfSize:16];
    numberFollowers.font = [UIFont systemFontOfSize:16];   
    numberFollowing.font = [UIFont systemFontOfSize:16];   
    following.font       = [UIFont systemFontOfSize:14];

    [following setTextColor:[UIColor whiteColor]];

    [titleGlory      setBackgroundColor:[UIColor colorWithRed: (243 / 255.0) green:(243 / 255.0) blue:(243/ 255.0) alpha: 1]];
    [titleFollowers  setBackgroundColor:[UIColor colorWithRed: (235 / 255.0) green:(235 / 255.0) blue:(235/ 255.0) alpha: 1]];
    [titleFollowing  setBackgroundColor:[UIColor colorWithRed: (227 / 255.0) green:(227 / 255.0) blue:(227/ 255.0) alpha: 1]];
    [numberGlory     setBackgroundColor:[UIColor colorWithRed: (243 / 255.0) green:(243 / 255.0) blue:(243/ 255.0) alpha: 1]];
    [numberFollowers setBackgroundColor:[UIColor colorWithRed: (235 / 255.0) green:(235 / 255.0) blue:(235/ 255.0) alpha: 1]];
    [numberFollowing setBackgroundColor:[UIColor colorWithRed: (227 / 255.0) green:(227 / 255.0) blue:(227/ 255.0) alpha: 1]];
    [following       setBackgroundColor:[UIColor colorWithRed: (000 / 255.0) green:(000 / 255.0) blue:(000/ 255.0) alpha: 1]];
        
    [headerView addSubview:titleGlory];
    [headerView addSubview:titleFollowers];
    [headerView addSubview:titleFollowing];
    
    [headerView addSubview:numberGlory];
    [headerView addSubview:numberFollowers];
    [headerView addSubview:numberFollowing];
        
    [headerView addSubview:following]; 
    
    UIView *sentimentBar   = [[UIImageView alloc]initWithFrame:CGRectMake(0, 42, 320, 40)];
    [sentimentBar setBackgroundColor:[UIColor blackColor]];
    colors *colorFactory = [[colors alloc]init];
        
    if(knotches > 0){
        UIView *sentiment0  = [[UIView alloc]init];
        [sentiment0 setBackgroundColor:[colorFactory getColorFromID:0]];
        UIView *sentiment1  = [[UIView alloc]init];
        [sentiment1 setBackgroundColor:[colorFactory getColorFromID:2]];
        UIView *sentiment2  = [[UIView alloc]init];
        [sentiment2 setBackgroundColor:[colorFactory getColorFromID:4]];
        UIView *sentiment3  = [[UIView alloc]init];
        [sentiment3 setBackgroundColor:[colorFactory getColorFromID:6]];
        UIView *sentiment4  = [[UIView alloc]init];
        [sentiment4 setBackgroundColor:[colorFactory getColorFromID:8]];
        UIView *sentiment5  = [[UIView alloc]init];
        [sentiment5 setBackgroundColor:[colorFactory getColorFromID:10]];
        UIView *sentiment6  = [[UIView alloc]init];
        [sentiment6 setBackgroundColor:[colorFactory getColorFromID:12]];
        UIView *sentiment7  = [[UIView alloc]init];
        [sentiment7 setBackgroundColor:[colorFactory getColorFromID:14]];
        UIView *sentiment8  = [[UIView alloc]init];
        [sentiment8 setBackgroundColor:[colorFactory getColorFromID:16]];
        UIView *sentiment9  = [[UIView alloc]init];
        [sentiment9 setBackgroundColor:[colorFactory getColorFromID:18]];
        UIView *sentiment10 = [[UIView alloc]init];
        [sentiment10 setBackgroundColor:[colorFactory getColorFromID:20]];
    
        float x = 15;
        float totalWidth = 290;
        float width = 0;
        //Not sure why i need 
        int count = sentimentCount[0];
        width = (count  / knotchesToGet) * totalWidth;
        [sentiment0 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[1];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment1 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[2];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment2 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[3];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment3 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[4];
        width = ((count  /knotchesToGet) * totalWidth);
        [sentiment4 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[5];
        width = (float)(count  /knotchesToGet) * totalWidth;
        [sentiment5 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[6];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment6 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[7];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment7 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[8];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment8 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[9];
        width = (count  /knotchesToGet) * totalWidth;
        [sentiment9 setFrame:CGRectMake(x, 15, width, 10)];
        x +=width;
        count = sentimentCount[10];
        width = (count /knotchesToGet) * totalWidth;
        [sentiment10 setFrame:CGRectMake(x, 15, width, 10)];
        
        [sentimentBar addSubview:sentiment0];
        [sentimentBar addSubview:sentiment1];
        [sentimentBar addSubview:sentiment2];
        [sentimentBar addSubview:sentiment3];
        [sentimentBar addSubview:sentiment4];
        [sentimentBar addSubview:sentiment5];
        [sentimentBar addSubview:sentiment6];
        [sentimentBar addSubview:sentiment7];
        [sentimentBar addSubview:sentiment8];
        [sentimentBar addSubview:sentiment9];
        [sentimentBar addSubview:sentiment10];
    }
    [headerView addSubview:sentimentBar];
    [headerView setBackgroundColor:[UIColor colorWithRed:(255 / 255.0) green:(0.0 / 255.0) blue:(0.0/ 255.0) alpha: 0]];
    //mainTableView.tableHeaderView = headerView;
    }
    return headerView;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int cellCount = 0;
    if(section == 0){
        cellCount = 1;
    }
    else{
        cellCount = knotchesToGet;
    }
    return cellCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    colors *colorFactory = [[colors alloc]init];
    if(indexPath.section == 0){
        profileCell *profCell = (profileCell *)[tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];
        if (profCell == nil){
            profCell =  [[profileCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProfileCell"];
        }
            profCell.viewController = self;
            profCell.profileTopName.text = name;
            profCell.profileBottomName.text = name;
            NSURL *url = [NSURL URLWithString:profilePicUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            if(knotches.count > 0){
                profCell.profileSentiment.backgroundColor = [colorFactory getColorFromID:(profileSentiment)];
                
            }
            profCell.profilePicture.image = image;
        
        
        
        cell =  (UITableViewCell *)profCell;

    }
    if(indexPath.section == 1){
        knotchCell *knotCell = (knotchCell *)[tableView dequeueReusableCellWithIdentifier:@"KnotchCell"];
        if (knotCell == nil){
            knotCell =  [[knotchCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KnotchCell"];
        }
        if(knotches.count > 0)
        {
            knotCell.viewController = self;
            knotch *aKnotch = [knotches objectAtIndex:indexPath.row];
            [knotCell.topicLbl setText:[aKnotch Title]];
            [knotCell.knotchComment setText:[aKnotch Comment]];
            knotCell.knotchComment.numberOfLines = 4;
            knotCell.knotchComment.lineBreakMode = NSLineBreakByWordWrapping;
            knotCell.knotchSentiment.backgroundColor = [colorFactory getColorFromID:aKnotch.sentimentColor];
        }
        cell =  (UITableViewCell *)knotCell;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return (UITableViewCell *)cell;
   }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    int height = 0;
    if(indexPath.section == 0){
        height = 230;
    }
    else {
        height = 120;
    }
    return height;
}
- (void)logButtonRow:(UIButton *)sender{
    knotchCell *parentCell = (knotchCell *)[[sender superview] superview];
    NSIndexPath *indexPathOfCell = [mainTableView indexPathForCell:parentCell];
    NSLog(@"log %d", indexPathOfCell.row);
    
    
    //call the superView twice because first one gets something else lol d 
}
- (void)switchChanged:(UISwitch *)sender
{
    knotchCell *theParentCell = (knotchCell *)[[sender superview]superview];
    NSIndexPath *indexPathOfSwitch = [mainTableView indexPathForCell:theParentCell];
    if(sender.on)
    {
        [knotches replaceObjectAtIndex:indexPathOfSwitch.row withObject:@"ON"];
    }
    else
    {
        [knotches replaceObjectAtIndex:indexPathOfSwitch.row withObject:@"OFF"];
    }
}

@end
