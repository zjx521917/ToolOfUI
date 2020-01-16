//
//  UIView+layer.h
//  智能社区(用户)
//
//  Created by 镇景雄 on 16/4/7.
//  Copyright © 2016年 镇景雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (layer)
+(void)layerWithView:(UIView *)view WithColor:(UIColor *)color WithRadius:(CGFloat)Radius WithBorderWith:(CGFloat)BorderWidth;
-(void)layerWithColor:(UIColor *)color WithRadius:(CGFloat)Radius WithBorderWith:(CGFloat)BorderWidth;
-(void)layerWithRadius:(CGFloat)radius corner:(UIRectCorner)corner borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

-(void)desiredRoundedCornerbyRoundingCorners:(UIRectCorner)corners withCornerRadi:(CGSize)cornerRadii withCornerRadius:(CGFloat)cornerRadius;

//边框
@property (nonatomic, strong) CAShapeLayer *borderLayer;


@end
