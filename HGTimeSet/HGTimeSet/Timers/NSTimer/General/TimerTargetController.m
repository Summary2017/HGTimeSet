//
//  TimerTargetController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "TimerTargetController.h"


/**
 一个代理定时器
 */
@interface HGProxy :  NSProxy

@property (nonatomic, weak) id target;

@end

@implementation HGProxy

- (void)proxyAction {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    //
    [_target performSelector:@selector(timerAction)];
    
#pragma clang diagnostic pop
    
}

@end

@interface TimerTargetController ()

@end

@implementation TimerTargetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 代理  注意:没有 init 方法
    HGProxy* proxy = [HGProxy alloc];
    // 一定要设置这个值
    proxy.target = self;
    // 开启定时 repeats 的值是 YES
    [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(proxyAction) userInfo:nil repeats:YES];
}

// 代理中决定的方法
- (void)timerAction {
    [self testTimer];
}

// 测试方法
- (void)testTimer {
    NSLog(@"testTimer");
}

- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif 
}

@end
