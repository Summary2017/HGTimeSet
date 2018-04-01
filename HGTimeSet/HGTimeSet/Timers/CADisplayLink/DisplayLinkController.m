//
//  DisplayLinkController.m
//  HGTimeSet
//
//  Created by ZhuHong on 2018/4/1.
//  Copyright © 2018年 ZhuHong. All rights reserved.
//

#import "DisplayLinkController.h"
#import "YYWeakProxy.h"

@interface DisplayLinkController ()

@property (nonatomic, weak) CADisplayLink *displayLink;

@end

@implementation DisplayLinkController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 开启定时器
    [self starDisplayLink];
}

// 开启定时器
- (void)starDisplayLink {
    // 代理
    YYWeakProxy* wProxy = [[YYWeakProxy alloc] initWithTarget:self];
    // 定时器
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:wProxy selector:@selector(testDisplayLink)];
    // 添加到 Runloop 中
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink = displayLink;
}

// 关闭定时器
- (void)stopDisplayLink {
    if (!self.displayLink) {
        return;
    }
    
    [self.displayLink invalidate];
    self.displayLink = nil;
}

// 测试方法
- (void)testDisplayLink {
    NSLog(@"testDisplayLink");
}

- (void)dealloc {
#if DEBUG
    NSLog(@"你的离开，是我唯一的期待");
#endif
    
    // 关闭定时器 习惯性的关一下吧, 虽然不关也不会有问题
    [self stopDisplayLink];
}

@end
