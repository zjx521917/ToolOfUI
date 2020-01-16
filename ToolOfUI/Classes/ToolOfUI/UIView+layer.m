//
//  UIView+layer.m
//  智能社区(用户)
//
//  Created by 镇景雄 on 16/4/7.
//  Copyright © 2016年 镇景雄. All rights reserved.
//

#import "UIView+layer.h"
#import <objc/runtime.h>

@implementation UIView (layer)
+(void)layerWithView:(UIView *)view WithColor:(UIColor *)color WithRadius:(CGFloat)Radius WithBorderWith:(CGFloat)BorderWidth{
    view.layer.cornerRadius=Radius;
    view.layer.borderWidth=BorderWidth;
    view.layer.borderColor=[color CGColor];
    view.layer.masksToBounds=YES;
}

-(void)layerWithColor:(UIColor *)color WithRadius:(CGFloat)Radius WithBorderWith:(CGFloat)BorderWidth{
    self.layer.cornerRadius=Radius;
    self.layer.borderWidth=BorderWidth;
    self.layer.borderColor=[color CGColor];
    self.layer.masksToBounds=YES;
}

- (void)layerWithRadius:(CGFloat)radius corner:(UIRectCorner)corner borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
   if (@available(iOS 11.0, *)) {
       self.layer.cornerRadius = radius;
       self.layer.maskedCorners = (CACornerMask)corner;
       self.layer.borderWidth = borderWidth;
       self.layer.borderColor = borderColor.CGColor;
    } else {
        if (self.borderLayer != nil) {
            [self.borderLayer removeFromSuperlayer];
        }
        //设置圆角
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
        
        //设置边框
        CAShapeLayer *borderLayer=[CAShapeLayer layer];
        borderLayer.path= path.CGPath;
        borderLayer.fillColor  = [UIColor clearColor].CGColor;
        borderLayer.strokeColor= borderColor.CGColor;
        borderLayer.lineWidth= borderWidth;
        borderLayer.frame=self.bounds;
        self.borderLayer = borderLayer;
        [self.layer addSublayer:borderLayer];
    }
}

-(void)desiredRoundedCornerbyRoundingCorners:(UIRectCorner)corners withCornerRadi:(CGSize)cornerRadii withCornerRadius:(CGFloat)cornerRadius{
       self.layer.cornerRadius = cornerRadius;
       UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.layer.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:cornerRadii];
       CAShapeLayer * maskLayer = [CAShapeLayer new];
       maskLayer.frame = self.layer.bounds;
       maskLayer.path = maskPath.CGPath;
       self.layer.mask = maskLayer;
}

#pragma mark - 关联属性
- (void)setBorderLayer:(CAShapeLayer *)borderLayer
{
    objc_setAssociatedObject(self, @"borderLayer", borderLayer, OBJC_ASSOCIATION_RETAIN);
}

- (CAShapeLayer *)borderLayer
{
    return objc_getAssociatedObject(self, @"borderLayer");
}

@end
