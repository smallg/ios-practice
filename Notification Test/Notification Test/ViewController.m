//
//  ViewController.m
//  Notification Test
//
//  Created by User3 on 9/2/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    NSDate *now=[NSDate new];
    notification.fireDate=[now dateByAddingTimeInterval:6]; //触发通知的时间
    notification.repeatInterval=0; //循环次数，kCFCalendarUnitWeekday一周一次
    
    notification.timeZone=[NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.alertBody=@"该去吃晚饭了！";
    
    notification.alertAction = @"打开";  //提示框按钮
    notification.hasAction = YES; //是否显示额外的按钮，为no时alertAction消失
    
    notification.applicationIconBadgeNumber = 1; //设置app图标右上角的数字
    
    //下面设置本地通知发送的消息，这个消息可以接受
    NSDictionary* infoDic = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    notification.userInfo = infoDic;
    //发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
