//
//  WeakProxyController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "WeakProxyController.h"
#import "YYWeakProxy.h"

@interface WeakProxyController ()

@end

@implementation WeakProxyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 代理
    YYWeakProxy* wProxy = [[YYWeakProxy alloc] initWithTarget:self];
    // 开启定时 repeats 的值是 YES
    [NSTimer scheduledTimerWithTimeInterval:1 target:wProxy selector:@selector(testTimer) userInfo:nil repeats:YES];
    
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
