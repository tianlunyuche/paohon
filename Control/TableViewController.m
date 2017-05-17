//
//  TableViewController.m
//  Control
//
//  Created by xinying on 2017/2/12.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "TableViewController.h"
#import "ZXCreatMyMapVC.h"
#import "ZXQRcodeVC.h"
#import "ZXMapkitVC.h"
#import "ZXAVPlayerVC.h"
#import "ZXDesignModeTableVC.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
//选中单元格要调用此协议函数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ((indexPath.section == 0 )&& (indexPath.row == 0)) {
        
        [self.navigationController pushViewController:[[ZXCreatMyMapVC alloc] init] animated:YES];

    }
    if ((indexPath.section == 0 )&& (indexPath.row == 1)) {
    
        [self.navigationController pushViewController:[[ZXMapkitVC alloc] init] animated:YES];
 
    }
    if ((indexPath.section == 1 )&& (indexPath.row == 0)) {
        
        [self.navigationController pushViewController:[[ZXAVPlayerVC alloc] init] animated:YES];
    }
    if ((indexPath.section == 1 )&& (indexPath.row == 1)) {
        
        [self.navigationController pushViewController:[[ZXQRcodeVC alloc] init] animated:YES];
    }
    if ((indexPath.section == 4 )&& (indexPath.row == 0)) {
        
        [self.navigationController pushViewController:[[ZXDesignModeTableVC alloc] init] animated:YES];
    }
    
}

//willDisplayCell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [self tableTitles][indexPath.section][indexPath.row];

}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self tableTitles].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self tableTitles][section].count;
}

#pragma mark - data
- (NSArray <NSArray *> *)tableTitles {
    return @[@[@"地图调用",
               @"Mapkit地图"],
             @[@"音乐播放",
               @"二维码 生成"],
             @[@"金库管理",
               @"兑换商城"],
             @[@"造星",
               @"推荐给好友"],
             @[@"设计模式"]];
};
@end
