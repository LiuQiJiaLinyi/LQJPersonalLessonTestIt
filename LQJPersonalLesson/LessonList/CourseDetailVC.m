//
//  CourseDetailVC.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/25.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "CourseDetailVC.h"
#import "JKVideoPlayView.h"
#import "GlobalHeader.h"
#import "GlobalObject.h"
#import "CommentDetailCell.h"

#define FONTSIZE [UIScreen mainScreen].bounds.size.width/(320.f/15.f)

@interface CourseDetailVC ()<UITableViewDataSource , UITableViewDelegate,UIScrollViewDelegate>
{
    UIScrollView * bottom_back_scrollview;
    UIView * lineView;
    NSString * des_str;
    NSMutableArray * but_array;
    UILabel * textDes;
    int commitCount;
    UITableView * commitTable;
    UIView * bottom_view;
    
    BOOL isGoldNum;
}
@end

@implementation CourseDetailVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    but_array = [[NSMutableArray alloc] init];
    [self gotData];
    [self buildUI];
    
    // Do any additional setup after loading the view.
}

-(void)gotData
{
    isGoldNum = YES;
}

-(void)buildUI
{
    
    [self setUpBottomScrollView];
    [self setUpAVplayer];
    [self setUpMiddleButton];
    
    if (isGoldNum)
    {
      [self platinumSetUp];
    }
    else
    {
    
    }
    
    
}
#pragma mark --提示开通白金会员
/*!
 *  @author LiuQiJia, 16-07-25 15:07:38
 *
 *  @brief 白金会员设置
 */
-(void)platinumSetUp
{

}

#pragma mark
#pragma mark –––––添加顶部播放器–––––––
-(void)setUpAVplayer
{
    JKVideoPlayView * jkvideo = [[JKVideoPlayView alloc] initWithFrame:CGRectMake(0, 0,kSCRSize.width, 200 *kFloatSize)];
    jkvideo.playID = 5;
    [self.view addSubview:jkvideo];
}

#pragma mark 横竖屏判断方法
- (void)onDeviceOrientationChange {
    UIDeviceOrientation oriention = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceOriention = (UIInterfaceOrientation)oriention;
    switch (interfaceOriention) {
        case UIInterfaceOrientationUnknown:
            NSLog(@"位置方向");
            break;
        case UIInterfaceOrientationPortrait:
            NSLog(@"第0个旋转方向---电池栏在上");
            //[self backOrientationPortrait];
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            NSLog(@"第3个旋转方向---电池栏在下");
            //[self backOrientationPortrait];
            break;
        case UIInterfaceOrientationLandscapeLeft:
           // [self setDeviceOrientationLandscapeLeft];
            NSLog(@"第2个旋转方向---电池栏在右");
            break;
        case UIInterfaceOrientationLandscapeRight:
           // [self setDeviceOrientationLandscapeRight];
            NSLog(@"第1个旋转方向---电池栏在左");
            break;
        default:
            break;
            
    }
}

