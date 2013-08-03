//
//  colorFromSentiment.m
//  table
//
//  Created by Sean Dunford on 8/2/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "colors.h"
@implementation colors
@synthesize sentimentColors;

- (UIColor *) getColorFromID:(int )colorID{
    UIColor *color;
    switch (colorID){
        case  0: //#2e5ca6
            color = [UIColor colorWithRed: 46/255.0 green: 92/255.0 blue:166/255.0 alpha:1.0];
            break;
        case  2: //#586db9
            color = [UIColor colorWithRed: 88/255.0 green:109/255.0 blue:185/255.0 alpha:1.0];
            break;
        case  4: //#008fd0
            color = [UIColor colorWithRed:  0/255.0 green:143/255.0 blue:208/255.0 alpha:1.0];
            break;
        case  6: //#57cccc
            color = [UIColor colorWithRed: 87/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
            break;
        case  8: //#ceebee
            color = [UIColor colorWithRed:206/255.0 green:235/255.0 blue:238/255.0 alpha:1.0];
            break;
        case 10: //#ffffff
            color = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
            break;
        case 12: //#ffeec3
            color = [UIColor colorWithRed:255/255.0 green:238/255.0 blue:195/255.0 alpha:1.0];
            break;
        case 14: //#ffcc43
            color = [UIColor colorWithRed:255/255.0 green:204/255.0 blue: 67/255.0 alpha:1.0];
            break;
        case 16: //#ffa02d
            color = [UIColor colorWithRed:255/255.0 green:160/255.0 blue: 45/255.0 alpha:1.0];
            break;
        case 18: //#ff6d3a
            color = [UIColor colorWithRed:255/255.0 green:109/255.0 blue: 58/255.0 alpha:1.0];
            break;
        case 20: //#ee443a 
            color = [UIColor colorWithRed:255/255.0 green:109/255.0 blue: 58/255.0 alpha:1.0];
            break;
    }
    return color; 
}

@end
