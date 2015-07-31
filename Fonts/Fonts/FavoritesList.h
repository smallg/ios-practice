//
//  FavoritesList.h
//  Fonts
//
//  Created by User3 on 7/31/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+ (instancetype)sharedFavoritesList;

- (NSArray *)favorites;

- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;

@end
