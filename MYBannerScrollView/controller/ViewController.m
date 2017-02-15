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

#pragma mark MYBannerScrollViewDelegate

- (void)bannerScrollView:(MYBannerScrollView *)bannerScrollView didClickScrollView:(NSInteger)pageIndex{
    NSString *message = [NSString stringWithFormat:@"点击了bannerScrollView:%p 的第%ld张图片",&bannerScrollView ,pageIndex];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:cancel];
    [self presentViewController:controller animated:YES completion:nil];
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
            NSString *imageURL1 = @"http://www.uc129.com/uploads/allimg/150428/1-15042Q04030.jpg";
            [cell loadTableViewCellWithBannerImages:@[imageURL1]];
        }
            break;
        case 1:{
            NSString *imageURL1 = @"http://www.uc129.com/uploads/allimg/150428/1-15042Q04030.jpg";
            NSString *imageURL2 = @"http://www.people.com.cn/h/pic/20111031/99/15317457967897249011.jpg";
            [cell loadTableViewCellWithBannerImages:@[imageURL1, imageURL2]];
        }
            break;
        case 2:{
            NSString *imageURL1 = @"http://www.uc129.com/uploads/allimg/150428/1-15042Q04030.jpg";
            NSString *imageURL2 = @"http://www.people.com.cn/h/pic/20111031/99/15317457967897249011.jpg";
            NSString *imageURL3 = @"http://school.indexedu.com/data/uploads/picture/westminster_1/20140117144515.jpg";
            [cell loadTableViewCellWithBannerImages:@[imageURL1, imageURL2, imageURL3]];
        }
            break;
        case 3:{
            NSString *imageURL2 = @"http://www.people.com.cn/h/pic/20111031/99/15317457967897249011.jpg";
            NSString *imageURL3 = @"http://school.indexedu.com/data/uploads/picture/westminster_1/20140117144515.jpg";
            [cell loadTableViewCellWithBannerImages:@[ imageURL2, imageURL3]];
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

@end
