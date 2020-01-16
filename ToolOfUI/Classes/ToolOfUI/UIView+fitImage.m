//
//  UIView+fitImage.m
//  MrMagic(魔术先生)
//
//  Created by 镇景雄 on 16/9/13.
//  Copyright © 2016年 镇景雄. All rights reserved.
//

#import "UIView+fitImage.h"

@implementation UIView (fitImage)
-(void)fitImage{
    self.contentMode=UIViewContentModeScaleAspectFill;
    self.clipsToBounds  = YES;
}

@end
