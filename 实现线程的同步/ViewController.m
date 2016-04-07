//
//  ViewController.m
//  实现线程的同步
//
//  Created by lx on 16/1/15.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSCondition *_condation;
    
   
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //创建一个线程
    _condation =[[NSCondition alloc]init];
    NSThread *thread =[[NSThread alloc]initWithTarget:self selector:@selector(threadAction) object:nil];
    
    [thread start];
    
    
    [self performSelector:@selector(mainThreadAction) withObject:self afterDelay:3];//这个是 主线程程里面的
    
    
    


}
//这个应该还是同步的关系,只是变一下同步的顺序.
-(void)threadAction{
  
    [_condation lock];//对线程所有的代码完成加锁
    [_condation wait];//线程等待消息;
    NSLog(@"==============");



}
-(void)mainThreadAction{
    
    NSLog(@"------------");
    [_condation signal];//发送消息
    
    
}
@end
