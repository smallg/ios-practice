//
//  FontInfoViewController.h
//  Fonts
//
//  Created by User3 on 8/4/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontInfoViewController : UITableViewController

@property (strong, nonatomic) UIFont *font;
@property (assign, nonatomic) BOOL favorite;

@end
