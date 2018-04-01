//
//  DispatchSourceTController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "DispatchSourceTController.h"

@interface DispatchSourceTController () {
    dispatch_source_t _timer;
}

@end

@implementation DispatchSourceTController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 开启定时器
    [self startDispatch_source_t];
}

// 开启定时器
- (void)startDispatch_source_t {
    // 关闭定时器
    [self  stopDispatch_source_t];
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), 2 * NSEC_PER_SEC, 0);
    
    // weak self
    __weak typeof(self) weakSelf = self;
    // 定时执行的 block
    dispatch_source_set_event_handler(_timer, ^{
        NSLog(@"定时执行的 block 被执行 %@", weakSelf);
    });

    // 取消定时器时执行的 block 被dispatch_source_cancel触发
    dispatch_source_set_cancel_handler(_timer, ^{
        // 如果是在 -dealloc 中被取消的话, weakSlef 是没有值的.根据这个特点,可以判断是否是在 -dealloc 中被取消的
        NSLog(@"取消定时器时执行的 block 被执行 %@", weakSelf);
    });
    
    // 启动定时器
    dispatch_resume(_timer);
}

// 关闭定时器
- (void)stopDispatch_source_t {
    if (!_timer) {
        return;
    }
    
    // 取消定时器 四方资源
    dispatch_source_cancel(_timer);
    _timer = nil;
}

- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif
    // 关闭定时器
    [self stopDispatch_source_t];
}

@end
