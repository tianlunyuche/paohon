//
//  ConcreteWebSite.m
//  Control
//
//  Created by xinying on 2017/5/17.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "ConcreteWebSite.h"

@implementation ConcreteWebSite

- (void)user:(User *)user{
    
    ZXLog(@"在 %@网站 有用户名：%@的用户登录",self.webName,user.userName);
}

@end
