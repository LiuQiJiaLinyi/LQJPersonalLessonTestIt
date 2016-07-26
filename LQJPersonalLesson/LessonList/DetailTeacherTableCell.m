//
//  DetailCourseTableCell.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/26.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "DetailTeacherTableCell.h"

@interface DetailTeacherTableCell()
{
    UILabel * titlelabel;
    UILabel *timelabel;
    UILabel *deslabel;
    UIImageView * image;
    

}
@end

@implementation DetailTeacherTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    
    return self;
}

-(void)buildUI
{
    titlelabel = [[UILabel alloc] init];
    timelabel = [[UILabel alloc] init];
    deslabel = [[UILabel alloc] init];
    image =[[UIImageView alloc] init];

}


-(void)setTitle_str:(NSString *)title_str
{
    
    _title_str = title_str;
}

-(void)setDes_str:(NSString *)des_str
{
    _des_str = des_str;
}

-(void)setPlayTime_str:(NSString *)playTime_str
{
    _playTime_str = playTime_str;
}

-(void)setIamge_str:(NSString *)iamge_str
{
    _iamge_str = iamge_str;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
