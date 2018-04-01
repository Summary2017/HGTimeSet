//
//  TimerBlockController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "TimerBlockController.h"

@interface TimerBlockController ()

// 现在的内存语义是 strong  后来换成了 weak
@property (nonatomic, weak) NSTimer* blockTimer;

@end

@implementation TimerBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 开启定时 repeats 的值是 YES
//    self.blockTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"定时器的 Block 被执行");
//    }];
    
    
    // 将 self 弱化
    __weak typeof(self) weakSelf = self;
    // 开启定时 repeats 的值是 YES 没有 blockTimer
    self.blockTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"定时器的 Block 被执行, %@", weakSelf);
    }];
}


- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif
    
    // 停止定时器
    {
        // 尽量不要使用 self.blockTimer
        [_blockTimer invalidate];
        _blockTimer = nil;
    }
}






@end
