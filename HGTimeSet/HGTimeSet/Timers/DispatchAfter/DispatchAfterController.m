//
//  DispatchAfterController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "DispatchAfterController.h"

@interface DispatchAfterController ()

@end

@implementation DispatchAfterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"123");
    
    // 3秒钟之后执行 block
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 使用了 self 的话, 就只能是在执行了这个 block 之后,当前的 self 才能被销毁.如果在还没有执行就 pop 当前的控制器的情况下.
        NSLog(@"定时器触发, %@", self);
    });
    
    NSLog(@"321");
}

- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif
}

@end
