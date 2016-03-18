//
//  Panel.m
//  汽车表盘自定义
//
//  Created by sunchunlei on 16/3/18.
//  Copyright © 2016年 朱俊. All rights reserved.
//

#import "Panel.h"
#import "Indicator.h"

// indicator的宽和高
static const CGFloat indicatorWidth = 39;
static const CGFloat indicatorHight = 90;

//画表格刻度的线的宽和高
static const CGFloat chartWidth = 10;
static const CGFloat chartHeight = 1;
//分隔的表格的刻度的宽
static const CGFloat chartMidWidth = 15;

//标记的set
static const CGFloat markInset = 20;
// 标记的宽度
static const CGFloat markWidth = 12;
//每一大格的角度是多少
static const CGFloat angleRatio = M_PI_2 / 30.0;

@interface Panel()

@property (nonatomic, weak)Indicator *indicator;

@end



@implementation Panel


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self customViewWithFrame:frame];
        
    }
    return self;
}


- (void)customViewWithFrame:(CGRect)frame {
//椭圆的半径
    CGFloat radiusOfOval = CGRectGetWidth(frame) * 0.5 - markInset;
//半径
    CGFloat radius = CGRectGetWidth(frame) * 0.5;
    
    //指针视图
    Indicator *indicatorView = [[Indicator alloc] initWithFrame:CGRectMake(0, 0, indicatorWidth, indicatorHight)];
    
#pragma mark ---- 要显示的度量单位的数组
    NSArray *titleArray1 = @[@"0",@"256K"];
    NSArray *titleArray = @[@"512K",@"1M",@"5M",@"10M",@"20M",@"50M",@"100+M"];
    // 在这里我们确定锚点的位置
    CGPoint anchorPoint = indicatorView.layerAnchorPoint;
    NSValue *value = [NSValue valueWithCGPoint:anchorPoint];
    if (value) {
        indicatorView.layer.anchorPoint = anchorPoint;
        indicatorView.layer.position = CGPointMake(CGRectGetWidth(frame) / 2, CGRectGetHeight(frame) / 2);
        
        indicatorView.transform = CGAffineTransformMakeRotation(- M_PI_2 * 4 / 3);
        [self addSubview:indicatorView];
        self.indicator = indicatorView;
    }
    
    for (NSInteger i = 110; i <= 120; i ++ ) {
        //画表格线
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, chartWidth, chartHeight)];
        
        if (i % 10 == 0) {
            
            view.frame = CGRectMake(0, 0, chartMidWidth, 1);
            NSInteger index = i / 10 % 10 - 1;
            
            //设置显示的文字
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = [UIColor whiteColor];
            
            label.text = titleArray1[index];
            
            CGFloat labelCenterX = CGRectGetWidth(frame) * 0.5 - radius * cos(i * angleRatio);
            CGFloat labelCenterY = CGRectGetHeight(frame) * 0.5 - radius * sin(i *angleRatio);
            [label sizeToFit];
            label.center = CGPointMake(labelCenterX, labelCenterY);
            [self addSubview:label];
        }
        //划线
        CGFloat centerX = CGRectGetWidth(frame) * 0.5 - radiusOfOval * cos(i * angleRatio);
        CGFloat centerY = CGRectGetHeight(frame) * 0.5 - radiusOfOval * sin(i * angleRatio);
        view.backgroundColor = [UIColor greenColor];
        view.transform = CGAffineTransformMakeRotation(i * angleRatio);
        view.center = CGPointMake(centerX, centerY);
        [self addSubview:view];
        
    }

    
    
    for (NSInteger i = 0; i <= 70; i ++ ) {
        //画表格线
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, chartWidth, chartHeight)];
       
        if (i % 10 == 0) {
            
            view.frame = CGRectMake(0, 0, chartMidWidth, 1);
            NSInteger index = i / 10;
            if (index != 0) {
                
                //设置显示的文字
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
                label.font = [UIFont systemFontOfSize:12];
                label.textColor = [UIColor whiteColor];
                label.text = titleArray[index - 1];
                CGFloat labelCenterX = CGRectGetWidth(frame) * 0.5 - radius * cos(i * angleRatio);
                CGFloat labelCenterY = CGRectGetHeight(frame) * 0.5 - radius * sin(i *angleRatio);
                [label sizeToFit];
                label.center = CGPointMake(labelCenterX, labelCenterY);
                [self addSubview:label];
                
            }
        }
            //划线
            CGFloat centerX = CGRectGetWidth(frame) * 0.5 - radiusOfOval * cos(i * angleRatio);
            CGFloat centerY = CGRectGetHeight(frame) * 0.5 - radiusOfOval * sin(i * angleRatio);
            view.backgroundColor = [UIColor greenColor];
            view.transform = CGAffineTransformMakeRotation(i * angleRatio);
            view.center = CGPointMake(centerX, centerY);
            [self addSubview:view];
    }
}

- (void)setIndicatorTransform:(CGFloat)angle {
    self.indicator.transform = CGAffineTransformMakeRotation(angle);
    
}










@end
