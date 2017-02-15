//
//  MYTableViewCell.h
//  MYBannerScrollView
//
//  Created by 伟南 陈 on 2017/2/14.
//  Copyright © 2017年 陈伟南. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYBannerScrollView;

@protocol MYTableViewCellDelegate <NSObject>

- (void)bannerScrollView:(MYBannerScrollView *)bannerScrollView didClickScrollView:(NSInteger)pageIndex;

@end

@interface MYTableViewCell : UITableViewCell

@property (assign, nonatomic) id <MYTableViewCellDelegate> delegate;

- (void)loadTableViewCellWithBannerImages:(NSArray *)images indexPath:(NSIndexPath *)indexPath;

@end
