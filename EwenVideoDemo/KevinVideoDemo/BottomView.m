//
//  BottomView.m
//  EwenVideoDemo
//
//  Created by EwenMac on 2017/4/19.
//  Copyright © 2017年 Suomusic. All rights reserved.
//

#import "BottomView.h"
#import <Masonry.h>
@interface BottomView()



@end


@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.image = [UIImage imageNamed:@"EwenBottom"];
    self.userInteractionEnabled = YES;
    
    
    [self.leftTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(8);
        make.height.mas_equalTo(12);
    }];
    
    [self.fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.right.mas_equalTo(-8);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(12);
    }];
    
    [self.rightTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.right.equalTo(self.fullScreenButton.left).mas_offset(-8);
        make.height.mas_equalTo(12);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftTime.right).offset(8);
        make.centerY.equalTo(self.leftTime).offset(1);
        make.right.equalTo(self.rightTime.left).offset(-8);
        make.height.mas_equalTo(1);
    }];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftTime.right).offset(8);
        make.centerY.equalTo(self.leftTime);
        make.right.equalTo(self.rightTime.left).offset(-8);
        make.height.mas_equalTo(30);
    }];
    self.leftTime.text = @"--:--:--";
    self.rightTime.text = @"--:--:--";
}


#pragma mark --- 懒加载

- (UILabel *)leftTime{
    if (!_leftTime) {
        _leftTime = [UILabel new];
        _leftTime.textColor = [UIColor whiteColor];
        _leftTime.font = [UIFont systemFontOfSize:12];
        [self addSubview:_leftTime];
    }
    return _leftTime;
}

- (UILabel *)rightTime{
    if (!_rightTime) {
        _rightTime = [UILabel new];
        _rightTime.textColor = [UIColor whiteColor];
        _rightTime.font = [UIFont systemFontOfSize:12];
        [self addSubview:_rightTime];
    }
    return _rightTime;
}


- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [UIProgressView new];
        _progressView.progressViewStyle = UIProgressViewStyleDefault;
        _progressView.trackTintColor= [UIColor colorWithRed:135/255.f green:135/255.f blue:135/255.f alpha:1.0f];
        _progressView.progressTintColor= [UIColor whiteColor];
        _progressView.progress = 0;
        [self addSubview:_progressView];
    }
    return _progressView;
}

- (UISlider *)slider{
    if (!_slider) {
        _slider = [UISlider new];
        _slider.minimumValue = 0;
        _slider.maximumValue = 1;
        _slider.value = 0;
        _slider.minimumTrackTintColor = [UIColor redColor];
        _slider.maximumTrackTintColor = [UIColor clearColor];
//        _slider.thumbTintColor = [UIColor purpleColor];
        _slider.continuous = YES;
        [_slider setThumbImage:[UIImage imageNamed:@"video_dot"] forState:UIControlStateNormal];
        [_slider setThumbImage:[UIImage imageNamed:@"video_dot"] forState:UIControlStateHighlighted];
        [_slider addTarget:self action:@selector(valueChange:) forControlEvents:(UIControlEventValueChanged)];
        [self addSubview:_slider];
    }
    return _slider;
}

- (UIButton *)fullScreenButton{
    if (!_fullScreenButton) {
        _fullScreenButton = [UIButton new];
        [_fullScreenButton setBackgroundImage:[UIImage imageNamed:@"full_screen_open"] forState:UIControlStateNormal];
        [_fullScreenButton setBackgroundImage:[UIImage imageNamed:@"full_screen_open"] forState:UIControlStateHighlighted];
        [_fullScreenButton setBackgroundImage:[UIImage imageNamed:@"full_screen_close"] forState:UIControlStateSelected];
        [_fullScreenButton setBackgroundImage:[UIImage imageNamed:@"full_screen_close"] forState:UIControlStateHighlighted | UIControlStateSelected];
        [_fullScreenButton addTarget:self action:@selector(fullScreenClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_fullScreenButton];
        
    }
    return _fullScreenButton;
}

- (void)fullScreenClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.fullScreenBlock) {
        self.fullScreenBlock(sender.selected);
    }
}

#pragma mark - 根据秒数计算时间
- (NSString *)calculateTimeWithTimeFormatter:(long long)timeSecond{
    NSString * theLastTime = nil;
    if (timeSecond < 60) {
        theLastTime = [NSString stringWithFormat:@"00:%.2lld", timeSecond];
    }else if(timeSecond >= 60 && timeSecond < 3600){
        theLastTime = [NSString stringWithFormat:@"%.2lld:%.2lld", timeSecond/60, timeSecond%60];
    }else if(timeSecond >= 3600){
        theLastTime = [NSString stringWithFormat:@"%.2lld:%.2lld:%.2lld", timeSecond/3600, timeSecond%3600/60, timeSecond%60];
    }
    return theLastTime;
}



- (void)valueChange:(UISlider *)slider{
    
}





@end
