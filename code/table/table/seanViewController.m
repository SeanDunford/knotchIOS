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

@end

@implementation seanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    knotches = [[NSMutableArray alloc] init];
    [self getKnotches:20];
}
- (void)getKnotches: (NSInteger)count{
    knotch *aKnotch = [[knotch alloc]init];
    for(int i = 0; i < count ;i++)
    {
        aKnotch.Title = [NSString stringWithFormat:@"knotch Topic %d", i];
        aKnotch.Comment = [NSString stringWithFormat:@"this is my opinion about this %d bs", i];
        NSString *knotchTitle = aKnotch.Title;
        [knotches addObject:knotchTitle];
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.topicLbl.text = [knotches objectAtIndex:indexPath.row];
    
    
    UILabel *aLabel = (UILabel*)[cell.knotchSentiment viewWithTag:101].text;
    //Something here is not working........>...>>.>>>..>.>.
    aLabel.text = [knotches objectAtIndex:indexPath.row];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);

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
    knotchCell *parentCell = [[sender superview] superview];
    NSIndexPath *indexPathOfCell = [mainTableView indexPathForCell:parentCell];
    NSLog(@"log %d", indexPathOfCell.row);
    
    
    //call the superView twice because first one gets something else lol d 
}
- (void)switchChanged:(UISwitch *)sender
{
    knotchCell *theParentCell = [[sender superview]superview];
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
