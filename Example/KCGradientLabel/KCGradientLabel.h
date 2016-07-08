

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KCGradientLabelGradientDirection) {
    KCGradientLabelGradientDirectionHorizontal,
    KCGradientLabelGradientDirectionVertical,
    KCGradientLabelGradientDirectionTopLeftToBottomRight,
    KCGradientLabelGradientDirectionBottomLeftToTopRight
};

@interface KCGradientLabel : UIView

@property(nonatomic, strong) NSArray <__kindof UIColor *> * gradientColors;

@property (nonatomic, copy) NSString *text;

@property(nonatomic,strong) UIFont *font;

@property(nonatomic) NSTextAlignment textAlignment;

@property(nonatomic) NSInteger numberOfLines;


@property (nonatomic, assign) KCGradientLabelGradientDirection gradientDirection;

@end
