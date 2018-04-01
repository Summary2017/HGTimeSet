//
//  DelayedPController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "DelayedPController.h"

@interface DelayedPController ()

@end

@implementation DelayedPController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
NSLog(@"123");

// 三秒过后再执行
[self performSelector:@selector(testSelectorDelay) withObject:nil afterDelay:3];
NSLog(@"321");
    
    
//    [self performSelector:@selector(testSelectorDelay) withObject:nil afterDelay:4 inModes:@[NSRunLoopCommonModes]];
}

// 一个简单的测试方法
- (void)testSelectorDelay {
    NSLog(@"testSelectorDelay");
}


- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif
}

@end
