//
//  MoreButtCollectionCell.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/21.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "MoreButtCollectionCell.h"
#define kFloatSize [UIScreen mainScreen].bounds.size.width /320.f

@interface MoreButtCollectionCell()
{
    UIImageView * headView;
    UILabel * namelabel;
}
@end

@implementation MoreButtCollectionCell
-(instancetype)init
{
    if (self = [self init]) {
        
        [self buildUI];
        
    }
    
    return self;
}

-(void)buildUI
{
    headView = [[UIImageView alloc] init];
    namelabel = [[UILabel alloc] init];
    [self addSubview:headView];
    [self addSubview:namelabel];

}

-(void)setStr_image:(NSString *)str_image
{
    headView.frame = CGRectMake(self.frame.size.width/2-15*kFloatSize, 0, 30 *kFloatSize , 30 * kFloatSize);
    
    _str_image = str_image;
}

-(void)setStr_name:(NSString *)str_name
{
    namelabel.frame = CGRectMake(15 * kFloatSize, headView.frame.size.height + headView.frame.origin.y, 50 * kFloatSize, 13 * kFloatSize);
    [namelabel setTextColor:[UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1.00]];
    namelabel.font = [UIFont systemFontOfSize:12];
    _str_name = str_name;
}
@end
