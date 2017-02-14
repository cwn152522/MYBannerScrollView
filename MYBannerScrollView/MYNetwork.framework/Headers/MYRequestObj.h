//
//  MYURLRequestObj.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/8/5.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYRequestObj : NSObject

@property (copy, nonatomic) NSString *hostName;//eg. "http://192.168.1.69:8888"
@property (copy, nonatomic) NSString *path;//eg. "/a/b/c"
@property (strong, nonatomic) NSDictionary *paramsDic;

@end
