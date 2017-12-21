//
//  ZXCollectionVC.m
//  Control
//
//  Created by xinying on 2017/12/11.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "ZXCollectionVC.h"
#import "ZXCollectionViewCell.h"

@interface ZXCollectionVC ()

@end

@implementation ZXCollectionVC

static NSString * const reuseIdentifier = @"ZXCollectionViewCell";

-(instancetype)init{

    if ( self  =[super init]) {
        UICollectionViewFlowLayout *collectionViewLayout=[[UICollectionViewFlowLayout alloc] init];
        collectionViewLayout.itemSize =CGSizeMake(60, 120);
        self.collectionView =[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewLayout];
        self.collectionView.backgroundColor =[UIColor grayColor];
        [self.collectionView registerClass:ZXCollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
        //        [self.collectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //建布局参数

    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor greenColor];

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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    // Configure the cell
    cell.backgroundColor =[UIColor blueColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
