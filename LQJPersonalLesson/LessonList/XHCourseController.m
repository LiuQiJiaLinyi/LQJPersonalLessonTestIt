//
//  LessonMainVC.m
//  LQJPersonalLesson
//
//  Created by LiuQiJia on 16/7/20.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "XHCourseController.h"
#import "MoreButtonCliekdVC.h"
#import "HotTeacherTableVC.h"


#define kFloatSize [UIScreen mainScreen].bounds.size.width /320.f

@interface XHCourseController ()
{
    NSArray * title_str;
}
@end

@implementation XHCourseController

- (void)viewDidLoad {
    [super viewDidLoad];
    title_str = @[@"精彩课程",@"按级别分类",@"按导师分类",@"排列方式"];
    

    [self buildUI];
    // Do any additional setup after loading the view.
}

-(void)buildUI
{
    NSArray * postionArray = @[@"职位介绍",@"职位介绍",@"职位介绍",@"职位介绍"];
    
    NSArray * iamgeArray0 = @[@"",@"",@"",@""];
    NSArray * nameArray0 = @[@"01",@"02",@"03",@"04"];
    
    NSArray * iamgeArray1 = @[@"",@"",@"",@""];
    NSArray * nameArray1 = @[@"11",@"12",@"13",@"14"];
    
    
    NSArray * iamgeArray2 = @[@"",@"",@"",@""];
    NSArray * nameArray2 = @[@"21",@"22",@"23",@"24"];
    
    
    NSArray * iamgeArray3 = @[@"",@"",@"",@""];
    NSArray * nameArray3 = @[@"31",@"32",@"33",@"34"];
    
    NSArray * iamgeArrSum = @[iamgeArray0,iamgeArray1,iamgeArray2,iamgeArray3];
    NSArray * nameArraySum = @[nameArray0,nameArray1,nameArray2,nameArray3];
    
    
    for (int i = 0; i <4; i++) {
        
#pragma mark --底层位置调节--
        UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0,130 * kFloatSize * i, [UIScreen mainScreen].bounds.size.width, 100 * kFloatSize)];
        bottomView.backgroundColor = [UIColor colorWithRed:(arc4random()%200-10)/255.f green:(arc4random()%200-10)/255.f blue:(arc4random()%200-10)/255.f alpha:1];
        
        UIView * bottomSView = [[UIView alloc] initWithFrame:CGRectMake(0,125* kFloatSize* i, [UIScreen mainScreen].bounds.size.width, 124 * kFloatSize)];
        bottomSView.backgroundColor = [UIColor greenColor];
        
        
        if (i ==2) {
            for (int kk = 0; kk < 4; kk++) {
                
                 UIView * tapView = [[UIView alloc] initWithFrame:CGRectMake(kk*80 * kFloatSize, 36 * kFloatSize, 80 * kFloatSize, 84 * kFloatSize)];
                tapView.tag = 23000 + kk + 10 * i;
                tapView.userInteractionEnabled = YES;
                tapView.backgroundColor = [UIColor colorWithRed:(arc4random()%200-10)/255.f green:(arc4random()%200-10)/255.f blue:(arc4random()%200-10)/255.f alpha:1];
                
                
                UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(tapView.frame.size.width/2-24 * kFloatSize, 7* kFloatSize, 48 * kFloatSize, 48 * kFloatSize)];
                
                [headImage.layer setMasksToBounds:YES];
                headImage.layer.cornerRadius = headImage.frame.size.width/2;
                headImage.backgroundColor = [UIColor colorWithRed:(arc4random()%200-10)/255.f green:(arc4random()%200-10)/255.f blue:(arc4random()%200-10)/255.f alpha:1];
                
                
                headImage.image = [UIImage imageNamed:iamgeArrSum[i][kk]];
                
                
                
                UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(tapView.frame.size.width/2-24 * kFloatSize, headImage.frame.size.height + headImage.frame.origin.y, 48 * kFloatSize, 10 *kFloatSize)];
                
                namelabel.text =nameArraySum[i][kk];
                namelabel.textAlignment = NSTextAlignmentCenter;
                
                UILabel * postionlabel = [[UILabel alloc] initWithFrame:CGRectMake(tapView.frame.size.width/2-25 * kFloatSize, namelabel.frame.size.height + namelabel.frame.origin.y, 50* kFloatSize, 10 * kFloatSize)];
                postionlabel.font = [UIFont systemFontOfSize:10];
                
                [postionlabel setTextColor:[UIColor lightGrayColor]];
                postionlabel.text = postionArray[kk];
                postionlabel.textAlignment = NSTextAlignmentCenter;
                
                
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewCliked:)];
                tap.numberOfTapsRequired = 1;
                
                [tapView addGestureRecognizer:tap];
                [tapView addSubview:headImage];
                [tapView addSubview:namelabel];
                [tapView addSubview:postionlabel];
                [bottomSView addSubview:tapView];
                
            }
            
            [self.view addSubview:bottomSView];
            
        }else
        {
        for (int kl =0; kl < 4; kl++) {
            
            UIView * tapView = [[UIView alloc] initWithFrame:CGRectMake(kl*80 * kFloatSize, 36 * kFloatSize, 80 * kFloatSize, 68 * kFloatSize)];
            
            tapView.tag = 23000 + kl + 10 * i;
            
            
            UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(30 *kFloatSize, 12 * kFloatSize, 25 * kFloatSize, 25 * kFloatSize)];
            image.backgroundColor = [UIColor colorWithRed:(arc4random()%200-10)/255.f green:(arc4random()%200-10)/255.f blue:(arc4random()%200-10)/255.f alpha:1];
            //image.image = iamgeArrSum[i][kl];
            
            
            UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kFloatSize, 42 * kFloatSize, 59 * kFloatSize,15 * kFloatSize )];
            nameLabel.text =nameArraySum[i][kl];
            nameLabel.textAlignment = NSTextAlignmentCenter;
            
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewCliked:)];
            tap.numberOfTapsRequired = 1;
            
            
            
            [tapView addSubview:nameLabel];
            [tapView addSubview:image];
            [tapView addGestureRecognizer:tap];
            [bottomView addSubview:tapView];
            [self.view addSubview:bottomView];
          }
          
        }
        
        
        
        [self addtitleLable:i view:bottomSView];
        [self addtitleLable:i view:bottomView];
    }
}

