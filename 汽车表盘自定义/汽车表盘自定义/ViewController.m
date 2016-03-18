//
//  ViewController.m
//  汽车表盘自定义
//
//  Created by sunchunlei on 16/3/18.
//  Copyright © 2016年 朱俊. All rights reserved.
//

#import "ViewController.h"
#import "Panel.h"

@interface ViewController ()
@property (nonatomic, weak)Panel *panelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Panel * panelView = [[Panel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    panelView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:panelView];
    self.panelView = panelView;
    self.view.backgroundColor = [UIColor grayColor];
}

- (IBAction)mySlideChange:(UISlider *)sender {
    
    NSLog(@"-----%f",sender.value);
    
    CGFloat angle = (sender.value) * M_PI * 4 / 3.0 - M_PI_2 * 4 / 3.0;
    
    NSLog(@"********%f",angle);
    
    [self.panelView setIndicatorTransform:(angle)];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
