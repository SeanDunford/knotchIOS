//
//  colorFromSentiment.h
//  table
//
//  Created by Sean Dunford on 8/2/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface colors : NSObject{
    NSMutableArray *sentimentColors;
}

@property (nonatomic,retain) NSMutableArray *sentimentColors;
- (UIColor *) getColorFromID:(int)colorID;
@end
