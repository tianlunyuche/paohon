//
//  House.h
//  Control
//
//  Created by xinying on 2017/5/18.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HouseDelegate <NSObject>

@optional
-(double)totalMoney;

@end

@interface House : NSObject <HouseDelegate>

-(NSString *)detialInfo;

@end
