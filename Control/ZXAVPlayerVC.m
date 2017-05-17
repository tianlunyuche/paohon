//
//  ZXAVPlayerVC.m
//  Control
//
//  Created by xinying on 2017/5/17.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import "ZXAVPlayerVC.h"
#import <AVFoundation/AVFoundation.h>
#import "MediaPlayer/MediaPlayer.h"

@interface ZXAVPlayerVC ()<MPMediaPickerControllerDelegate,AVAudioPlayerDelegate>
{
    
    //音频播放器对象
    AVAudioPlayer* _player;
    UIProgressView* _musicProgress;
}

//音频播放器
@property(nonatomic,retain)AVAudioPlayer* avPlay;
@property(nonatomic,strong)UIButton* btnPlay;
@property(nonatomic,strong)UIButton* btnPause;
@property(nonatomic,strong)UIButton* btnStop;
@property(nonatomic,strong)UISlider* volumeSlider;

//音乐播放进度条视图
@property(nonatomic,strong)UIProgressView* musicProgress;
//定时器对象
@property(nonatomic,strong)NSTimer* protimer;

@property(nonatomic,strong)NSTimer* timer;
@end

@implementation ZXAVPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self creatAVPlayer];
        [self playAV];
    
}

#pragma mark - 播放音乐 和进度条
//创建一个音频控制器
- (void)creatAVPlayer{
    
    //设置后台仍运行
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    //获取本地资源mp3文件的方法。，文件名 和扩展名
    NSString* str =[[NSBundle mainBundle] pathForResource:@"许巍 - 温暖" ofType:@"mp3"];
    //将字符串转化成 url
    NSURL* urlMusic =[NSURL fileURLWithPath:str];
    //创建音频播放器对象
    _player =[[AVAudioPlayer alloc] initWithContentsOfURL:urlMusic error:nil];
    //
    [_player prepareToPlay];
    //循环播放的次数 ，-1 无限循环
    _player.numberOfLoops =-1;
    //设置音量大小
    _player.volume =0.5;
    
    _player.delegate =self;
}

//按钮
- (void)playAV{
    //播放 按钮
    _btnPlay =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPlay.frame =CGRectMake(100, 100, 100, 40);
    [_btnPlay setTitle:@"播放" forState:UIControlStateNormal];
    [_btnPlay addTarget:self action:@selector(pressPlay) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPlay];
    //暂停 按钮
    _btnPause =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPause.frame =CGRectMake(100, 160, 100, 40);
    [_btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    [_btnPause addTarget:self action:@selector(pressPause) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPause];
    //停止 按钮
    _btnStop =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnStop.frame =CGRectMake(100, 220, 100, 40);
    [_btnStop setTitle:@"停止" forState:UIControlStateNormal];
    [_btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnStop];
    //进度条  ,initWithProgressViewStyle:UIProgressViewStyleBar]
    _musicProgress =[[UIProgressView alloc] init];
    _musicProgress.frame =CGRectMake(10, 300, 300, 20);
    _musicProgress.progress =0;
    
    UILabel *labl=[[UILabel alloc] initWithFrame:CGRectMake(10, 318, 100, 40)];
    labl.text =@"调节音量：";
    [self.view addSubview:labl];
    //滑动块 设置声音大小
    _volumeSlider =[[UISlider alloc] initWithFrame:CGRectMake(10, 360, 300, 40)];
    _volumeSlider.maximumValue =100;
    _volumeSlider.minimumValue =0;
    //
    [_volumeSlider addTarget:self action:@selector(volumChange:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_musicProgress];
    [self.view addSubview:_volumeSlider];
}

- (void)pressPlay{
    NSLog(@"播放音乐");
    [_player play];
    //
    _protimer =[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateT) userInfo:nil repeats:YES];
}

- (void)pressPause{
    NSLog(@"暂停");
    [_player pause];
}

- (void)pressStop{
    NSLog(@"停止播放");
    [_player stop];
    //当前播放事件清零
    _player.currentTime =0;
}

- (void)volumChange:(UISlider *)slider{
    NSLog(@"%f",slider.value );
    //    _musicProgress.progress = slider.value /100;
    //
    _player.volume =slider.value /100;
}

- (void)updateT{
    
    _musicProgress.progress = _player.currentTime / _player.duration ;
}

//当播放完成时调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    //停止定时器
    [_timer invalidate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
