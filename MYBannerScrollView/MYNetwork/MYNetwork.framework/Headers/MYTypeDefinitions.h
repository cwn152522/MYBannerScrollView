//
//  MYTypeDefinitions.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/8/16.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#ifndef MYTypeDefinitions_h
#define MYTypeDefinitions_h

typedef NS_ENUM(NSInteger, MYNetworkTaskType){
    MYNetworkTaskTypeData,
    MYNetworkTaskTypeUpload,
    MYNetworkTaskTypeDownload
};

typedef NS_ENUM(NSUInteger, MYNetworkLinkStatus) {
    MYNetworkLinkStatusUnknown,              //未知
    MYNetworkLinkStatusNotReachable,      //无连接
    MYNetworkLinkStatusWifi,                      //Wifi
    MYNetworkLinkStatusCellular                 //蜂窝
};
typedef NS_ENUM(NSUInteger, MYNetworkResponseStatus) {
    MYNetworkResponseStatusSuccessed,
    MYNetworkResponseStatusDowning,
    MYNetworkResponseStatusUploading,
    MYNetworkResponseStatusCancelled,
    MYNetworkResponseStatusFailed
};

#endif /* MYTypeDefinitions_h */
