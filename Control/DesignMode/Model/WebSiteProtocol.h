//
//  WebSiteProtocol.h
//  Control
//
//  Created by xinying on 2017/5/17.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol WebSiteProtocol <NSObject>

- (void)user:(User *)user;

@end
