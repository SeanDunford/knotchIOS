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
    [self getKnotches:20];
}
-(void)reloadTableData:(userProfile *)profile{
    //updateTableData
    knotch *aKnotch = knotches[0];
    aKnotch.Title = profile.name;
    [mainTableView reloadData];
}
- (void)getKnotchUserFeed{
    knotchWebHandler *knotchWH = [[knotchWebHandler alloc]init:@"500e3b57bbcd08696800000a" andCount:@"20" andView:self];
    [knotchWH getUserFeed];
    
}


- (void)getKnotches: (NSInteger)count{
    
    for(int i = 0; i < count ;i++)
    {
       knotch *aKnotch = [[knotch alloc]init]; 
        aKnotch.Title = [NSString stringWithFormat:@"knotch Topic %d", i];
        aKnotch.Comment = [NSString stringWithFormat:@"This is my very long Opinion about topic number %d", i];
        [knotches addObject:aKnotch];
    }
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
    numberGlory.text     = @"3456";
    numberFollowers.text = @"5772";
    numberFollowing.text = @"6363";
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
    
    UIImage *sentimentImage     = [UIImage imageNamed: @"sentimentBar.png"];
    UIImageView *sentimentBar   = [[UIImageView alloc]initWithFrame:CGRectMake(0, 42, 320, 40)];
    [sentimentBar setImage:sentimentImage];
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
        cellCount = 20;
    }
    return cellCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if(indexPath.section == 0){
        profileCell *profCell = (profileCell *)[tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];
        if (profCell == nil){
            profCell =  [[profileCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProfileCell"];
        }
        profCell.viewController = self;
        
        cell =  (UITableViewCell *)profCell;

    }
    if(indexPath.section == 1){
      knotchCell *knotCell = (knotchCell *)[tableView dequeueReusableCellWithIdentifier:@"KnotchCell"];
    if (knotCell == nil){
        knotCell =  [[knotchCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KnotchCell"];
    }
    knotCell.viewController = self;
    knotch *aKnotch = [knotches objectAtIndex:indexPath.row];
    [knotCell.topicLbl setText:[aKnotch Title]];
    [knotCell.knotchComment setText:[aKnotch Comment]];
    knotCell.knotchComment.numberOfLines = 4;
    knotCell.knotchComment.lineBreakMode = NSLineBreakByWordWrapping;
        cell =  (UITableViewCell *)knotCell;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if(userFeed.count >0)
    {
        //Dict has Info
    }
    return (UITableViewCell *)cell;
   }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    int height = 0;
    if(indexPath.section == 0){
        height = 200;
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
