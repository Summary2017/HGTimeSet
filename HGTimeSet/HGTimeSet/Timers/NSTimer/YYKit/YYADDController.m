//
//  YYADDController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "YYADDController.h"
#import "NSTimer+YYAdd.h"

@interface YYADDController ()

// 现在的内存语义是 strong  后来换成了 weak
@property (nonatomic, weak) NSTimer* yyaddTimer;

@end

@implementation YYADDController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.yyaddTimer =  [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        NSLog(@"定时器被触发");
    } repeats:YES];
}

- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif
    
    // 停止定时器
    {
        [_yyaddTimer invalidate];
        _yyaddTimer = nil;
    }
    
}

@end
