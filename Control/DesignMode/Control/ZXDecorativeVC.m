//
//  ZXDecorativeVC.m
//  Control
//
//  Created by xinying on 2017/5/18.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "ZXDecorativeVC.h"
#import "House.h"
#import "TableDecorator.h"
#import "ChairDecorator.h"
#import "CommercialHouse.h"

@interface ZXDecorativeVC ()

@end

@implementation ZXDecorativeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    House  *house=[[CommercialHouse alloc]init];
#warning
    house=[[TableDecorator alloc]initWithHouse:house].house;
    house=[[ChairDecorator alloc]initWithHouse:house].house;
    ZXLog(@"房子价格:%f", [house totalMoney]);
    ZXLog(@"房子详情:%@",[house detialInfo]);
    ZXLog(@"博客园-FlyElephant");
    ZXLog(@"http://www.cnblogs.com/xiaofeixiang/");
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
