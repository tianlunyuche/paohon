//
//  ZXHookUtil.h
//  Control
//
//  Created by xinying on 2017/12/2.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXHookUtil : UIView

+(void)swizzlingInClass:(Class)cls originSel:(SEL)origSel swizzedSel:(SEL)swizzedSel;
    
@end
