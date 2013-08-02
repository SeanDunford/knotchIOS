//
//  userFeed.m
//  table
//
//  Created by Sean Dunford on 8/1/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "userFeed.h"
#import "knotch.h"

@implementation userFeed
    @synthesize knotches;

- (userFeed *)initWithArray:(NSArray *)aArray{
        if(self = [super init])
        {
            if(aArray.count != 0)
            {
                knotches = [[NSMutableArray alloc]init]; 
                for(int i = 0; i < aArray.count ;i++)
                {
                    knotch *aKnotch = [[knotch alloc]init];
                    NSDictionary *aDict = aArray[i]; 
                    aKnotch.Title = aDict[@"topic"];
                    aKnotch.Comment = aDict[@"comment"]; 
                   // aKnotch.Comment = aDictionary[i].Comment;
                    [knotches addObject:aKnotch];
                }
            }
            else{
                //Except
            }
        }
        return self; 
    }

@end
