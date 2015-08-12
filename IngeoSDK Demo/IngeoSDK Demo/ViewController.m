//
//  ViewController.m
//  IngeoSDK Demo
//
//  Created by User3 on 8/12/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "ViewController.h"
#import <IngeoSDK/IngeoSDK.h>

@interface ViewController () <IGLocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [IGLocationManager initWithDelegate:self secretAPIKey:@"59d633657cac30cb0535cb982de39d68"];
    [IGLocationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)igLocationManager:(IGLocationManager *)manager didUpdateLocation:(IGLocation *)igLocation {
    NSLog(@"didUpdateLocation: %@", [igLocation description]);
}

- (void)igLocationManager:(IGLocationManager *)manager didDetectMotionState:(IGMotionState)motionState {
    NSLog(@"didDetectMotionState: %@",[IGLocation stringForMotionState:motionState]);
}

@end
