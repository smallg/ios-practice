//
//  AppDelegate.h
//  Google GCM Test
//
//  Created by User3 on 8/7/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import <Google/CloudMessaging.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GGLInstanceIDDelegate, GCMReceiverDelegate>

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, readonly, strong) NSString *registrationKey;
@property(nonatomic, readonly, strong) NSString *messageKey;
@property(nonatomic, readonly, strong) NSString *gcmSenderID;
@property(nonatomic, readonly, strong) NSDictionary *registrationOptions;

@end

