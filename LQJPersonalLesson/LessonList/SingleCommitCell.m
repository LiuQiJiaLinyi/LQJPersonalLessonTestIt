//
//  SingleCommitCell.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/26.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIImageView+WebCache.h>
#import "SingleCommitCell.h"
#import "GlobalHeader.h"
#import "GlobalObject.h"

@interface SingleCommitCell()
{
    UIButton * but_zan;
    UILabel * namelabel;
    UILabel * timelabel;
    UIImageView * imageView;
    UILabel * deslabel;
    
}
@end

@implementation SingleCommitCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        but_zan = [[UIButton alloc] init];
        namelabel = [[UILabel alloc] init];
        timelabel = [[UILabel alloc] init];
        imageView = [[UIImageView alloc] init];
        deslabel = [[UILabel alloc] init];
    }
    
     [self.contentView addSubview:but_zan];
     [self.contentView addSubview:namelabel];
     [self.contentView addSubview:timelabel];
     [self.contentView addSubview:imageView];
     [self.contentView addSubview:deslabel];
    
    return self;
}


-(void)setStr_image:(NSString *)str_image
{
    imageView.frame = CGRectMake(9*kFloatSize,0,41 *kFloatSize,41*kFloatSize);
    [imageView sd_setImageWithURL:[NSURL URLWithString:str_image] placeholderImage:[UIImage imageNamed:@""]];
    _str_image = str_image;
}

-(void)setStr_name:(NSString *)str_name
{
    namelabel.frame = CGRectMake(61 *kFloatSize , 0 ,50*kFloatSize ,14 *kFloatSize );
    _str_name = str_name;
}


-(void)setStr_time:(NSString *)str_time
{
    timelabel.frame = CGRectMake(namelabel.frame.size.width + namelabel.frame.origin.x, 0,120*kFloatSize ,14 *kFloatSize);

    _str_time = str_time;
}


-(void)setStr_des:(NSString *)str_des
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:10]};
    CGSize testsize = [str_des boundingRectWithSize:CGSizeMake(238 *kFloatSize, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading   attributes:attribute context:nil].size;
    
     deslabel.frame = CGRectMake(namelabel.frame.origin.x, 8*kFloatSize,238 *kFloatSize,testsize.height);
  
    _str_des =str_des;
}

-(void)setStr_zanNum:(NSString *)str_zanNum
{
    but_zan.frame = CGRectMake(271 *kFloatSize, deslabel.frame.origin.y + deslabel.frame.size.height, 27 *kFloatSize, 15 *kFloatSize);
    [but_zan setTitle:str_zanNum forState:UIControlStateNormal];
    _str_zanNum = str_zanNum;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
