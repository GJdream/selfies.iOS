//
//  RODItemStore.m
//  selfies
//
//  Created by Seth Hayward on 11/14/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import "RODItemStore.h"
#import "RODSelfie.h"

@implementation RODItemStore

- (id)init
{
    self = [super init];
    if (self) {
        allSelfies = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allSelfies
{
    return allSelfies;
}

- (RODSelfie *)createSelfie
{
    RODSelfie *s = [RODSelfie init];
    [allSelfies addObject:s];
    
    return s;
}

+ (RODItemStore *)sharedStore
{
    static RODItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}

@end
