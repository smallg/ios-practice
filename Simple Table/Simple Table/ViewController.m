//
//  ViewController.m
//  Simple Table
//
//  Created by User3 on 7/29/15.
//  Copyright (c) 2015 User3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (copy, nonatomic) NSArray *dwarves;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dwarves = @[@"Small", @"Tester1", @"Tester2", @"Tester3", @"Small01", @"Small02", @"Small03", @"Small04", @"Small05", @"Small06", @"Tester4", @"Tester5", @"Tester6", @"Tester7", @"Tester8"];
    UITableView *tableView = (id)[self.view viewWithTag:1];
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 15;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return nil;
    }else{
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selectede %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Yes I Did"
                                          otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SimpleTableIdentifier];
    }
    
    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    if(indexPath.row < 7){
        cell.detailTextLabel.text = @"Mr. SG";
    }else{
        cell.detailTextLabel.text = @"Ms. SG";
    }
    return cell;
}

// Set row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end
