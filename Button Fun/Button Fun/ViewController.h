//
//  ViewController.h
//  Button Fun
//
//  Created by User3 on 7/16/15.
//  Copyright (c) 2015 User3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end

