//
//  BottomView.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/22.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "BottomView.h"
#import "DetailTeacherTableCell.h"

#define kFloatSize [UIScreen mainScreen].bounds.size.width /320.f


@interface BottomView()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton * Allpicture;
    UIButton * Allaudio;
    UIButton * Allvideo;
    UIScrollView * bottom_scr;
    UIView * lineview;
    
}
@end

static NSString * reuseID = @"detailcell";
@implementation BottomView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI
{
    
    
    Allpicture = [[UIButton alloc] initWithFrame:CGRectMake(13 * kFloatSize, 0, 84 * kFloatSize, 25 * kFloatSize)];
    [Allpicture setTitle:@"图文" forState:UIControlStateNormal];
    Allpicture.tag = 1540;
    
    [Allpicture setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Allpicture setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    lineview = [[UIView alloc] initWithFrame:CGRectMake(Allpicture.frame.origin.x, Allpicture.frame.origin.y + Allpicture.frame.size.height, Allpicture.frame.size.width, 1)];
    lineview.backgroundColor = [UIColor redColor];
    lineview.alpha = 1;
    
    
    Allaudio = [[UIButton alloc] initWithFrame:CGRectMake(Allpicture.frame.origin.x + Allpicture.frame.size.width, 0, 84 * kFloatSize, 25 * kFloatSize)];
    [Allaudio setTitle:@"音频" forState:UIControlStateNormal];
    
    [Allaudio setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Allaudio setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    Allaudio.tag = 1541;
    
    
    Allvideo = [[UIButton alloc] initWithFrame:CGRectMake(Allaudio.frame.origin.x + Allaudio.frame.size.width, 0, 84 * kFloatSize, 25 * kFloatSize)];
    [Allvideo setTitle:@"视频" forState:UIControlStateNormal];
    
    [Allvideo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Allvideo setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    Allvideo.tag = 1542;
    
    bottom_scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    bottom_scr.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);
    bottom_scr.backgroundColor = [UIColor whiteColor];
    [bottom_scr setShowsHorizontalScrollIndicator:NO];
    bottom_scr.alwaysBounceHorizontal = YES;
    [bottom_scr setAlwaysBounceVertical: NO];
    
    for (int i = 0; i <3; i++) {
        UITableView * tempTable = [[UITableView alloc] initWithFrame:CGRectMake(i*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 254 * kFloatSize) style:UITableViewStylePlain];
        tempTable.tag = 1108+i;
        tempTable.delegate =self;
        tempTable.dataSource = self;
        tempTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [tempTable registerClass:[DetailTeacherTableCell class] forCellReuseIdentifier:reuseID];
        [bottom_scr addSubview:tempTable];
        
    }
    
    
    [self addSubview:bottom_scr];
    
    [self addSubview:Allpicture];
    [self addSubview:lineview];
    [self addSubview:Allvideo];
    [self addSubview:Allaudio];
    

}

-(void)changeBottomTableview:(UIButton * )butt
{
    switch (butt.tag) {
        case 1540:
        {
            bottom_scr.contentOffset = CGPointMake(0,0);
        }
            break;
        case 1541:
        {
            bottom_scr.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
        }
            break;
        case 1542:
        {
            bottom_scr.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0);
        }
            break;
            
        default:
            break;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTeacherTableCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (cell == nil) {
        cell = [[DetailTeacherTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.title_str =@"标题";
    cell.des_str = @"韩静是众卓咨询的培训讲师，7年上市公司高管经验曾任职黑龙江电视台主持人，国家高级培训讲师";
    cell.iamge_str = @"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png";
    cell.playTime_str = @"播放：800";
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

/*

- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
