//
//  ViewController.m
//  Cells
//
//  Created by User3 on 7/30/15.
//  Copyright (c) 2015 User3. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSArray *computers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.computers = @[@{@"Name":@"small1", @"Color":@"Red"},
                       @{@"Name":@"small2", @"Color":@"Blue"},
                       @{@"Name":@"small3", @"Color":@"Yellow"},
                       @{@"Name":@"small4", @"Color":@"Black"},
                       @{@"Name":@"small5", @"Color":@"White"}];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
    [tableView registerClass:[NameAndColorCell class] forCellReuseIdentifier:CellTableIdentifier];
    
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier forIndexPath:indexPath];
    NSDictionary *rowData = self.computers[indexPath.row];
    
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
