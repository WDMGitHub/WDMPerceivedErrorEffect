//
//  DMPerceivedErrorCell.m
//  DMPerceivedErrorEffect
//
//  Created by demin on 16/8/8.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "DMPerceivedErrorCell.h"

static NSString *const DMPerceivedErrorID = @"PerceivedErrorID";

@implementation DMPerceivedErrorCell

+ (instancetype)perceivedErrorCellFromXib:(UITableView *)tableView {
    DMPerceivedErrorCell *cell = [tableView dequeueReusableCellWithIdentifier:DMPerceivedErrorID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view {
    //将cell的frame转换成view的Frame(为了获取每个cell的Y值)
    CGRect rect = [tableView convertRect:self.frame toView:view];
    
    //视图的frame的一半 减去 所看到的每个CellY值(获取滚动的值)
    //以屏幕中心点为0点 获取能看到的每个Cell离中心点得值是多少
    float distanceCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rect);
    
    //图片高度 - cell的高度 (获取图片超出cell高度部分)图片肯定要比cell大，否则不会有视觉差效果
    float difference = CGRectGetHeight(self.backgroundImage.frame) - CGRectGetHeight(self.frame);
    
    float imageMove = (distanceCenter / CGRectGetHeight(view.frame)) * difference;
    
    //旧的图片Frame
    CGRect imageRect = self.backgroundImage.frame;
    
    //移动
    imageRect.origin.y = imageMove - (difference/2);
    
    //新的图片Frame
    self.backgroundImage.frame = imageRect;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //cell超出部分不显示
    self.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
