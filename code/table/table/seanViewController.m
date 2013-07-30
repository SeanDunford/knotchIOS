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

@interface seanViewController ()
-(void)initTableView;

@end

@implementation seanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    knotches = [[NSMutableArray alloc] init];
    [self getKnotches:20];
    //[self initTableView];
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
-(void)initTableView{
}
- (CGFloat)tableView:(UITableView *)tableViewheightForHeaderInSection:(NSInteger)section{
    return UITableViewAutomaticDimension;
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = nil;
    if(section == 1){
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    headerView          = [[UIView alloc] initWithFrame:CGRectMake(0,     0, 315, 0 )];
    UILabel *titleGlory         = [[UILabel alloc]initWithFrame:CGRectMake(10,    0, 200, 30)];
    UILabel *numberGlory        = [[UILabel alloc]initWithFrame:CGRectMake(10,   30, 200, 30)];
    UILabel *titleFollowers     = [[UILabel alloc]initWithFrame:CGRectMake(60,    0, 200, 30)];
    UILabel *numberFollowers    = [[UILabel alloc]initWithFrame:CGRectMake(60,   30, 200, 30)];
    UILabel *titleFollowing     = [[UILabel alloc]initWithFrame:CGRectMake(110,   0, 200, 30)];
    UILabel *numberFollowing    = [[UILabel alloc]initWithFrame:CGRectMake(110,  30, 200, 30)];
    
    titleGlory.text      = @"a";
    titleFollowers.text  = @"c";
    titleFollowing.text  = @"e";
    numberGlory.text     = @"b";
    numberFollowers.text = @"d";
    numberFollowing.text = @"f";
    
    [titleGlory setBackgroundColor:[UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255/ 255.0) alpha: 0]];
    [titleFollowers setBackgroundColor:[UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255/ 255.0) alpha: 0]];
    [titleFollowing setBackgroundColor:[UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255/ 255.0) alpha: 0]];
    [numberGlory setBackgroundColor:[UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255/ 255.0) alpha: 0]];
    [numberFollowers setBackgroundColor:[UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255/ 255.0) alpha: 0]];
    [numberFollowing setBackgroundColor:[UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255/ 255.0) alpha: 0]];
    [headerView addSubview:titleGlory];
    [headerView addSubview:titleFollowers];
    [headerView addSubview:titleFollowing];
    
    [headerView addSubview:numberGlory];
    [headerView addSubview:numberFollowers];
    [headerView addSubview:numberFollowing];
    
    UIImage *sentimentImage     = [UIImage imageNamed: @"sentimentBar.png"];
    UIImageView *sentimentBar   = [[UIImageView alloc]initWithFrame:CGRectMake(0, 65, 320, 50)];
    [sentimentBar setImage:sentimentImage];
    [headerView addSubview:sentimentBar];
    [headerView setBackgroundColor:[UIColor colorWithRed:(255 / 255.0) green:(0.0 / 255.0) blue:(0.0/ 255.0) alpha: 1]];
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
        return (UITableViewCell *)profCell; 

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
        return (UITableViewCell *)knotCell; 
    }
    return (UITableViewCell *)cell;
   }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row %2 == 3) {
        return 45;
    }
    return 250;
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