#pragma mrak --中间的按钮
-(void)setUpMiddleButton
{
    NSArray * str_arr = @[@"详情",@"讲师",@"评论"];
    for (int i = 0; i<3; i++) {
        UIButton * middleBut = [[UIButton alloc] initWithFrame:CGRectMake(i * (kSCRSize.width/3), 246 *kFloatSize, (kSCRSize.width/3), 30*kFloatSize)];
        
        if (i == 0) {
            lineView = [[UIView alloc] initWithFrame:CGRectMake(i * (kSCRSize.width/3), 246 *kFloatSize, (kSCRSize.width/3), 1*kFloatSize)];
            lineView.backgroundColor = [UIColor redColor];
            
            
            [self.view addSubview:lineView];
        }
        middleBut.backgroundColor = [UIColor whiteColor];
        [middleBut setTitle:str_arr[i] forState:UIControlStateNormal];
        [middleBut setTitleColor:[UIColor colorWithRed:0.506 green:0.506 blue:0.506 alpha:1.00] forState:UIControlStateNormal];
        [middleBut setTitleColor:[UIColor colorWithRed:0.965 green:0.475 blue:0.439 alpha:1.00] forState:UIControlStateSelected];
        
        [middleBut addTarget:self action:@selector(changeScrollviewContentOffSet:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:middleBut];
        [but_array addObject:middleBut];
        
    }

}

-(void)changeScrollviewContentOffSet:(UIButton *)sender
{
    for (UIButton * btt in but_array) {
        if (btt == sender) {
            btt.selected = YES;
        }
        else
        {
            btt.selected = NO;
        }
    }
    
    lineView.frame = CGRectMake(sender.frame.origin.x, 246 *kFloatSize, (kSCRSize.width/3), 1*kFloatSize);
    
    

}
#pragma mark --设置底层UIScrollview
-(void)setUpBottomScrollView
{
    bottom_back_scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kSCRSize.width, kSCRSize.height -295  *kFloatSize)];
    bottom_back_scrollview.contentSize = CGSizeMake(0, kSCRSize.height*2);
    bottom_back_scrollview.showsHorizontalScrollIndicator = NO;
    bottom_back_scrollview.showsVerticalScrollIndicator = NO;
    bottom_back_scrollview.backgroundColor = [UIColor whiteColor];
    bottom_back_scrollview.tag = 1508;
    
    [self addDetailIntroduction];
   
    [self addTeacherView];
    [self addCommitView];
    [self addBottomToolView];
    
    [self.view addSubview:bottom_back_scrollview];
}

-(void)addDetailIntroduction
{
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(11  *kFloatSize, 0, 163 * kFloatSize, 20 * kFloatSize)];
    [nameLabel setText:@"世界上最伟大的创新"];
    [nameLabel setTextColor:[UIColor blackColor]];
    [nameLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [bottom_back_scrollview addSubview:nameLabel];
    
    
    
    UILabel * playLavel = [[UILabel alloc] initWithFrame:CGRectMake(11* kFloatSize, nameLabel.frame.size.height + nameLabel.frame.origin.y + 18 * kFloatSize, 88 * kFloatSize, 11 * kFloatSize)];
    NSString * str = [NSString stringWithFormat:@"播放次数:%d",_playcount];
    
    NSRange rage = [str rangeOfString:@": "];
    NSRange rageIt = {rage.location + 1, str.length-rage.location-1};
    
    NSMutableAttributedString *atstring = [[NSMutableAttributedString alloc] initWithString:str];

    [atstring addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:rageIt];
    
    playLavel.attributedText = atstring;
    
    [bottom_back_scrollview addSubview:playLavel];
    
    
    
    textDes = [[UILabel alloc] initWithFrame:CGRectMake(10 *kFloatSize, playLavel.frame.origin.y + playLavel.frame.size.height+ 20 * kFloatSize, kSCRSize.width-20 *kFloatSize, 40*kFloatSize)];
    [textDes setBackgroundColor:[UIColor whiteColor]];
    textDes.lineBreakMode = NSLineBreakByTruncatingTail;
    textDes.numberOfLines = -1;
    [textDes setText:@"秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书秒速描述米搜书"];
    [textDes setTextColor:[GlobalObject colorWithHexString:@"#929292"]];
    [textDes setFont:[UIFont systemFontOfSize:10]];
    [textDes setUserInteractionEnabled:NO];
    [bottom_back_scrollview addSubview:textDes];
    
    
    UIButton * extensionBut = [[UIButton alloc] initWithFrame:CGRectMake(10 *kFloatSize, textDes.frame.origin.y + textDes.frame.size.height +5, kSCRSize.width-20 *kFloatSize, 40*kFloatSize)];
    extensionBut.backgroundColor = [UIColor redColor];
    [extensionBut addTarget:self action:@selector(enlengthTextDes:) forControlEvents:UIControlEventTouchUpInside];
    [bottom_back_scrollview addSubview:extensionBut];
    
    
    float heightTemp = bottom_back_scrollview.contentSize.height - extensionBut.frame.size.height - extensionBut.frame.origin.y;
    
     bottom_view = [[UIView alloc] initWithFrame:CGRectMake(10 *kFloatSize, extensionBut.frame.origin.y + extensionBut.frame.size.height, kSCRSize.width,heightTemp)];
    [bottom_back_scrollview addSubview:bottom_view];
}

