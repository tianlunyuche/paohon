//
//  NSObject+YYParse.h
//  SupplyChain
//
//  Created by 刘瑾 on 2017/3/2.
//  Copyright © 2017年 libin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YYParse)<YYModel>

+(id )parse:(id)json;

@end
