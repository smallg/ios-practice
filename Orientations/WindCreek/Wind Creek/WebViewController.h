//
//  WebViewController.h
//  Wind Creek
//
//  Created by Bryan Campbell on 3/26/15.
//  Copyright (c) 2015 EC Wise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>{
    UIAlertView *myAlert;
    UIActivityIndicatorView *progressInd;
}
@property (weak, nonatomic) IBOutlet UIWebView *MyPage;

@end
