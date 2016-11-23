//
//  ViewController.m
//  BreakpointDownload
//
//  Created by 吴斌清 on 2016/11/14.
//  Copyright © 2016年 winphonesoftware. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
#import "DownloadManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//开始
- (IBAction)start:(id)sender {
    NSString * downLoadUrl =  @"http://audio.xmcdn.com/group11/M01/93/AF/wKgDa1dzzJLBL0gCAPUzeJqK84Y539.m4a";
    
    [[DownloadManager sharedInstance]downLoadWithURL:downLoadUrl progress:^(float progress) {
        NSLog(@"###%f",progress);
        
    } success:^(NSString *fileStorePath) {
        NSLog(@"###%@",fileStorePath);
        
    } faile:^(NSError *error) {
        NSLog(@"###%@",error.userInfo[NSLocalizedDescriptionKey]);
    }];
}
//暂停下载
- (IBAction)stop:(id)sender {
    [[DownloadManager sharedInstance]stopTask];
}
//删除文件
- (IBAction)delete:(id)sender {
    [[DownloadManager sharedInstance] deleteFile];
}

@end
