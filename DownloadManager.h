//
//  DownloadManager.h
//  BreakpointDownload
//
//  Created by 吴斌清 on 2016/11/14.
//  Copyright © 2016年 winphonesoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock) (NSString *fileStorePath);
typedef void (^faileBlock) (NSError *error);
typedef void (^progressBlock) (float progress);

@interface DownloadManager : NSObject<NSURLSessionDataDelegate>

@property (copy) successBlock  successBlock;
@property (copy) faileBlock      failedBlock;
@property (copy) progressBlock    progressBlock;

-(void)downLoadWithURL:(NSString *)URL
              progress:(progressBlock)progressBlock
               success:(successBlock)successBlock
                 faile:(faileBlock)faileBlock;

+ (instancetype)sharedInstance;

-(void)stopTask;

-(void)deleteFile;

@end
