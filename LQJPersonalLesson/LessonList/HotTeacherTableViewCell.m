//
//  HotTeacherTableViewCell.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/21.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIImageView+WebCache.h>
#import "HotTeacherTableViewCell.h"
#import "GlobalObject.h"

#define kFloatSize [UIScreen mainScreen].bounds.size.width /320.f
#define FONTCOLORSTRING @"#C3C4C3"

@interface HotTeacherTableViewCell()
{
    UIImageView * iamgeView ;
    UILabel * namelabel;
    UILabel * jobDes;
}
@end
@implementation HotTeacherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addTheView];
    }
    return self;
}

-(void)addTheView
{
    iamgeView = [[UIImageView alloc] init];
    namelabel = [[UILabel alloc] init];
    jobDes = [[UILabel alloc] init];
    
    [self addSubview:iamgeView];
    [self addSubview:namelabel];
    [self addSubview:jobDes];

}

-(void)setStr_iamgeURL:(NSString *)str_iamgeURL
{
    iamgeView.frame = CGRectMake(7 *kFloatSize, 10 * kFloatSize, 61 * kFloatSize, 61 * kFloatSize);
    iamgeView.backgroundColor = [UIColor redColor];
    [iamgeView.layer setMasksToBounds:YES];
    iamgeView.layer.cornerRadius = iamgeView.frame.size.width/2;
    [iamgeView sd_setImageWithURL:[NSURL URLWithString:str_iamgeURL] placeholderImage:[UIImage imageNamed:@"a"]];
    
    _str_iamgeURL = str_iamgeURL;
}

-(void)setStr_name:(NSString *)str_name
{
    namelabel.frame = CGRectMake(83 * kFloatSize, 20 * kFloatSize, 47* kFloatSize, 14  *kFloatSize);
    
    namelabel.font = [UIFont boldSystemFontOfSize:15];
    namelabel.text = str_name;
    
    _str_name = str_name;
}

-(void)setStr_jobDes:(NSString *)str_jobDes
{
    jobDes.frame = CGRectMake(83 * kFloatSize, 45 * kFloatSize, 105 * kFloatSize, 13 * kFloatSize);
    [jobDes setTextColor:[GlobalObject colorWithHexString:FONTCOLORSTRING]];
    jobDes.font = [UIFont systemFontOfSize:13];
    jobDes.text = str_jobDes;
    
    _str_jobDes = str_jobDes;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
