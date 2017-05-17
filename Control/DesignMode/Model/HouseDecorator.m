//
//  HouseDecorator.m
//  Control
//
//  Created by xinying on 2017/5/18.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "HouseDecorator.h"

@implementation HouseDecorator

-(instancetype)initWithHouse:(House *)house{
    self=[super init];
    if (self) {
        self.house=house;
    }
    return self;
}

@end
