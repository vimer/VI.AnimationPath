//
//  AnimatedPathViewController.m
//  AnimatedPath
//
//  Created by Ole Begemann on 08.12.10.
//  Copyright 2010 Ole Begemann. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#import "ViewController.h"

@interface ViewController()

@property (nonatomic, strong) UIImageView* skipCenter;
@property (nonatomic, strong) UIBezierPath* smallRoundLeftPath;
@property (nonatomic, strong) CAShapeLayer* smallRoundLeftPathLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    
    //中间图片
    self.skipCenter = [[UIImageView alloc] init];
    self.skipCenter.frame = CGRectMake(100, 100, 50, 50);
    self.skipCenter.userInteractionEnabled = YES;
    [self.skipCenter setImage:[UIImage imageNamed:@"skipCenter"]];
    [self.view addSubview:self.skipCenter];
    
    //左边半圆的PATH
    self.smallRoundLeftPath = [[UIBezierPath alloc] init];
    [self.smallRoundLeftPath addArcWithCenter:CGPointMake(100+50/2, -100-50/2)
                    radius:25
                startAngle:M_PI*0.52
                  endAngle:M_PI*1.45
                 clockwise:YES];
    self.smallRoundLeftPathLayer = [CAShapeLayer layer];
    self.smallRoundLeftPathLayer.geometryFlipped = YES;
    self.smallRoundLeftPathLayer.path = self.smallRoundLeftPath.CGPath;
    self.smallRoundLeftPathLayer.strokeColor = [[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0] CGColor];
    self.smallRoundLeftPathLayer.fillColor = nil;
    self.smallRoundLeftPathLayer.lineWidth = 1.4f;
    self.smallRoundLeftPathLayer.lineJoin = kCALineJoinRound;
    [self.view.layer addSublayer:self.smallRoundLeftPathLayer];
    
    //右下角半圆的PATH
    UIBezierPath* smallRoundRightBottomPath = [[UIBezierPath alloc] init];
    [smallRoundRightBottomPath addArcWithCenter:CGPointMake(100+50/2, -100-50/2)
                    radius:25
                startAngle:M_PI*1.52
                  endAngle:M_PI*2
                 clockwise:YES];
    
    CAShapeLayer* smallRoundRightBottomPathLayer = [CAShapeLayer layer];
    smallRoundRightBottomPathLayer.geometryFlipped = YES;
    smallRoundRightBottomPathLayer.path = smallRoundRightBottomPath.CGPath;
    smallRoundRightBottomPathLayer.strokeColor = [[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0] CGColor];
    smallRoundRightBottomPathLayer.fillColor = nil;
    smallRoundRightBottomPathLayer.lineWidth = 1.4f;
    smallRoundRightBottomPathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:smallRoundRightBottomPathLayer];
    
    //右上角半圆的PATH
    UIBezierPath* smallRoundRightTopPath = [[UIBezierPath alloc] init];
    [smallRoundRightTopPath addArcWithCenter:CGPointMake(100+50/2, -100-50/2)
                    radius:25
                startAngle:M_PI*2.1
                  endAngle:M_PI/2.1
                 clockwise:YES];
    
    CAShapeLayer* smallRoundRightTopPathLayer = [CAShapeLayer layer];
    smallRoundRightTopPathLayer.geometryFlipped = YES;
    smallRoundRightTopPathLayer.path = smallRoundRightTopPath.CGPath;
    smallRoundRightTopPathLayer.strokeColor = [[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0] CGColor];
    smallRoundRightTopPathLayer.fillColor = nil;
    smallRoundRightTopPathLayer.lineWidth = 1.4f;
    smallRoundRightTopPathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:smallRoundRightTopPathLayer];
    
    
    //左边大圆的PATH
    UIBezierPath* bigRoundLeftPath = [[UIBezierPath alloc] init];
    [bigRoundLeftPath addArcWithCenter:CGPointMake(100+50/2, -100-50/2)
                                      radius:35
                                  startAngle:M_PI*0.52
                                    endAngle:M_PI*2
                                   clockwise:YES];
    
    CAShapeLayer* bigRoundLeftPathLayer = [CAShapeLayer layer];
    bigRoundLeftPathLayer.geometryFlipped = YES;
    bigRoundLeftPathLayer.path = bigRoundLeftPath.CGPath;
    bigRoundLeftPathLayer.strokeColor = [[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0] CGColor];
    bigRoundLeftPathLayer.fillColor = nil;
    bigRoundLeftPathLayer.lineWidth = 1.4f;
    bigRoundLeftPathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:bigRoundLeftPathLayer];
    
    //右边大圆的PATH
    UIBezierPath* bigRoundRightPath = [[UIBezierPath alloc] init];
    [bigRoundRightPath addArcWithCenter:CGPointMake(100+50/2, -100-50/2)
                                radius:35
                            startAngle:M_PI*2.08
                              endAngle:M_PI/2.1
                             clockwise:YES];
    
    CAShapeLayer* bigRoundRightPathLayer = [CAShapeLayer layer];
    bigRoundRightPathLayer.geometryFlipped = YES;
    bigRoundRightPathLayer.path = bigRoundRightPath.CGPath;
    bigRoundRightPathLayer.strokeColor = [[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0] CGColor];
    bigRoundRightPathLayer.strokeColor = [[UIColor whiteColor] CGColor];
    bigRoundRightPathLayer.fillColor = nil;
    bigRoundRightPathLayer.lineWidth = 1.4f;
    bigRoundRightPathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:bigRoundRightPathLayer];
    
    CABasicAnimation* heheAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    heheAnimation.duration = 2.0;
    heheAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    heheAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.smallRoundLeftPathLayer addAnimation:heheAnimation forKey:@"strokeEnd"];
    [smallRoundRightBottomPathLayer addAnimation:heheAnimation forKey:@"strokeEnd"];
    [smallRoundRightTopPathLayer addAnimation:heheAnimation forKey:@"strokeEnd"];
    [smallRoundRightTopPathLayer addAnimation:heheAnimation forKey:@"strokeEnd"];
    [bigRoundLeftPathLayer addAnimation:heheAnimation forKey:@"strokeEnd"];
    [bigRoundRightPathLayer addAnimation:heheAnimation forKey:@"strokeEnd"];
}

@end
