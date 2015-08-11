//
//  ViewController.m
//  Local Save Data
//
//  Created by User3 on 8/7/15.
//  Copyright (c) 2015 Smallg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self saveNSUserDefaults];
    [self readNSUserDefaults];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveNSUserDefaults
{
    NSString *myString = @"enuola";
    int myInteger = 100;
    float myFloat = 50.0f;
    double myDouble = 20.0;
    NSDate *myDate = [NSDate date];
    NSArray *myArray = [NSArray arrayWithObjects:@"hello", @"world", nil];
    NSDictionary *myDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"enuo", @"20", nil] forKeys:[NSArray arrayWithObjects:@"name", @"age", nil]];
    
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //存储时，除NSNumber类型使用对应的类型意外，其他的都是使用setObject:forKey:
    [userDefaults setInteger:myInteger forKey:@"myInteger"];
    [userDefaults setFloat:myFloat forKey:@"myFloat"];
    [userDefaults setDouble:myDouble forKey:@"myDouble"];
    
    [userDefaults setObject:myString forKey:@"myString"];
    [userDefaults setObject:myDate forKey:@"myDate"];
    [userDefaults setObject:myArray forKey:@"myArray"];
    [userDefaults setObject:myDictionary forKey:@"myDictionary"];
    
    //这里建议同步存储到磁盘中，但是不是必须的
    [userDefaults synchronize];
    
}

-(void)readNSUserDefaults
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    
    //读取数据到各个label中
    //读取整型int类型的数据
    NSInteger myInteger = [userDefaultes integerForKey:@"myInteger"];
    txtInteger.text = [NSString stringWithFormat:@"%d",myInteger];
    
    //读取浮点型float类型的数据
    float myFloat = [userDefaultes floatForKey:@"myFloat"];
    txtFloat.text = [NSString stringWithFormat:@"%f",myFloat];
    
    //读取double类型的数据
    double myDouble = [userDefaultes doubleForKey:@"myDouble"];
    txtDouble.text = [NSString stringWithFormat:@"%f",myDouble];
    
    //读取NSString类型的数据
    NSString *myString = [userDefaultes stringForKey:@"myString"];
    txtNSString.text = myString;
    
    //读取NSDate日期类型的数据
    NSDate *myDate = [userDefaultes valueForKey:@"myDate"];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    txtNSDate.text = [NSString stringWithFormat:@"%@",[df stringFromDate:myDate]];
    
    //读取数组NSArray类型的数据
    NSArray *myArray = [userDefaultes arrayForKey:@"myArray"];
    NSString *myArrayString = [[NSString alloc] init];
    for(NSString *str in myArray)
    {
        NSLog(@"str= %@",str);
        myArrayString = [NSString stringWithFormat:@"%@  %@", myArrayString, str];
        [myArrayString stringByAppendingString:str];
        //        [myArrayString stringByAppendingFormat:@"%@",str];
        NSLog(@"myArrayString=%@",myArrayString);
    }
    txtNSArray.text = myArrayString;
    
    //读取字典类型NSDictionary类型的数据
    NSDictionary *myDictionary = [userDefaultes dictionaryForKey:@"myDictionary"];
    NSString *myDicString = [NSString stringWithFormat:@"name:%@, age:%d",[myDictionary valueForKey:@"name"], [[myDictionary valueForKey:@"age"] integerValue]];
    txtNSDictionary.text = myDicString;
}

@end
