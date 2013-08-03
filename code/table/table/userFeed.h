//
//  userFeed.h
//  table
//
//  Created by Sean Dunford on 8/1/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "userProfile.h"
#import "knotch.h"


@interface userFeed : NSObject
{
        NSMutableArray *knotches;
        userProfile *profile;
        NSInteger sentimentCount[11];
}
- (userFeed *)initWithArray:(NSArray *)aArray;
- (int) getMostUsedSentiment;
- (int) getSentimentCount:(int)identifier;
@property (nonatomic, retain) NSMutableArray *knotches;


@end
