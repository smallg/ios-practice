//
//  ViewController.m
//  Bridge Control
//
//  Created by User3 on 8/18/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *officerLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorizationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpDriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpFactorLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteTeaLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCaptainLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteGadgetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteAlienLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refreshFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.officerLabel.text = [defaults objectForKey:kOfficerKey];
    self.authorizationCodeLabel.text = [defaults
                                        objectForKey:kAuthorizationCodeKey];
    self.rankLabel.text = [defaults objectForKey:kRankKey];
    self.warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey]
    ? @"Engaged" : @"Disabled";
    self.warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey]
                                 stringValue];
    self.favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    self.favoriteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptainKey];
    self.favoriteGadgetLabel.text = [defaults objectForKey:kFavoriteGadgetKey];
    self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
}

@end
