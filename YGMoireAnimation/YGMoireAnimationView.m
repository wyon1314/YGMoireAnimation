//
//  YGMoireAnimationView.m
//  YGMoireAnimation
//
//  Created by 酷星 on 2017/4/13.
//  Copyright © 2017年 wyon. All rights reserved.
//

#import "YGMoireAnimationView.h"

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface YGMoireAnimationView ()

@property (nonatomic, strong) UIView *sView;
@property (nonatomic, strong) UIColor *color;

@end

@implementation YGMoireAnimationView

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.color = color;
        
    }
    
    return self;
    
}

- (void)showMoireAnimationView:(UIView *)view {
    
    self.sView = view;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)startAnimation {
    
    UIView *animationView = [[UIView alloc] initWithFrame:self.frame];
    animationView.layer.masksToBounds = YES;
    animationView.layer.cornerRadius  = self.frame.size.height / 2.0;
    animationView.backgroundColor = self.color;
    [self.sView addSubview:animationView];
    
    [UIView animateWithDuration:3.0 animations:^{
        animationView.transform = CGAffineTransformMakeScale(3.0, 3.0);
        animationView.alpha = 0;
    } completion:^(BOOL finished) {
        [animationView removeFromSuperview];
    }];
    
    
}


@end
