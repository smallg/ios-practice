//
//  FontSizeViewController.m
//  Fonts
//
//  Created by User3 on 8/4/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "FontSizeViewController.h"

@interface FontSizeViewController ()

@end

@implementation FontSizeViewController

- (NSArray *)pointSizes{
    static NSArray *pointSizes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pointSizes = @[@9,
                       @10,
                       @11,
                       @12,
                       @13,
                       @14,
                       @18,
                       @24,
                       @36,
                       @48,
                       @64,
                       @72,
                       @96,
                       @144];
    });
    return pointSizes;
}

- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *pointSize = self.pointSizes[indexPath.row];
    return [self.font fontWithSize:pointSize.floatValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.pointSizes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"FontNameAndSize";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text = self.font.fontName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ point", self.pointSizes[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
    return 25 + font.ascender - font.descender;
}

@end
