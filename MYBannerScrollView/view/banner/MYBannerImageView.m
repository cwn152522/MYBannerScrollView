//
//  MYBannerImageView.m
//  MYBannerScrollView
//
//  Created by 陈伟南 on 2016/10/21.
//  Copyright © 2016年 陈伟南. All rights reserved.
//

#import "MYBannerImageView.h"
#import "UIView+CWNView.h"
#import <MYNetwork/MYNetwork.h>

@interface MYBannerImageView () 

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation MYBannerImageView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _failImage = [UIImage imageNamed:@"morenbanner"];
        [self configUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        _failImage = [UIImage imageNamed:@"morenbanner"];
        [self configUI];
    }
    return self;
}

- (void)configUI{
    [self addSubview:self.scrollView];
    
    [_scrollView setLayoutLeftFromSuperViewWithConstant:0];
    [_scrollView setLayoutRightFromSuperViewWithConstant:0];
    [_scrollView setLayoutTopFromSuperViewWithConstant:0];
    [_scrollView setLayoutBottomFromSuperViewWithConstant:0];
    
    [_scrollView addSubview:self.imageView];
    
    _imageLeft = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [_scrollView addConstraint:_imageLeft];
    [_imageView setLayoutRightFromSuperViewWithConstant:0];
    [_imageView setLayoutTopFromSuperViewWithConstant:0];
    [_imageView setLayoutBottomFromSuperViewWithConstant:0];
    _imageHeight = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [_scrollView addConstraint:_imageHeight];
    _imageWidth = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [_scrollView addConstraint:_imageWidth];
}

- (void)loadImageWithImagePath:(NSString *)imagePath{
    if ([imagePath hasPrefix:@"http://"] || [imagePath hasPrefix:@"https://"]) {
        [self loadNetImageWithUrl:[NSURL URLWithString:imagePath]];
    } else {
        [self loadLocalImageWithName:imagePath];
    }
}

- (void)loadLocalImageWithName:(NSString *)name{
    [_imageView setImage:[UIImage imageNamed:name]];
    if(_imageView.image == nil)
        _imageView.image = _failImage;
}

- (void)loadNetImageWithUrl:(NSURL *)url{
    if(_imageView.image == nil)
        _imageView.image = _failImage;
    
    [[MYNetworkProxy defaultProxy] autoLoadImageWithURL:url placeholderImage:_failImage toImageView:_imageView];
    
//    UIImage *image = [[MYNetworkProxy defaultProxy] getImageIfExisted:url];
//    
//    if (image) {
//        [_imageView setImage:image];
//        return;
//    }
//        __weak typeof(self) weakSelf = self;
//        [[MYNetworkProxy defaultProxy] fetchImageWithURL:url withFetchResultBlock:^(UIImage *fetchImage, BOOL isCache) {
//         if(fetchImage != nil){
//                [weakSelf.imageView setImage:fetchImage];
//            }
//        }];
}

#pragma mark -Subviews

- (UIImageView *)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc] init];
        [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_imageView setUserInteractionEnabled:NO];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setBounces:NO];
        [_scrollView setScrollEnabled:NO];
        [_scrollView setUserInteractionEnabled:NO];
        [_scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _scrollView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
