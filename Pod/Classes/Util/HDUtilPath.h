//
//  HDUtilPath.h
//  Pods
//
//  Created by Dailingchi on 15/10/15.
//
//

#import <Foundation/Foundation.h>

@interface HDUtilPath : NSObject

#pragma mark
#pragma mark Directory
/**
 *  程序目录，只读
 *
 *  @return appDirectory
 */
+ (NSString *)appDirectory;

/**
 *  文档目录，需要ITUNES同步备份的数据存这里
 *
 *  @return documentDirectory
 */
+ (NSString *)documentDirectory;

/**
 *  配置目录，配置文件存这里
 *
 *  @return libPrefDirectory
 */
+ (NSString *)libPrefDirectory;

/**
 *  缓存目录，系统永远不会删除这里的文件，ITUNES会删除
 *
 *  @return libCacheDirectory
 */
+ (NSString *)libCacheDirectory;

/**
 *  缓存目录，APP退出后，系统可能会删除这里的内容
 *
 *  @return tmpDirectory
 */
+ (NSString *)tmpDirectory;

/**
 *  程序缓存目录
 *
 *  @return cacheDirectory
 */
+ (NSString *)cacheDirectory;

#pragma mark
#pragma mark FilePath

/**
 *  文件在文档中的路径
 *
 *  @param filename 文件名
 *
 *  @return filePathInDocument
 */
+ (NSString *)filePathInDocument:(NSString *)filename;

/**
 *  文件在app中的路径
 *
 *  @param filename 文件名
 *
 *  @return filePathInMainBundle
 */
+ (NSString *)filePathInMainBundle:(NSString *)filename;

/**
 *  文件在Cache中的路径
 *
 *  @param filename 文件名
 *
 *  @return filePathInCacheDirectory
 */
+ (NSString *)filePathInCacheDirectory:(NSString *)filename;

/**
 *  文件在指定bundle下面的路径
 *
 *  @param bundle   指定查询的bundle
 *  @param filename 文件名(含后缀)
 *
 *  @return 如果文件存在返回文件路径，反之nil
 */
+ (NSString *)filePathInBundle:(NSBundle *)bundle fileName:(NSString *)filename;

#pragma mark
#pragma mark Action

/**
 *  给文件加上不能被系统删除的标志
 *
 *  @param path path
 *
 *  @return YES is ok.
 */
+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path;

/**
 *  创建文件夹
 *
 *  @param path 待创建的文件夹路径
 *
 *  @return success is YES
 */
+ (BOOL)touch:(NSString *)path;

/**
 *  移动文件(未检查文件是否存在)
 *
 *  @param sourcePath  源文件路径
 *  @param destionPath 目标文件路径
 *  @param error       错误信息
 *
 *  @return YES is ok.
 */
+ (BOOL)moveItemAtPath:(NSString *)sourcePath toPath:(NSString *)destionPath error:(NSError *)error;

/**
 *  拷贝文件(未检查文件是否存在)
 *
 *  @param sourcePath  源文件路径
 *  @param destionPath 目标文件路径
 *  @param error       错误信息
 *
 *  @return YES is ok.
 */
+ (BOOL)copyItemAtPath:(NSString *)sourcePath toPath:(NSString *)destionPath error:(NSError *)error;

/**
 *  删除文件(未检查文件是否存在)
 *
 *  @param sourcePath  源文件路径
 *  @param error       错误信息
 *
 *  @return YES is ok.
 */
+ (BOOL)removeItemAtPath:(NSString *)sourcePath error:(NSError *)error;

@end
