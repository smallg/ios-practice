//
//  WebViewController.m
//  Wind Creek/Projects/ECWise/CLN/xcode/Wind Creek/Wind Creek/WebViewController.m
//
//  Created by Bryan Campbell on 3/26/15.
//  Copyright (c) 2015 EC Wise. All rights reserved.
//

#import "WebViewController.h"
#import <IngeoSDK/IngeoSDK.h>
#import "Reachability.h"

@interface WebViewController () <IGLocationManagerDelegate>

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _MyPage.delegate = self;
    
    // [IGLocationManager initWithDelegate:self secretAPIKey:@"59d633657cac30cb0535cb982de39d68"];  // Geolocation code
    
    // [IGLocationManager startUpdatingLocation];
    
    NSURL *WindCreek = [NSURL URLWithString:@"http://windcreek-qa.playcln.com"];
    NSURLRequest *Request = [NSURLRequest requestWithURL:WindCreek];
    [_MyPage loadRequest:Request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // Check network
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    NSLog(@"NetworkStatus %d", status);
    if (status == NotReachable){
        NSString *msg = @"Please check you network.";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reachability" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Refresh", @"Setting", nil];
        [alert show];
    }
    
    NSLog(@"strat load windcreek...");
}

- (void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Pressed %d button!", buttonIndex);
    if(buttonIndex == 1){
        // Open system setting
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
    }else if(buttonIndex == 0){
        // Reload page
        [_MyPage reload];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"loaded windcreek!");
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *currentURL = request.URL.absoluteString;
    NSRange range1, range2;
    range1 = [currentURL rangeOfString:@"games/play"];
    range2 = [currentURL rangeOfString:@"tournaments/gametournament"];
    if(range1.length != 0 || range2.length != 0){
        NSLog(@"gaming page!");
        // TODO set LandspaceLeft and LandspaceRight
    }
    return YES;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
