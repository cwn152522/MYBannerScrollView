//
//  MYTableViewCell.m
//  MYBannerScrollView
//
//  Created by 伟南 陈 on 2017/2/14.
//  Copyright © 2017年 陈伟南. All rights reserved.
//

#import "MYTableViewCell.h"
#import "UIView+CWNView.h"
#import "MYBannerScrollView.h"

@interface MYTableViewCell ()<MYBannerScrollViewDelegate>

@property (strong, nonatomic) MYBannerScrollView *bannerview;

@end

@implementation MYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self.contentView addSubview:self.bannerview];
    }
    return self;
}

#pragma mark 控件get方法

- (MYBannerScrollView *)bannerview{
    if(!_bannerview){
        _bannerview = [[MYBannerScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 200)];
        [_bannerview setAutoDuration:5];
        [_bannerview setDelegate:self];
    }
    return _bannerview;
}

#pragma mark public methods

- (void)loadTableViewCellWithBannerImages:(NSArray *)images indexPath:(NSIndexPath *)indexPath{
    _bannerview.tag = indexPath.section;
    [_bannerview loadImages:images estimateSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 200)];
}

#pragma mark MYBannerScrollViewDelegate

- (void)bannerScrollView:(MYBannerScrollView *)bannerScrollView didClickScrollView:(NSInteger)pageIndex{
    NSLog(@"点击了bannerScrollView:%p 的第%ld张图片",&bannerScrollView ,pageIndex);
    if(self.delegate){
        [self.delegate bannerScrollView:bannerScrollView didClickScrollView:pageIndex];
    }
}


@end
