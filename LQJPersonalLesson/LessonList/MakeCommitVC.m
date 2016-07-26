//
//  MakeCommitVC.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/26.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "MakeCommitVC.h"
#import "GlobalHeader.h"
#import "GlobalObject.h"
#import <AFNetworking.h>


@interface MakeCommitVC ()
{
    UITextView * textview;

}
@property (nonatomic ,copy)NSString * CurrentTime;
@end

@implementation MakeCommitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [GlobalObject colorWithHexString:@"#666666"];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelTheview:)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    self.view.alpha = 0.8;
    [self buildUI];
    // Do any additional setup after loading the view.
}

-(void)buildUI
{
    UIView * bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 162 *kFloatSize, kSCRSize.width, kSCRSize.height - 162 *kFloatSize)];
    
    textview = [[UITextView alloc] initWithFrame:CGRectMake(10 *kFloatSize, 10 *kFloatSize, kSCRSize.width -20 *kFloatSize, 85 *kFloatSize)];
    [textview setFont:[UIFont systemFontOfSize:13]];
    
    [textview.layer setMasksToBounds:YES];
    [textview setKeyboardType:UIKeyboardTypeDefault];
    [textview.layer setCornerRadius:5];
    [textview setTextColor:[UIColor lightGrayColor]];
    [textview setText:@"优质评论将被优先展示"];
    
    [bottomview addSubview:textview];
    
    UIButton * but = [[UIButton alloc] initWithFrame:CGRectMake(262 *kFloatSize, textview.frame.origin.y + textview.frame.size.height +10 *kFloatSize, 51 *kFloatSize, 23 *kFloatSize)];
    but.backgroundColor = [GlobalObject colorWithHexString:@"#C9C9C9"];
    but.alpha = 0.8;
    [but.layer setMasksToBounds:YES];
    [but.layer setCornerRadius:5];
    [but addTarget:self action:@selector(sendCommitToserver:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)sendCommitToserver:(UIButton *)butt
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"上传服务器失败" preferredStyle:UIAlertControllerStyleAlert];
    [alert presentViewController:alert animated:NO completion:^{
        LQJLog(@"触发上传服务器");
    }];
    
    
    
}

-(void)cancelTheview:(UITapGestureRecognizer*)tap
{
    [textview resignFirstResponder];

}
#pragma mark --获取当前时间
-(NSString *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateTime = [formatter stringFromDate:[NSDate date]];
    self.CurrentTime =dateTime;
    return _CurrentTime;
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
