//
//  FontListViewController.h
//  Fonts
//
//  Created by User3 on 8/4/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController

@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showFavorites;

@end
