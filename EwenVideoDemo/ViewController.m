//
//  ViewController.m
//  EwenVideoDemo
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 Suomusic. All rights reserved.
//

#import "ViewController.h"
#import "EwenVideoView.h"
#define kScreenBounds ([[UIScreen mainScreen] bounds])
#define kScreenwidth (kScreenBounds.size.width)
#define kScreenheight (kScreenBounds.size.height)
#define KBL kScreenwidth/375
#define Window [[UIApplication sharedApplication].delegate window]

#import "KevinVideoDemo.h"
@interface ViewController ()
@property(nonatomic,strong)KevinVideoDemo *kevinVideo;
@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

- (void)viewDidLoad {
    [super viewDidLoad];
    EwenVideoView *ewenVideoVideo = [EwenVideoView avplayerViewWithVideoUrlStr:@"http://baobab.wdjcdn.com/1456459181808howtoloseweight_x264.mp4"];
    ewenVideoVideo.supView = self.view;
    [self.view addSubview:ewenVideoVideo];
    [ewenVideoVideo setPositionWithPortraitBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.height.mas_equalTo(211*KBL);
    } andLandscapeBlock:^(MASConstraintMaker *make) {
        make.center.equalTo(Window);
        make.width.mas_equalTo(kScreenheight);
        make.height.mas_equalTo(kScreenwidth);
    }];
    
    
    
    [self.view addSubview:self.kevinVideo];
    [self.kevinVideo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ewenVideoVideo.bottom).offset(30);
        make.left.right.mas_equalTo(0);
        make.height.equalTo(211);
    }];
}

- (KevinVideoDemo *)kevinVideo{
    if (!_kevinVideo) {
        _kevinVideo = [KevinVideoDemo new];
        _kevinVideo.videoUrlStr = @"http://baobab.wdjcdn.com/1456459181808howtoloseweight_x264.mp4";
    }
    return _kevinVideo;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
