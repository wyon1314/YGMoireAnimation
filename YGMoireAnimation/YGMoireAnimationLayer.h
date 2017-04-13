//
//  YGMoireAnimationLayer.h
//  YGMoireAnimation
//
//  Created by 酷星 on 2017/4/13.
//  Copyright © 2017年 wyon. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface YGMoireAnimationLayer : CALayer

- (instancetype)initLayerWithFrame:(CGRect)frame color:(UIColor *)color;
- (void)showAnimationLayer;

@end
