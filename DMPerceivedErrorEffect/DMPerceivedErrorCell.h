//
//  DMPerceivedErrorCell.h
//  DMPerceivedErrorEffect
//
//  Created by demin on 16/8/8.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMPerceivedErrorCell : UITableViewCell

/**
 *  背景图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

/**
 *  Xib创建cell
 */
+ (instancetype)perceivedErrorCellFromXib:(UITableView *)tableView;

/**
 *  背景图片y值设置
 */
- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view;



@end
