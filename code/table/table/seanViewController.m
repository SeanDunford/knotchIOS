//
//  seanViewController.m
//  table
//
//  Created by sean on 7/28/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "seanViewController.h"
#import "knotchCell.h"
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
    [self initTableView];
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
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    UIView *headerView          = [[UIView alloc] initWithFrame:CGRectMake(0,     0, 315, 130)];
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
    
    [titleGlory setBackgroundColor:[UIColor colorWithRed:(0.0 / 255.0) green:(0.0 / 255.0) blue:(100/ 255.0) alpha: 0]];
    
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
    mainTableView.tableHeaderView = headerView;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    knotchCell *cell = (knotchCell *)[tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if (cell == nil){
        cell =  [[knotchCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    cell.viewController = self;
    knotch *aKnotch = [knotches objectAtIndex:indexPath.row];
    [cell.topicLbl setText:[aKnotch Title]];
    [cell.knotchComment setText:[aKnotch Comment]];
    cell.knotchComment.numberOfLines = 4;
    cell.knotchComment.lineBreakMode = NSLineBreakByWordWrapping;
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
