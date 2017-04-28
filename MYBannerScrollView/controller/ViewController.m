//
//  ViewController.m
//  MYBannerScrollView
//
//  Created by 陈伟南 on 2016/10/21.
//  Copyright © 2016年 陈伟南. All rights reserved.
//

#import "ViewController.h"
#import "MYBannerScrollView.h"
#import "MYTableViewCell.h"

static NSInteger const kHeaderBannerTag = 100;

static NSString *const kCellIdentifier = @"cellIdentifier";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate, MYBannerScrollViewDelegate, MYTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) MYBannerScrollView *bannerview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MYTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    NSString *imageURL1 = @"http://www.uc129.com/uploads/allimg/150428/1-15042Q04030.jpg";
    NSString *imageURL2 = @"http://www.people.com.cn/h/pic/20111031/99/15317457967897249011.jpg";
    NSString *imageURL3 = @"http://school.indexedu.com/data/uploads/picture/westminster_1/20140117144515.jpg";
    //    NSString *imageURL1 = @"morenbanner";
    //    NSString *imageURL2 = @"morenbanner";
    //    NSString *imageURL3 = @"morenbanner";
    
    _bannerview = [[MYBannerScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 164*[[UIScreen mainScreen] bounds].size.width/360)];
    _bannerview.tag = kHeaderBannerTag;
    [_bannerview setAutoDuration:5];
    [_bannerview setDelegate:self];
    [_bannerview setUseVerticalParallaxEffect:YES];
    [_bannerview setUseScaleEffect:YES];
    [_bannerview loadImages:@[imageURL1, imageURL2, imageURL3] estimateSize:_bannerview.frame.size];
    _tableView.tableHeaderView = _bannerview;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MYTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if(cell == nil){
        cell = [[MYTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    cell.delegate = self;
    
    switch (indexPath.section) {
        case 0:{
            NSString *imageURL1 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134029763&di=ce2437d6fd0a85764a98113ee2ddf8f9&imgtype=0&src=http%3A%2F%2Fpic15.nipic.com%2F20110630%2F6322714_105943746342_2.jpg";
            [cell loadTableViewCellWithBannerImages:@[imageURL1] indexPath:indexPath];
        }
            break;
        case 1:{
            NSString *imageURL1 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134414804&di=e6a9da6f968e8191242cb89923aae082&imgtype=0&src=http%3A%2F%2Fpic15.nipic.com%2F20110630%2F6322714_105550198325_2.jpg";
            NSString *imageURL2 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134436807&di=42edc2de0903bc61b9bd625926af279c&imgtype=0&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Ff4%2F193%2Fd%2F68.jpg";
            [cell loadTableViewCellWithBannerImages:@[imageURL1, imageURL2] indexPath:indexPath];
        }
            break;
        case 2:{
            NSString *imageURL1 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487729627&di=43dfcde2b73c3f6f7c6d23c5756187e4&imgtype=jpg&er=1&src=http%3A%2F%2Fpic23.photophoto.cn%2F20120612%2F0017030514492519_b.jpg";
            NSString *imageURL2 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134907999&di=01f7e2ccbe92393b0aaef35d113223aa&imgtype=0&src=http%3A%2F%2Fpic29.nipic.com%2F20130604%2F12681368_124021067307_2.jpg";
            NSString *imageURL3 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134929255&di=7f30a3d4d7f8bca5c23c541905cf6d85&imgtype=0&src=http%3A%2F%2Fimgtu.5011.net%2Fuploads%2Fcontent%2F20170206%2F2719281486364569.jpg";
            [cell loadTableViewCellWithBannerImages:@[imageURL1, imageURL2, imageURL3] indexPath:indexPath];
        }
            break;
        case 3:{
            NSString *imageURL2 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134929255&di=2295593e18fa69894bb6eb48a7a45174&imgtype=0&src=http%3A%2F%2Fpic5.nipic.com%2F20100106%2F3054095_164903077256_2.jpg";
            NSString *imageURL3 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487134929254&di=89773732a7f43fcdfda4e45db1aa7f80&imgtype=0&src=http%3A%2F%2Fpic9.nipic.com%2F20100830%2F152032_104612072376_2.jpg";
            [cell loadTableViewCellWithBannerImages:@[ imageURL2, imageURL3] indexPath:indexPath];
        }
            break;
        default:
            break;
    }

    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_bannerview scrollViewDidScroll:_tableView];
}

#pragma mark MYBannerScrollViewDelegate

- (void)bannerScrollView:(MYBannerScrollView *)bannerScrollView didClickScrollView:(NSInteger)pageIndex{
    NSString *message;
    switch (bannerScrollView.tag) {
        case kHeaderBannerTag:{
            message = [NSString stringWithFormat:@"点击了头部视图的bannerScrollView的第%ld张图片" ,pageIndex];
        }
            break;
            
        default:{
            message = [NSString stringWithFormat:@"点击了第%ld个section的bannerScrollView的第%ld张图片", bannerScrollView.tag ,pageIndex];
        }
            break;
    }
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:cancel];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
