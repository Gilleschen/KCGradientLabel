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
@property (nonatomic, weak) KCGradientLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KCGradientLabel *label = [KCGradientLabel new];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    label.text = @"哈哈哈哈哈哈哈哈哈哈哈";
//    label.gradientColors = @[[UIColor blueColor], [UIColor orangeColor]];
    
    NSMutableArray *colorsArray = [NSMutableArray array];
    for (NSInteger i = 0; i <= 360; i += 5) {
        UIColor *color = [UIColor colorWithHue:1.0 * i / 360
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [colorsArray addObject:color];
    }
    label.gradientColors = colorsArray;
    label.font = [UIFont systemFontOfSize:30];
    label.gradientDirection = KCGradientLabelGradientDirectionTopLeftToBottomRight;
    label.frame = CGRectMake(10, 50, self.view.frame.size.width, 30);
    [label sizeToFit];
    
    self.label = label;
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.label.animate = !self.label.isAnimate;
    self.label.animationDuration += 1;
}

@end