-(void)tapViewCliked:(UITapGestureRecognizer *)tapIt
{
    NSInteger tampTag = tapIt.view.tag/10;
    
    switch (tampTag) {
            
            
        case 2300:
        {
            switch (tapIt.view.tag) {
                case 23000:
                {
                    NSLog(@"%ld",tapIt.view.tag);
                }
                    break;
                case 23001:
                {
                    NSLog(@"%ld",tapIt.view.tag);
                }
                    break;
                case 23002:
                {
                    NSLog(@"%ld",tapIt.view.tag);
                }
                    break;
                case 23003:
                {
                    NSLog(@"%ld",tapIt.view.tag);
                }
                    break;
                    
                default:
                    break;
            }
            
        
        }
            break;
        case 2301:
        {
            
            switch (tapIt.view.tag) {
                case 23010:
                {
                   NSLog(@"%ld",tapIt.view.tag);
                }
                    break;
                case 23011:
                {
                  NSLog(@"%ld",tapIt.view.tag);
                }
                    break;
                case 23012:
                {
                  NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23013:
                {
                   NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case 2302:
        {
            
            switch (tapIt.view.tag) {
                case 23020:
                {
                    NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23021:
                {
                   NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23022:
                {
                   NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23023:
                {
                   NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case 2303:
        {
            switch (tapIt.view.tag) {
                case 23030:
                {
                    NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23031:
                {
                   NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23032:
                {
                    NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__);
                }
                    break;
                case 23033:
                {
                   NSLog(@"%ld==%s",tapIt.view.tag,__FUNCTION__); 
                }
                    break;
                    
                default:
                    break;
            }
            
            
        }
            break;
            
        default:
            break;
    }
}

-(void)addtitleLable:(int)num view:(UIView *)bottom
{
    UIImageView * iamgeaV = [[UIImageView alloc] initWithFrame:CGRectMake(10* kFloatSize, 0, 18 * kFloatSize, 25 * kFloatSize)];
    
    iamgeaV.backgroundColor = [UIColor redColor];
    
    UILabel * titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(iamgeaV.frame.size.width + iamgeaV.frame.origin.x, 0, 80 * kFloatSize, 25 * kFloatSize)];
    titlelabel.text =title_str[num];
    titlelabel.textColor = [UIColor blackColor];
    
    titlelabel.font = [UIFont boldSystemFontOfSize:15];
    
    if (num ==1||num ==3) {
        
        
    }
    else
    {
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width -44  *kFloatSize, 0, 25* kFloatSize, 25* kFloatSize)];
        button.backgroundColor = [UIColor whiteColor];
        button.tag = 9008+ num;
        
        [button setTitle:@"更多>>" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.font = [UIFont systemFontOfSize:5];
        [button addTarget:self action:@selector(moreAboutThiskind:) forControlEvents:UIControlEventTouchUpInside];
        [bottom addSubview:button];
    }
    
    [bottom addSubview:iamgeaV];
    [bottom addSubview:titlelabel];
}

#pragma mark-
#pragma mark –––––点击事件–––––
-(void)moreAboutThiskind:(UIButton *)more
{
    
    
    NSLog(@"点击事件触发%s",__FUNCTION__);
    switch (more.tag) {
        case 9008:
        {
            MoreButtonCliekdVC * moreVC = [[MoreButtonCliekdVC alloc] init];
            [self.navigationController pushViewController:moreVC animated:YES];
        }
            break;
        case 9010:
        {
            
            HotTeacherTableVC * hotVC = [[HotTeacherTableVC alloc] init];
            [self.navigationController pushViewController:hotVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
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
