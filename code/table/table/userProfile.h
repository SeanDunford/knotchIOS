//
//  userProfile.h
//  table
//
//  Created by Sean Dunford on 8/1/13.
//  Copyright (c) 2013 sean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userProfile : NSObject{

    NSString *name;
    NSString *location;
    NSString *picURI;
    NSString *numGlory;
    NSString *numFollowers;
    NSString *numFollowing;

}
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *picURI;
@property (nonatomic, retain) NSString *numGlory;
@property (nonatomic, retain) NSString *numFollowers;
@property (nonatomic, retain) NSString *numFollowing;
- (userProfile *)initWithDictionary:(NSDictionary *)aDictionary;
@end
