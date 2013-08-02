//
//  KnotchWebHandler.h
//  table
//
//  Created by Sean Dunford on 8/1/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "seanViewController.h"

@interface knotchWebHandler : NSObject{
    NSMutableData *responseData;
    NSURLRequest  *request;
    NSDictionary  *response;
    seanViewController *callBackView; 
}
- (knotchWebHandler*) init: (NSString*)user andCount:(NSString *)count andView:(seanViewController *)view;
- (void)getUserFeed;
@end
