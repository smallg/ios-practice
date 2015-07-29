//
//  BlueViewController.m
//  View Switcher
//
//  Created by User3 on 7/22/15.
//  Copyright (c) 2015 User3. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)blueButtonPressed{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blue View Button Pressed"
                                                    message:@"You pressed the button on the blue view"
                                                   delegate:nil
                                          cancelButtonTitle:@"Yep, I did."
                                          otherButtonTitles:nil];
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
