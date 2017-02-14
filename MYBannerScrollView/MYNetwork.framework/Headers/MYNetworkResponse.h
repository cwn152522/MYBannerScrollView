//
//  MYNetworkResponse.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/8/5.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYTypeDefinitions.h"

@class MYResponedObj;

@interface MYNetworkResponse : NSObject

@property (assign, nonatomic) NSInteger requestId;
@property (nonatomic, assign) MYNetworkLinkStatus linkStatus;
@property (nonatomic, assign) MYNetworkResponseStatus status;
@property (nonatomic, assign) CGFloat progress;//eg.  0.01~1.00
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) MYResponedObj *content;

@end
