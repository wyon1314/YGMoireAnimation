//
//  YGMoireAnimationLayer.m
//  YGMoireAnimation
//
//  Created by 酷星 on 2017/4/13.
//  Copyright © 2017年 wyon. All rights reserved.
//

#import "YGMoireAnimationLayer.h"

@interface YGMoireAnimationLayer ()<CAAnimationDelegate>

@property (nonatomic, assign) CGRect sFrame;
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) CABasicAnimation *scaleAnimation;
@property (nonatomic, strong) CABasicAnimation *alphaAnimation;

@end

@implementation YGMoireAnimationLayer

- (instancetype)initLayerWithFrame:(CGRect)frame color:(UIColor *)color {
    
    if (self = [super init]) {
        
        self.sFrame = frame;
        self.color = color;
    }
    
    return self;
}

- (void)showAnimationLayer {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)startAnimation {
    
    UIBezierPath *cyclePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.sFrame.size.width, self.sFrame.size.width) cornerRadius:self.sFrame.size.width / 2.0];
    
    CAShapeLayer *cycleLayer = [CAShapeLayer layer];
    cycleLayer.path          = cyclePath.CGPath;
    cycleLayer.fillColor     = self.color.CGColor;
    cycleLayer.frame         = CGRectMake(self.sFrame.origin.x, self.sFrame.origin.y, self.sFrame.size.width, self.sFrame.size.width);
    
    [cyclePath closePath];
    
    [self addSublayer:cycleLayer];
    
    //添加动画
    [cycleLayer addAnimation:self.scaleAnimation forKey:@"scaleAnimation"];
    [cycleLayer addAnimation:self.alphaAnimation forKey:@"opacityAnimation"];
    
    
}

//CABasicAnimation
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self removeAllAnimations];
    
}


//缩放动画
- (CABasicAnimation *)scaleAnimation {
    
    if (!_scaleAnimation) {
        _scaleAnimation   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        _scaleAnimation.toValue             = @3.0;
        _scaleAnimation.duration            = 3.0;
        _scaleAnimation.fillMode            = kCAFillModeForwards;
        _scaleAnimation.removedOnCompletion = NO;
        _scaleAnimation.delegate            = self;
    }
    
    return _scaleAnimation;
    
}

//透明度动画
- (CABasicAnimation *)alphaAnimation {
    
    if (!_alphaAnimation) {
        _alphaAnimation   = [CABasicAnimation animationWithKeyPath:@"opacity"];
        _alphaAnimation.toValue             = @0;
        _alphaAnimation.duration            = 3.0;
        _alphaAnimation.fillMode            = kCAFillModeForwards;
        _alphaAnimation.removedOnCompletion = NO;
        _alphaAnimation.delegate            = self;
    }
    
    return _alphaAnimation;
    
}

@end
