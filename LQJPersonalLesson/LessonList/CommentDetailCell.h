//
//  CommentDetailCell.h
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/25.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentDetailCell : UITableViewCell

@property (nonatomic ,copy) UIButton * but_zan;
@property (nonatomic ,copy) UIButton * but_commit;
@property (nonatomic ,copy) NSString * str_name;
@property (nonatomic ,copy) NSString * str_imageURL;
@property (nonatomic ,copy) NSString * str_time;
@property (nonatomic ,copy) NSString * str_des;
@property (nonatomic ,copy) NSString * str_commitNum;
@property (nonatomic ,copy) NSString * str_zanNum;
@end
