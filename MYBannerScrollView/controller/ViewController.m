//
//  ViewController.m
//  MYBannerScrollView
//
//  Created by 陈伟南 on 2016/10/21.
//  Copyright © 2016年 陈伟南. All rights reserved.
//

#import "ViewController.h"
#import "MYBannerScrollView.h"

@interface ViewController ()<MYBannerScrollViewDelegate, UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) MYBannerScrollView *bannerview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (void)didClickScrollView:(NSInteger)pageIndex{
    NSLog(@"%ld", pageIndex);
}

#pragma mark UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"df"];
    if(cell == nil){
        cell = [[UITableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"df"];
    }
    [cell.textLabel setText:@"fadsf"];
    return cell;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_bannerview scrollViewDidScroll:_tableView];
}

@end