#pragma mark
#pragma mark ––––评论–––––––
-(void)addCommitView
{
    UILabel * com = [[UILabel alloc] initWithFrame:CGRectMake(10*kFloatSize, 130 *kFloatSize, 80*kFloatSize, 16 *kFloatSize)];
    com.font = [UIFont boldSystemFontOfSize:20];
    com.text = [NSString stringWithFormat:@"评论（%d）",commitCount];
    [bottom_view addSubview:com];
    
    commitTable = [[UITableView alloc] initWithFrame:CGRectMake(10 *kFloatSize, com.frame.size.height + com.frame.origin.y, kSCRSize.width -20 * kFloatSize, bottom_back_scrollview.frame.size.height - com.frame.size.height -com.frame.origin.y) style:UITableViewStylePlain];
    commitTable.delegate = self;
    commitTable.dataSource = self;
    
    commitTable.tag = 1507;
    commitTable.backgroundColor = [UIColor whiteColor];
    [commitTable registerClass:[CommentDetailCell class] forCellReuseIdentifier:reuseStr];
    [bottom_back_scrollview addSubview:commitTable];
    
    

}

#pragma mark --UITableview代理方法

static NSString * reuseStr = @"course";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentDetailCell  *cell = [commitTable dequeueReusableCellWithIdentifier:reuseStr];
    
    if (cell == nil) {
        cell = [[CommentDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseStr];
    }
    cell.str_imageURL = @"";
    cell.str_name = @"zhongzongwanglaoji";
    cell.str_time = @"2016-02-15 13:23:45";
    [cell.but_commit addTarget:self action:@selector(commitTheCommmit:) forControlEvents:UIControlEventTouchUpInside];
    [cell.but_zan addTarget:self action:@selector(zan:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)commitTheCommmit:(UIButton *)but
{
    CommentDetailCell * tempcell = (CommentDetailCell *)but.superview.superview;
    
   NSIndexPath * index = [commitTable indexPathForCell:tempcell];
    LQJLog(@"commit••••%ld",(long)index.row);
    

}

-(void)zan:(UIButton *)but
{
    CommentDetailCell * tempcell = (CommentDetailCell *)but.superview.superview;
    
    NSIndexPath * index = [commitTable indexPathForCell:tempcell];
    LQJLog(@"zan****%ld",(long)index.row);
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}

#pragma mark
#pragma mark –––––––UIScrollView代理––––––––––
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1507) {
        LQJLog(@"当前滑动的是tableview");
    }else
    {
        LQJLog(@"滑动的是bottom_scrollview¡");
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (scrollView.tag == 1507) {
        LQJLog(@"当前滑动的是tableview");
    }else
    {
        LQJLog(@"滑动的是bottom_scrollview¡");
    }
}


#pragma mark
#pragma mark –––––教师详细––––––
-(void)addTeacherView
{
    UIView  *teacher = [[UIView alloc] initWithFrame:CGRectMake(10 * kFloatSize, 0, kSCRSize.width - 20 * kFloatSize, 100 * kFloatSize)];
    UILabel  *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kFloatSize, 0, 36 *kFloatSize, 20 * kFloatSize)];
    [titlelabel setTextColor:[GlobalObject colorWithHexString:@"#5C5C5C"]];
    
    titlelabel.text = @"标题";
    [teacher addSubview:titlelabel];
    
    UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10*kFloatSize,titlelabel.frame.size.height + titlelabel.frame.origin.y + 17 *kFloatSize, 62 *kFloatSize, 62 *kFloatSize)];
    [headImage.layer setMasksToBounds:YES];
    [headImage.layer setCornerRadius:headImage.frame.size.height/2];
    headImage.image = [UIImage imageNamed:@""];
    [teacher addSubview:headImage];
    
    UILabel * teacherNameLab = [[UILabel alloc] initWithFrame:CGRectMake(headImage.frame.size.width + headImage.frame.origin.x + 15 *kFloatSize, headImage.frame.origin.y + 8 *kFloatSize, 45 *kFloatSize, 15 *kFloatSize)];
    teacherNameLab.text = @"赵荣春";
    teacherNameLab.font = [UIFont boldSystemFontOfSize:15*FONTSIZE];
    [teacher addSubview:teacherNameLab];
    
    UILabel * schoolNamelabel = [[UILabel alloc] initWithFrame:CGRectMake(teacherNameLab.frame.origin.x, teacherNameLab.frame.size.height + teacherNameLab.frame.origin.y + 10 *kFloatSize , 111 *kFloatSize, 15 *kFloatSize)];
    [schoolNamelabel setTextColor:[GlobalObject colorWithHexString:@"#989898"]];
    
    [schoolNamelabel setText:@"英国利物浦大学"];
    [teacher addSubview:schoolNamelabel];
    
    UIImageView * imageRight = [[UIImageView alloc] initWithFrame:CGRectMake(296 *kFloatSize,58 * kFloatSize , 13 *kFloatSize, 19 *kFloatSize)];
    
    imageRight.image = [UIImage imageNamed:@""];
    imageRight.backgroundColor = [UIColor redColor];
    [teacher addSubview:imageRight];
    
    [bottom_view addSubview:teacher];
}

