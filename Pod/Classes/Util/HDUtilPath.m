//
//  HDUtilPath.m
//  Pods
//
//  Created by Dailingchi on 15/10/15.
//
//

#import "HDUtilPath.h"
#include <sys/xattr.h>

@implementation HDUtilPath

static NSString *appPath = nil;
static NSString *documentPath = nil;
static NSString *libPrefPath = nil;
static NSString *libCachePath = nil;
static NSString *tmpPath = nil;
static NSString *cachePath = nil;

+ (NSString *)appDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSArray *paths =
          NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
      appPath = paths[0];
    });
    return appPath;
}

+ (NSString *)documentDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSArray *paths =
          NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
      documentPath = paths[0];
    });
    return documentPath;
}

+ (NSString *)libPrefDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSArray *paths =
          NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
      libPrefPath = [paths[0] stringByAppendingString:@"/Preference"];
      ;
    });
    return libPrefPath;
}

+ (NSString *)libCacheDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSArray *paths =
          NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
      libCachePath = [paths[0] stringByAppendingString:@"/Caches"];
      ;
    });
    return libCachePath;
}

+ (NSString *)tmpDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSArray *paths =
          NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
      tmpPath = [paths[0] stringByAppendingString:@"/tmp"];
      ;
    });
    return tmpPath;
}

+ (NSString *)cacheDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSArray *cache =
          NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
      cachePath = cache[0];
    });
    return cachePath;
}

+ (NSString *)filePathInDocument:(NSString *)filename
{
    return [self filePathInBundle:[NSBundle bundleWithPath:[self documentDirectory]]
                         fileName:filename];
}

+ (NSString *)filePathInCacheDirectory:(NSString *)filename
{
    return
        [self filePathInBundle:[NSBundle bundleWithPath:[self cacheDirectory]] fileName:filename];
}

+ (NSString *)filePathInMainBundle:(NSString *)filename
{
    return [self filePathInBundle:[NSBundle mainBundle] fileName:filename];
}

+ (NSString *)filePathInBundle:(NSBundle *)bundle fileName:(NSString *)filename
{
    if (filename != nil && bundle != nil)
    {
        NSArray *keywords = [filename componentsSeparatedByString:@"."];
        NSString *suffix = keywords[[keywords count] - 1];
        NSUInteger length = [filename length] - [suffix length];
        NSString *path;
        //修复没有后缀名的情况
        if (length > 0)
        {
            path = [bundle pathForResource:[filename substringToIndex:length - 1] ofType:suffix];
        }
        else
        {
            path = [bundle pathForResource:filename ofType:@""];
        }
        return path;
    }
    return nil;
}

+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path
{
    NSURL *url = [NSURL fileURLWithPath:path];

    const char *filePath = [[url path] fileSystemRepresentation];
    const char *attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}

+ (BOOL)touch:(NSString *)path
{
    if (NO == [[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:YES
                                                          attributes:nil
                                                               error:NULL];
    }
    return NO;
}

+ (BOOL)moveItemAtPath:(NSString *)sourcePath toPath:(NSString *)destionPath error:(NSError *)error
{
    [[NSFileManager defaultManager] moveItemAtPath:sourcePath toPath:destionPath error:&error];
    if (error)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

+ (BOOL)copyItemAtPath:(NSString *)sourcePath toPath:(NSString *)destionPath error:(NSError *)error
{
    [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destionPath error:&error];
    if (error)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

+ (BOOL)removeItemAtPath:(NSString *)sourcePath error:(NSError *)error
{
    [[NSFileManager defaultManager] removeItemAtPath:sourcePath error:&error];
    if (error)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

@end
