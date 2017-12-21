//
//  UIView+RWCustomConfiguration.m
//  SupplyChain
//
//  Created by 刘瑾 on 2017/3/14.
//  Copyright © 2017年 Runwise. All rights reserved.
//

#import "UIView+RWCustomConfiguration.h"

@implementation UIView (RWCustomConfiguration)

+(id )viewFromNibWithClassName:(NSString *)className{
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil];
    return nibs.firstObject;
}

-(void)refreshCornerRadius:(double)radius{
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    
}

-(void)showRWProgressHUD:(NSString *)tip{
    
    UIView *progressView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:progressView];
    progressView.tag = 5678;
    progressView.backgroundColor = [UIColor colorWithHex:@"000000" alpha:RWBackGroudViewAlpha];
    
    UIView *showProgressView = [UIView new];
    [progressView addSubview:showProgressView];
    [showProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
        make.width.equalTo(120);
        make.height.equalTo(130);
    }];
    showProgressView.backgroundColor = [UIColor whiteColor];
    showProgressView.layer.cornerRadius = 5;
    showProgressView.layer.masksToBounds = YES;
    
    UIImageView *iv = [UIImageView new];
    [showProgressView addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(0).equalTo(-6);
        make.width.height.equalTo(54);
    }];
    iv.image = [UIImage sd_animatedGIFNamed:@"loading"];
    
    [progressView setNeedsLayout];
   
    UILabel *tipLabel = [UILabel new];
    [progressView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(iv);
        make.top.equalTo(iv.mas_bottom).offset(12);
    }];
    tipLabel.textColor = [UIColor colorWithHex:@"2e2e2e"];
    tipLabel.text = tip ? : @"加载中...";
    tipLabel.font = [UIFont systemFontOfSize:12];
    
}

//隐藏自定义加载视图
-(void)dissmissRWProgressHUD{
    
    UIView *progressView = [self viewWithTag:5678];
    if (progressView) {
        [progressView removeFromSuperview];
    }
    
}

-(void)setStyle001:(CGFloat)cornerRadius withBorderColor:(UIColor *)borderColor{
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = .5;
//    self.layer.borderWidth = 1.0;
}

-(void)setStyle002ShadowOffset:(CGSize)shadowOffset andShadowColor:(UIColor *)shadowColor andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius{
    
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.masksToBounds = NO;
}

-(void)setStyle003ShadowOffset:(CGSize)shadowOffset andShadowColor:(UIColor *)shadowColor andShadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)shadowRadius{
    
    CALayer *sublayer1 =[CALayer layer];
    sublayer1.shadowOffset = shadowOffset;
    sublayer1.shadowColor = shadowColor.CGColor;
    sublayer1.shadowOpacity = shadowOpacity;
    sublayer1.shadowRadius = shadowRadius;
    sublayer1.masksToBounds = NO;
    [self.layer insertSublayer:sublayer1 atIndex:1];
}

-(void)setStyle003WithSatrtPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor{
    [self layoutIfNeeded];
    [self updateConstraints];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    if (ScreenWidth ==414.0) {
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) +40, CGRectGetHeight(self.frame));
    }else{
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top andTag:(int)tag{
    [self layoutIfNeeded];
    
    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
    waringTip.tag = tag;
    
    if ([self viewWithTag:tag]) {
        waringTip = (RWWaringTip002 *)[self viewWithTag:tag];
        if (title.length != 0) waringTip.title.text = title;
        if (icon) waringTip.icon.image = icon;
        return;
    }
    if (title.length != 0) waringTip.title.text = title;
    if (icon) waringTip.icon.image = icon;
    [self addSubview:waringTip];
    
    waringTip.frame = CGRectMake(0, top, self.width, self.height - top);
    [waringTip updateConstraints];
}

-(void)removeDefaultViewWithTag:(int)tag{
    
    UIView *temp = [self viewWithTag:tag];
    
    if (temp) {
        [UIView animateWithDuration:.2 animations:^{
            temp.alpha = 0;
        } completion:^(BOOL finished) {
            [[self viewWithTag:tag] removeFromSuperview];
        }];
    }
    
}

-(void)addDefaultPageWithoutGetView:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top andTag:(int)tag{
    [self layoutIfNeeded];
    
    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
    waringTip.tag = tag;
                     
    if (title.length != 0) waringTip.title.text = title;
    if (icon) waringTip.icon.image = icon;
    [self addSubview:waringTip];
    
    waringTip.frame = CGRectMake(0, top, self.width, self.height - top);
    [waringTip updateConstraints];
}

-(void)setStyle004{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:@"9acc35"].CGColor, (__bridge id)[UIColor colorWithHex:@"79bd50"].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
    if (ScreenWidth ==414.0) {
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) +40, CGRectGetHeight(self.frame));
    }else{
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
}

@end
