//
//  ViewController.m
//  TextLabel
//
//  Created by zhangweiwei on 16/7/7.
//  Copyright © 2016年 hcq. All rights reserved.
//

#import "ViewController.h"
#import "KCGradientLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KCGradientLabel *label = [KCGradientLabel new];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    label.text = @"叼你老师嗨";
    label.gradientColors = @[[UIColor blueColor], [UIColor yellowColor]];
    label.gradientDirection = KCGradientLabelGradientDirectionTopLeftToBottomRight;
    label.frame = CGRectMake(10, 50, self.view.frame.size.width, 30);
    label.animate = YES;
    [label sizeToFit];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
