//
//  ContentCell.h
//  DialogViewer
//
//  Created by User3 on 8/17/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (copy, nonatomic) NSString *text;

+ (CGSize)sizeForContentString:(NSString *)s;

@end