#pragma mark --展开简介--
-(void)enlengthTextDes:(UIButton *)butt
{
    CGRect buttFrame = butt.frame;
    
    CGRect bottomFrame = bottom_view.frame;
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:10]};
    CGSize testsize = [textDes.text boundingRectWithSize:CGSizeMake(textDes.frame.size.width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    CGRect frame = textDes.frame;
    frame.size.height = testsize.height;
  
    textDes.frame = frame;
    
    buttFrame.origin.y = textDes.frame.origin.y + textDes.frame.size.height +5;
    
    butt.frame = buttFrame;
    
    bottomFrame.origin.y = butt.frame.size.height + butt.frame.origin.y + 10 * kFloatSize;
    bottom_view.frame = bottomFrame;
    
}
#pragma mark
#pragma mark --底部工具栏--
-(void)addBottomToolView
{
    UIView * toolView = [[UIView alloc] initWithFrame:CGRectMake(0, kSCRSize.height - 49 *kFloatSize, kSCRSize.width, 49 *kFloatSize)];
    toolView.backgroundColor = [GlobalObject colorWithHexString:@"#FEFEFE"];
    toolView.alpha = 1;
    toolView.userInteractionEnabled =YES;
    
    toolView.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * makeCommit = [[UIButton alloc] initWithFrame:CGRectMake(28 *kFloatSize, 14 *kFloatSize, 68 *kFloatSize, 20*kFloatSize)];
    [makeCommit setTitle:@"写评论" forState:UIControlStateNormal];
    
    [makeCommit addTarget:self action:@selector(toMakeCommit:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:makeCommit];
    
    
    UIButton * shareButton = [[UIButton alloc] initWithFrame:CGRectMake(214*kFloatSize, 14*kFloatSize, 22 *kFloatSize, 20*kFloatSize)];
    [shareButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(sharedIt:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:shareButton];
    
    
    UIButton * likeIt = [[UIButton alloc] initWithFrame:CGRectMake(277 *kFloatSize, 14 *kFloatSize, 22 *kFloatSize, 20*kFloatSize)];
    [likeIt setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [likeIt addTarget:self action:@selector(likeIt:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:likeIt];
    [self.view addSubview:toolView];
    [self.view bringSubviewToFront:toolView];

}

#pragma mark 视频评论
-(void)toMakeCommit:(UIButton *)butCommit
{

}
#pragma mark 分享
-(void)sharedIt:(UIButton *)butShare
{

}
#pragma mark 喜欢
-(void)likeIt:(UIButton *)butLiked
{

}
/*!
 *  @author LiuQiJia, 16-07-25 14:07:08
 *
 *  @brief 返回文本高度，用于动态获取文本高度
 *
 *  @param text 需要展示的文本
 *
 *  @return 文本高度
 */
+ (CGFloat)detailTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
    return rectToFit.size.height;
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
