//
//  NSDate+STRING.h
//  SupplyChain
//
//  Created by 刘瑾 on 2017/5/2.
//  Copyright © 2017年 Runwise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (STRING)

@property (nonatomic, readonly) NSString *EE;
@property (nonatomic, readonly) NSString *MMdd;
@property (nonatomic, readonly) NSString *yyyyMMdd_HHmmss;
@property (nonatomic, readonly) NSString *yyyyMMdd;
@property (nonatomic, readonly) NSDate *localDate;
-(NSString *)HHmm;

@end
