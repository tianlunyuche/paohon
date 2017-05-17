//
//  HouseDecorator.h
//  Control
//
//  Created by xinying on 2017/5/18.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "House.h"

//装饰对象TableDecorator：
@interface HouseDecorator : NSObject

-(instancetype)initWithHouse:(House *)house;

@property  (strong,nonatomic) House *house;

@end
