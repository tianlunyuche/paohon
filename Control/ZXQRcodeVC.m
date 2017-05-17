//
//  ZXQRcodeVC.m
//  Control
//
//  Created by xinying on 2017/5/17.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "ZXQRcodeVC.h"
#import "UIImage+ZXQRcode.h"

@interface ZXQRcodeVC ()

@end

@implementation ZXQRcodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 二维码生成
- (void)QRcodeCreat{
    
    UIImage *img =[UIImage imageOfQRFromURL:@"http://www.habav.com/" codeSize:500 red:0 green:100.0 blue:100.0 insertImage:[UIImage imageNamed:@"1"] roundRadius:200.0f];
    UIImageView *imgV =[[UIImageView alloc ] initWithFrame:((CGRect){(CGPointZero) ,img.size})];
    imgV.center =self.view.center;
    imgV.image =img;
    [self.view addSubview:imgV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
