//
//  ViewController.m
//  YGMoireAnimation
//
//  Created by 酷星 on 2017/4/13.
//  Copyright © 2017年 wyon. All rights reserved.
//

#import "ViewController.h"
#import "YGMoireAnimationView.h"
#import "YGMoireAnimationLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    YGMoireAnimationView *animationView = [[YGMoireAnimationView alloc] initWithFrame:CGRectMake(100, 100, 50, 50) color:[UIColor blackColor]];
    
    [animationView showMoireAnimationView:self.view];
    
    YGMoireAnimationLayer *animationLayer = [[YGMoireAnimationLayer alloc] initLayerWithFrame:CGRectMake(100, 300, 50, 50) color:[UIColor blackColor]];
    [self.view.layer addSublayer:animationLayer];
    [animationLayer showAnimationLayer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
