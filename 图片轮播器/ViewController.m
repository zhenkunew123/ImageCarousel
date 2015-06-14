//
//  ViewController.m
//  图片轮播器
//
//  Created by osx on 15/6/11.
//  Copyright (c) 2015年 osx. All rights reserved.
//

#import "ViewController.h"
#import "ZKImageView.h"

@interface ViewController ()

@property (nonatomic, weak) ZKImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZKImageView *imageView = [[ZKImageView alloc] init];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(100, 100, 200, 100);
    imageView.backgroundColor = [UIColor orangeColor];
    self.iconView = imageView;
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        NSString *strImage = [NSString stringWithFormat:@"%02d.jpg", i + 1];
        UIImage *image = [UIImage imageNamed:strImage];
        [arrayM addObject:image];
    }
    imageView.arrayImage = arrayM.copy;

}
- (IBAction)right {
    [self.iconView left];
}

- (IBAction)left {
    [self.iconView right];
}

@end
