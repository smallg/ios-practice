//
//  FontInfoViewController.m
//  Fonts
//
//  Created by User3 on 8/4/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "FontInfoViewController.h"
#import "FavoritesList.h"

@interface FontInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *fontSampleLabel;
@property (weak, nonatomic) IBOutlet UISlider *fontSizeSlider;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *favoriteSwitch;

@end

@implementation FontInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.fontSampleLabel.font = self.font;
    self.fontSampleLabel.text = @"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv"
    "WwXxYyZz 0123456789";
    self.fontSizeSlider.value = self.font.pointSize;
    self.fontSizeLabel.text = [NSString stringWithFormat:@"%.0f",
                               self.font.pointSize];
    self.favoriteSwitch.on = self.favorite;
}

- (IBAction)slideFontSize:(UISlider *)slider{
    float newSize = roundf(slider.value);
    self.fontSampleLabel.font = [self.font fontWithSize:newSize];
    self.fontSizeLabel.text = [NSString stringWithFormat:@"%.0f", newSize];
}

- (IBAction)toggleFavorite:(UISwitch *)sender{
    FavoritesList *favoritesList = [FavoritesList sharedFavoritesList];
    if(sender.on){
        [favoritesList addFavorite:self.font.fontName];
    }else{
        [favoritesList removeFavorite:self.font.fontName];
    }
}

@end
