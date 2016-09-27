//
//  Util.m
//  缓存01
//
//  Created by 优谱德 on 16/9/27.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "Util.h"

@implementation Util

#pragma mark - 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory{
    return NSTemporaryDirectory();
}

@end
