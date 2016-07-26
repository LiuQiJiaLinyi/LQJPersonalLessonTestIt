//
//  CommentDetailCell.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/25.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "CommentDetailCell.h"
#import "GlobalHeader.h"
#import <UIImageView+WebCache.h>


@interface CommentDetailCell()
{
    UIImageView *iamgeView;
    UILabel * namelabel;
    UILabel * timelabel;
    UILabel * deslabel;

    
}
@end

@implementation CommentDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI
{
    iamgeView = [[UIImageView alloc] init];
    namelabel = [[UILabel alloc] init];
    timelabel = [[UILabel alloc] init];
    deslabel= [[UILabel alloc] init];
    _but_zan = [[UIButton alloc] init];
    _but_commit = [[UIButton alloc] init];
    
    [self.contentView addSubview:iamgeView];
    [self.contentView addSubview:namelabel];
    [self.contentView addSubview:timelabel];
    [self.contentView addSubview:deslabel];
    [self.contentView addSubview:_but_zan];
    [self.contentView addSubview:_but_commit];

}


-(void)setStr_imageURL:(NSString *)str_imageURL
{
    iamgeView.frame = CGRectMake(10 *kFloatSize, 0, 42 *kFloatSize, 42 *kFloatSize);
    [iamgeView.layer setMasksToBounds:YES];
    [iamgeView.layer setCornerRadius:iamgeView.frame.size.height/2];
    [iamgeView sd_setImageWithURL:[NSURL URLWithString:str_imageURL] placeholderImage:[UIImage imageNamed:@""]];
    
    _str_imageURL = str_imageURL;
}

-(void)setStr_name:(NSString *)str_name
{
    namelabel.frame = CGRectMake(iamgeView.frame.size.width + iamgeView.frame.origin.x + 10 *kFloatSize, 0,41 *kFloatSize, 15 *kFloatSize);
    [namelabel setTextColor:[UIColor lightGrayColor]];
    namelabel.text = str_name;
    _str_name = str_name;
}

-(void)setStr_time:(NSString *)str_time
{
    timelabel.frame = CGRectMake(namelabel.frame.origin.x + namelabel.frame.size.width + 13 *kFloatSize, namelabel.frame.origin.y, 118 * kFloatSize, 10 *kFloatSize);
    [timelabel setTextColor:[UIColor lightGrayColor]];
    timelabel.text = str_time;
    _str_time = str_time;
}

-(void)setStr_des:(NSString *)str_des
{
    deslabel.frame = CGRectMake(namelabel.frame.origin.x, namelabel.frame.origin.y + namelabel.frame.size.height, 240 *kFloatSize, 50*kFloatSize);
    [deslabel setTextColor:[UIColor blackColor]];
    deslabel.font =[UIFont boldSystemFontOfSize:15];
    deslabel.text = str_des;
    
    _str_des = str_des;
}

-(void)setStr_commitNum:(NSString *)str_commitNum
{
    _but_commit.frame = CGRectMake(222 *kFloatSize, deslabel.frame.origin.y + deslabel.frame.size.height, 30 * kFloatSize, 20 *kFloatSize);
//    [but_commit setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
//    [but_commit setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_but_commit setTitle:@"👍 5" forState:UIControlStateNormal];
    [_but_commit setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_but_commit setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    _str_commitNum = str_commitNum;
}

-(void)setStr_zanNum:(NSString *)str_zanNum
{
    _but_zan.frame = CGRectMake(222 *kFloatSize, _but_commit.frame.origin.y, 30 * kFloatSize, 20 *kFloatSize);
    
    [_but_zan setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [but_zan setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_but_zan setTitle:@"评论：50" forState:UIControlStateNormal];
    
    _str_zanNum = str_zanNum;
}

@end
