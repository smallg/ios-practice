//
//  ViewController.m
//  DialogViewer
//
//  Created by User3 on 8/17/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "ViewController.h"
#import "ContentCell.h"
#import "HeaderCell.h"

@interface ViewController ()

@property (copy, nonatomic) NSArray *sections;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sections = @[
                      @{@"header" : @"First",
                        @"content" : @"Hey, Small1"},
                      @{@"header" : @"Second",
                        @"content" : @"Hey, Small2"},
                      @{@"header" : @"Third",
                        @"content" : @"Hey, Small3"},
                      @{@"header" : @"Forth",
                        @"content" : @"Hey, Small4"},
                      @{@"header" : @"Fifth",
                        @"content" : @"Hey, Small5"},
                      @{@"header" : @"Sixth",
                        @"content" : @"Hey, Small6"}];
    
    [self.collectionView registerClass:[ContentCell class] forCellWithReuseIdentifier:@"CONTENT"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UIEdgeInsets contentInset = self.collectionView.contentInset;
    contentInset.top = 20;
    [self.collectionView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)wordsInSection:(NSInteger)section{
    NSString *content = self.sections[section][@"content"];
    NSCharacterSet *space = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words = [content componentsSeparatedByCharactersInSet:space];
    return words;
}

@end
