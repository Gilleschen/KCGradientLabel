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
@property (weak, nonatomic) IBOutlet KCGradientLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.label.text = @"哈哈哈哈哈哈哈哈哈哈哈\n是附件是打飞机第三方收到";
//    label.gradientColors = @[[UIColor blueColor], [UIColor orangeColor]];
    self.label.numberOfLines = 0;
    
    NSMutableArray *colorsArray = [NSMutableArray array];
    for (NSInteger i = 0; i <= 360; i += 5) {
        UIColor *color = [UIColor colorWithHue:1.0 * i / 360
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [colorsArray addObject:color];
    }
    self.label.gradientColors = colorsArray;
    self.label.font = [UIFont systemFontOfSize:30];
    self.label.gradientDirection = KCGradientLabelGradientDirectionTopLeftToBottomRight;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.label.animate = !self.label.isAnimate;
}

@end
