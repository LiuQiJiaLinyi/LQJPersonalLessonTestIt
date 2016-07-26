//
//  HotTeacherTableViewCell.h
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/21.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotTeacherTableViewCell : UITableViewCell

@property (nonatomic ,copy)NSString * str_name;

/*!
 *  @author LiuQiJia, 16-07-21 15:07:38
 *
 *  @brief 所传字符串必须为完整的URL的NSString
 */
@property (nonatomic ,copy)NSString * str_iamgeURL;
@property (nonatomic ,copy)NSString * str_jobDes;
@end
