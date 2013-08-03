//
//  userProfile.m
//  table
//
//  Created by Sean Dunford on 8/1/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import "userProfile.h"

@implementation userProfile
@synthesize name, location, picURI, numFollowers, numFollowing, numGlory;
- (userProfile *)initWithDictionary:(NSDictionary *)aDictionary{
    if(self = [super init])
    {
        if(aDictionary.count == 8)
        {
            name         = aDictionary[@"name"];
            location     = aDictionary[@"location"];
            picURI       = aDictionary[@"profilePicUrl"];
            numGlory     = aDictionary[@"num_glory"];
            numFollowers = aDictionary[@"num_following" ];
            numFollowing = aDictionary[@"num_followers"];
        }
        else{
            //Except
        }
    }
    return self; 
}
@end
