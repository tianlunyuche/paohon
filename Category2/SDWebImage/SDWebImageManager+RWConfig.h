//
//  SDWebImageManager+RWConfig.h
//  SupplyChain
//
//  Created by 刘瑾 on 2017/6/11.
//  Copyright © 2017年 Runwise. All rights reserved.
//

#import "SDWebImageManager.h"

@interface SDWebImageManager (RWConfig)

+(void)changeDataBase:(NSString *)Db;
+(void) clearCache;

@end
