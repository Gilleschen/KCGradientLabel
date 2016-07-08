
#import "KCGradientLabel.h"

@interface KCGradientLabel () 

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) UILabel *label;


@end

@implementation KCGradientLabel

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1, 0.5);
        _gradientLayer.mask = self.label.layer;
        _gradientLayer.colors = @[(id)self.label.textColor.CGColor, (id)self.label.textColor.CGColor];
        
    }
    return _gradientLayer;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setup];
}

- (void)setup
{
    [self addSubview:self.label];
    [self.layer addSublayer:self.gradientLayer];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.label.frame = self.bounds;
    self.gradientLayer.frame = self.bounds;
    
}

- (void)setGradientColors:(NSArray<__kindof UIColor *> *)gradientColors
{
    if (gradientColors.count < 2) {
        NSLog(@"至少需要2种颜色才有渐变效果哦~~~~%s", __func__);
        return;
    }
    
    _gradientColors = gradientColors;
    
    NSMutableArray *tmp = @[].mutableCopy;
    
    for (UIColor *color in gradientColors) {
        [tmp addObject:(id)color.CGColor];
    }
    
    self.gradientLayer.colors = tmp;
    
}

- (void)setText:(NSString *)text
{
    _text = [text copy];
    self.label.text = text;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    
    self.label.font = font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textAlignment = textAlignment;
    
    self.label.textAlignment = textAlignment;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
    _numberOfLines = numberOfLines;
    
    self.label.numberOfLines = numberOfLines;
}

- (void)setGradientDirection:(KCGradientLabelGradientDirection)gradientDirection
{
    _gradientDirection = gradientDirection;
    
    switch (gradientDirection) {
        case KCGradientLabelGradientDirectionHorizontal:
            
            self.gradientLayer.startPoint = CGPointMake(0, 0.5);
            self.gradientLayer.endPoint = CGPointMake(1, 0.5);
            break;
        case KCGradientLabelGradientDirectionVertical:
            
            self.gradientLayer.startPoint = CGPointMake(0.5, 0);
            self.gradientLayer.endPoint = CGPointMake(0.5, 1);
            break;
        case KCGradientLabelGradientDirectionTopLeftToBottomRight:
            
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 1);
            break;
        case KCGradientLabelGradientDirectionBottomLeftToTopRight:
            
            self.gradientLayer.startPoint = CGPointMake(0, 1);
            self.gradientLayer.endPoint = CGPointMake(1, 0);
            break;
        default:
            break;
    }
}

- (void)sizeToFit
{
    [super sizeToFit];
    [self.label sizeToFit];
    CGRect frame = self.frame;
    frame.size = self.label.frame.size;
    self.frame = frame;
}

@end
