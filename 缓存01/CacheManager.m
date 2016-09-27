//
//  CacheManager.m
//  缓存01
//
//  Created by 优谱德 on 16/9/27.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager


+ (CacheManager *)sharedManager {
    
    static CacheManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
    
}

- (NSMutableArray *)getModelArrayFromPath:(NSString *)path withName:(NSString *)name {

    NSString *cachePath = [NSString stringWithFormat:@"%@/%@", path, name];
    
    NSMutableArray *mut_arr;
    
    mut_arr = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
    
    return mut_arr;
}

// 缓存到本地
- (BOOL)cacheModelArray:(NSMutableArray *)modelArr toPath:(NSString *)path withName:(NSString *)name {
    
    
    NSString *cachePath = [NSString stringWithFormat:@"%@/%@", path, name];
    
    [NSKeyedArchiver archiveRootObject:modelArr toFile:cachePath];
    
    return YES;
}

- (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath{
    
    //获得全部文件数组
    NSArray *fileAry =  [self getAllFileNames:dirPath];
    //遍历数组
    BOOL flag = NO;
    for (NSString *fileName in fileAry) {
        NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
        flag = [self clearCachesWithFilePath:filePath];
        
        if (!flag)
            break;
    }
    
    return flag;
}

- (BOOL)clearCachesWithFilePath:(NSString *)path{
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    return [mgr removeItemAtPath:path error:nil];
}


- (NSArray *)getAllFileNames:(NSString *)dirPath{
    
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
    return files;
}

@end
