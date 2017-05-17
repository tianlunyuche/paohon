//
//  TableDecorator.m
//  Control
//
//  Created by xinying on 2017/5/18.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "TableDecorator.h"

@interface TableDecorator()

@end
@implementation TableDecorator

-(double)totalMoney{
    return self.house.totalMoney+10;
}

-(NSString *)detialInfo{
    return  [NSString stringWithFormat:@"%@--桌子",self.house.detialInfo];
}

@end