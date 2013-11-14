//
//  RODItemStore.h
//  selfies
//
//  Created by Seth Hayward on 11/14/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RODSelfie;

@interface RODItemStore : NSObject
{
    NSMutableArray *allSelfies;
}

@property (nonatomic, retain) RODSelfie *recentSelfie;

+ (RODItemStore *)sharedStore;

- (NSArray *)allSelfies;
- (RODSelfie *)createSelfie:(NSString *)key;

- (NSString *)itemArchivePath;

- (BOOL)saveChanges;


@end

