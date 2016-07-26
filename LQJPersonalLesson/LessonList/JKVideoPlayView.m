//
//  JKVideoPlayView.m
//  LQJPersonalLesson
//
//  Created by Jiker on 2016/7/25.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "GlobalHeader.h"
#import "JKVideoPlayView.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>

@interface JKVideoPlayView()<UIAccelerometerDelegate>
{

}

//@property (nonatomic ,copy) 
@property (nonatomic ,copy) UIButton * firstPlayBut;
@property (nonatomic ,strong) AVPlayer *player;//播放器对象
@property (copy, nonatomic)  UIButton *playOrPause; //播放/暂停按钮
@property (copy, nonatomic)  UIProgressView *progress;//播放进度
@property (copy ,nonatomic) UIButton * fullscreenBut;//全屏按钮
@end

@implementation JKVideoPlayView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    [self buildUI];
    [self addGravity];
    return self;
}

#pragma mark --重力感应--
-(void)addGravity
{

    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    accelerometer.updateInterval = 1.0/60.0;
}


- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    static NSInteger shakeCount = 0;
    static NSDate *shakeStart;
    NSDate *now = [[NSDate alloc] init];
    NSDate *checkDate = [[NSDate alloc] initWithTimeInterval:1.5f sinceDate:shakeStart];
    if ([now compare:checkDate] == NSOrderedDescending || shakeStart == nil)
    {
        shakeCount = 0;
        shakeStart = [[NSDate alloc] init];
    }
  
    if (fabs(acceleration.x) > 2.0 || fabs(acceleration.y) > 2.0)
    {
        shakeCount++;
        if (shakeCount > 4)
        {
            //--DO Something
            
            
            shakeCount = 0;
            shakeStart = [[NSDate alloc] init];
        }
    }
}

#pragma mark ––UI相关–––
-(void)buildUI
{
    
    _player = [[AVPlayer alloc] init];
  
    
    _firstPlayBut = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.height/2 - 40, self.frame.size.width/2 -40, 80, 80)];
    [_firstPlayBut setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_firstPlayBut setTitle:@"播放" forState:UIControlStateNormal];
    [_firstPlayBut addTarget:self action:@selector(FirstPlayButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _firstPlayBut.tag = _playID;
    [self addSubview:_firstPlayBut];
    
    
    _playOrPause = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 50, 50, 50)];
    _playOrPause.backgroundColor = [UIColor whiteColor];
    _playOrPause.alpha = 0.8;
    
    [self addSubview:_playOrPause];
    _playOrPause.hidden = YES;
    
    [_playOrPause addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    _progress = [[UIProgressView alloc] initWithFrame:CGRectMake(0,self.frame.size.height - 5, self.frame.size.width - _playOrPause.frame.size.width, 5)];
    _progress.backgroundColor = [UIColor lightGrayColor];
    [_progress setTrackTintColor:[UIColor blueColor]];
    [self addSubview:_progress];
    _progress.hidden = YES;
    
    
    [self setupUI];
   // [self.player play];

    
    
}

-(void)dealloc{
    [self removeObserverFromPlayerItem:self.player.currentItem];
    [self removeNotification];
}

#pragma mark - 私有方法
-(void)setupUI{
    //创建播放器层
    AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame=self.frame;
    
    //playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;//视频填充模式
    [self.layer addSublayer:playerLayer];
}

/**
 
 *  截取指定时间的视频缩略图
 
 *  暂时未调用，后续改进
 
 *  @param timeBySecond 时间点
 
 */

-(void)thumbnailImageRequest:(CGFloat )timeBySecond{
    NSURL *url=[NSURL URLWithString:@""];
    AVURLAsset *urlAsset=[AVURLAsset assetWithURL:url];
    AVAssetImageGenerator *imageGenerator=[AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    
    
    NSError *error=nil;
    
    CMTime time=CMTimeMakeWithSeconds(timeBySecond, 10);//CMTime是表示电影时间信息的结构体，第一个参数是视频第几秒，第二个参数时每秒帧数.(如果要活的某一秒的第几帧可以使用CMTimeMake方法)
    
    CMTime actualTime;
    
    CGImageRef cgImage= [imageGenerator copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    if(error){
        
        NSLog(@"截取视频缩略图时发生错误，错误信息：%@",error.localizedDescription);
        
        return;
        
    }
    
    CMTimeShow(actualTime);
    
    UIImage *image=[UIImage imageWithCGImage:cgImage];
    UIImageWriteToSavedPhotosAlbum(image,nil, nil, nil);
    
    CGImageRelease(cgImage);
    
}

/**
 *  初始化播放器
 *
 *  @return 播放器对象
 */
-(AVPlayer *)player{
    if (!_player) {
        AVPlayerItem *playerItem=[self getPlayItem:0];
        _player=[AVPlayer playerWithPlayerItem:playerItem];
        [self addProgressObserver];
        [self addObserverToPlayerItem:playerItem];
    }
    return _player;
}

-(AVPlayerItem *)getPlayItem:(int)videoIndex{
    NSString *urlStr=[NSString stringWithFormat:@"http://192.168.1.161/%i.mp4",videoIndex];
    //stringByAddingPercentEncodingWithAllowedCharacters:
    urlStr =[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url=[NSURL URLWithString:urlStr];
    AVPlayerItem *playerItem=[AVPlayerItem playerItemWithURL:url];
    return playerItem;
}
#pragma mark - 通知
-(void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
}

#pragma mark - 监控

-(void)addProgressObserver{
    AVPlayerItem *playerItem=self.player.currentItem;
    UIProgressView *progress=self.progress;
    
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current=CMTimeGetSeconds(time);
        float total=CMTimeGetSeconds([playerItem duration]);
        NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
            [progress setProgress:(current/total) animated:YES];
        }
    }];
}


-(void)addObserverToPlayerItem:(AVPlayerItem *)playerItem{
    //监控状态属性，注意AVPlayer也有一个status属性，通过监控它的status也可以获得播放状态
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:@"status"];
    [playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
/**
 *  通过KVO监控播放器状态
 *
 *  @param keyPath 监控属性
 *  @param object  监视器
 *  @param change  状态改变
 *  @param context 上下文
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    AVPlayerItem *playerItem=object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
        if(status==AVPlayerStatusReadyToPlay){
            NSLog(@"正在播放...，视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array=playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;        NSLog(@"共缓冲：%.2f",totalBuffer);
        
    }
}

#pragma mark - UI事件
- (void)playClick:(UIButton *)sender {
    
    if(self.player.rate==0){
        [sender setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
        [self.player play];
    }else if(self.player.rate==1){
        [self.player pause];
        [sender setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
    }
}

- (void)FirstPlayButtonClick:(UIButton *)playbut
{
    [self removeNotification];
    [self removeObserverFromPlayerItem:self.player.currentItem];
    AVPlayerItem *playerItem=[self getPlayItem:(int)playbut.tag];
    [self addObserverToPlayerItem:playerItem];
    //切换视频
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    [self addNotification];
}


-(void)fullScreenit
{

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
