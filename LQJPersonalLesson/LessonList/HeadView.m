//
//  HeadView.m
//  LQJPersonalLesson
//
//  Created by LiuQiJia on 16/7/21.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "HeadView.h"
#define kFloatSize [UIScreen mainScreen].bounds.size.width /320.f
#import "GlobalObject.h"

@interface HeadView()
{
    UILabel * nameLabel;
    UIView * topView;
    UIImageView * headImage;
    UILabel * jobLabel;
    UILabel * consultNumlabel;
    int consultNum;
    UILabel * detail_Des;
    UIButton * payNow;
    NSString * Teacher_des;
    
}
@end

@implementation HeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI
{
     topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 103 *kFloatSize)];
     headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10 *kFloatSize, 10 * kFloatSize, 83 * kFloatSize, 83 * kFloatSize)];
    [headImage.layer setMasksToBounds:YES];
    headImage.layer.cornerRadius = headImage.bounds.size.width/2;
    headImage.layer.borderWidth =0.3;
    headImage.layer.borderColor = [UIColor whiteColor].CGColor;
    
     nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(103 * kFloatSize, 16 * kFloatSize, 36 * kFloatSize, 18 * kFloatSize)];

    [nameLabel setText:@"LAJI"];
    [nameLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
    jobLabel =[[UILabel alloc] initWithFrame:CGRectMake(10 *kFloatSize, 45 *kFloatSize, 200 * kFloatSize, 18 * kFloatSize)];
    
    consultNumlabel =[[UILabel alloc] initWithFrame:CGRectMake(10 *kFloatSize, 72 * kFloatSize, 83 * kFloatSize, 15 * kFloatSize)];
    
    NSString * strtemp = [NSString stringWithFormat:@"%d人咨询过",consultNum];
    [consultNumlabel setText:strtemp];
    
    [topView addSubview:headImage];
    [topView addSubview:nameLabel];
    [topView addSubview:jobLabel];
    //[topView addSubview:consultNumlabel];
    [self addSubview:topView];
    [self buildDetail];
}

-(void)buildDetail
{
    detail_Des = [[UILabel alloc] initWithFrame:CGRectMake(0, 102  *kFloatSize, [UIScreen mainScreen].bounds.size.width, 40 *kFloatSize)];
    detail_Des.numberOfLines = -1;
    detail_Des.font = [UIFont systemFontOfSize:10];
    
    
    UIButton * but_ShowMore = [[UIButton alloc] initWithFrame:CGRectMake(13 * kFloatSize, detail_Des.bounds.origin.y + detail_Des.bounds.size.height, 298 * kFloatSize, 20 * kFloatSize)];
    [but_ShowMore.layer setMasksToBounds:YES];
    [but_ShowMore.layer setCornerRadius:5];
     but_ShowMore.backgroundColor = [UIColor lightGrayColor];
    [but_ShowMore addTarget:self action:@selector(exlength:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:detail_Des];
    [self addSubview:but_ShowMore];
    
}

-(void)exlength:(UIButton *)butn
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:10]};
    CGSize testsize = [Teacher_des boundingRectWithSize:CGSizeMake(detail_Des.frame.size.width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
}
@end
