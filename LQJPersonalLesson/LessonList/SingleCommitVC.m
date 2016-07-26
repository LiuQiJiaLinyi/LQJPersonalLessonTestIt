//
//  SingleCommitVC.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/26.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIImageView+WebCache.h>
#import "GlobalObject.h"
#import "GlobalHeader.h"
#import "SingleCommitVC.h"
#import "SingleCommitCell.h"

@interface SingleCommitVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView * headView;
    UITableView * commitTable;
    NSString * imageURL_str;
    UILabel * namelabel;
    UILabel * timelabel;
    UILabel * deslabel;
    UIImageView * iamge;
    
}
@end

@implementation SingleCommitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"详情";
    [self buildUI];
    [self gotData];
    
    
}

-(void)buildUI
{
    headView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 88 *kFloatSize, kSCRSize.width)];
    headView.backgroundColor = [UIColor whiteColor];
    
    
    iamge = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0, 41 *kFloatSize, 41*kFloatSize)];
    [iamge.layer setMasksToBounds:YES];
    [iamge.layer setCornerRadius:iamge.frame.size.width/2];
    [iamge sd_setImageWithURL:[NSURL URLWithString:imageURL_str] placeholderImage:[UIImage imageNamed:@""]];
    [headView addSubview:iamge];

    namelabel = [[UILabel alloc] initWithFrame:CGRectMake(iamge.frame.origin.x + iamge.frame.size.width +12 *kFloatSize, 0, 43*kFloatSize, 14 *kFloatSize)];
    [namelabel setTextColor:[UIColor lightGrayColor]];
    namelabel.text = @"姓名";
    [headView addSubview:namelabel];
    
    
    timelabel = [[UILabel alloc] initWithFrame:CGRectMake(namelabel.frame.size.width + namelabel.frame.origin.x, 0, 118 *kFloatSize, 14*kFloatSize)];
    [timelabel setTextColor:[UIColor lightGrayColor]];
    timelabel.text = @"2016-05-23 05:27:22";
    [headView addSubview:timelabel];
    
    
    deslabel = [[UILabel alloc] initWithFrame:CGRectMake(namelabel.frame.origin.x, namelabel.frame.origin.y + namelabel.frame.size.height +6 *kFloatSize, 238 *kFloatSize, 15 *kFloatSize)];
    [deslabel setTextColor:[UIColor blackColor]];
    deslabel.text = @"描述内容描述内容描述内容描述内容描述内容";
    [headView addSubview:deslabel];
    [self.view addSubview:headView];
    
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(headView.frame.size.height + 10 *kFloatSize, 0, kSCRSize.width, 47 *kFloatSize)];
    tipLabel.font = [UIFont boldSystemFontOfSize:20];
    
    tipLabel.text = @"    全部评论";
    [self.view addSubview:tipLabel];
    [self addTableView];
    [self addBottomToolView];
    
}
static NSString * reuseID = @"singleCommit";
-(void)addTableView
{

    commitTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 143 *kFloatSize, kSCRSize.width, 313 *kFloatSize) style:UITableViewStylePlain];
    commitTable.delegate = self;
    commitTable.dataSource = self;
    [commitTable registerClass:[SingleCommitCell class] forCellReuseIdentifier:reuseID];
    commitTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:commitTable];
    
}

#pragma mark
#pragma mark --tableView代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingleCommitCell * cell = [commitTable dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[SingleCommitCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.str_des = @"wulalalalalala";
    cell.str_image = @"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png";
    cell.str_name =@"育德安然";
    cell.str_time = @"2015-03-06 18:09:45";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80 *kFloatSize;
}

-(void)addBottomToolView
{
    UIView * bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, kSCRSize.height -51 *kFloatSize, kSCRSize.width, 51 *kFloatSize)];
    UILabel * labe = [[UILabel alloc] initWithFrame:CGRectMake(15 *kFloatSize, 12 *kFloatSize, 295 *kFloatSize, 30 *kFloatSize)];
    
    labe.backgroundColor = [UIColor whiteColor];
    [labe setTextColor:[UIColor lightGrayColor]];
    [labe setFont:[UIFont systemFontOfSize:10]];
    labe.text = @"  写评论";
    [bottomview addSubview:labe];
    [self.view addSubview:bottomview];
    
    
}

-(void)gotData
{

}

-(void)resetHeadView
{

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
