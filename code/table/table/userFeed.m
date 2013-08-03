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
   
    for (int i = 0; i < 11; i++)
        sentimentCount[i] = 0;
    
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
                    NSString *aString = aDict[@"sentiment"];
                    NSInteger sentimentIndex = [aString integerValue];
                    sentimentCount[sentimentIndex/2]++;
                    aKnotch.sentimentColor = sentimentIndex;
                    [knotches addObject:aKnotch];
                }
            }
            else{
                //Except
            }
        }
        return self; 
    }
- (int) getMostUsedSentiment{
    int result = 0;
    for (int i = 0; i<11; i++) {
        if(sentimentCount[i] > sentimentCount[result])
            result = i;
    }
    return result;
}
- (int ) getSentimentCount:(int)identifier{
    return sentimentCount[identifier];
}
@end
