//
//  MoreButtonCliekdVC.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/21.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "MoreButtonCliekdVC.h"
#define SCR [UIScreen mainScreen].bounds.size

@interface MoreButtonCliekdVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView * maincollection;
    int num_section;
}
@end

@implementation MoreButtonCliekdVC

-(void)loadView
{
    [self buildUI];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"精彩课程";
    
}

-(void)buildUI
{
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, SCR.width/4);
    flowlayout.minimumLineSpacing = 0;
    flowlayout.minimumInteritemSpacing = 0;
    flowlayout.itemSize = CGSizeMake(SCR.width/4, SCR.width/4);
    
    maincollection = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowlayout];

    self.view = maincollection;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return num_section;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = nil;
    return cell;

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
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
