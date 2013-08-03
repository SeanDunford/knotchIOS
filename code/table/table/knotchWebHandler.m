//
//  KnotchWebHandler.m
//  table
//
//  Created by Sean Dunford on 8/1/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "knotchWebHandler.h"
#import "userProfile.h"
#import "userFeed.h"

@implementation knotchWebHandler

- (knotchWebHandler*) init: (NSString*)user andCount:(NSString *)count andView:(seanViewController *)view{
    if(self = [super init])
    {
        NSString *requestString = @"";
        requestString = [requestString stringByAppendingFormat:@"http://dev.knotch.it:8080/miniProject/user_feed/%@/%@", user, count];
        callBackView = view;
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestString]];
    }
    return self;
}
- (void)getUserFeed{
    responseData = [NSMutableData data];
    
    //(void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSString *errorDescription = [error description];
    NSLog(@"Connection failed: %@", errorDescription);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    response = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&myError];
    for(id key in response) {
        
        id value = [response objectForKey:key];
        
        NSString *keyAsString = (NSString *)key;
        NSString *valueAsString = (NSString *)value;
        
        NSLog(@"key: %@", keyAsString);
        NSLog(@"value: %@", valueAsString);
    }
    if(response.count > 0)
    {
        NSDictionary *userDictionary = response[@"userInfo"];
        NSArray *knotchesArray = [response objectForKey:@"knotches"];
        userProfile *user = [[userProfile alloc]initWithDictionary:userDictionary];
        userFeed *feed = [[userFeed alloc]initWithArray:knotchesArray];
        //buiild User feed pass to below
        [callBackView reloadTableData:user withFeed:feed];
        
    }
    else {
        //Exception or some bs
    }
}


@end
