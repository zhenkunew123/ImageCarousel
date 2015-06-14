//
//  ZKImageView.m
//  图片轮播器
//
//  Created by osx on 15/6/11.
//  Copyright (c) 2015年 osx. All rights reserved.
//

#import "ZKImageView.h"

@interface ZKImageView ()

@property (nonatomic, strong) NSMutableArray *arrayM;
@property (nonatomic, assign) BOOL moving;

@end

@implementation ZKImageView

- (void)orderImageViews {
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    UIImageView *image = self.arrayM[0];
    UIImageView *image1 = self.arrayM[1];
    UIImageView *image2 = self.arrayM[2];

    image.frame = CGRectMake(-w, 0, w, h);
    image1.frame = CGRectMake(0, 0, w, h);
    image2.frame = CGRectMake(w, 0, w, h);
    
    [self bringSubviewToFront:image1];
}

- (instancetype)init
{
    if (self = [super init]) {
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(left)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipeLeft];
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(right)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:swipeRight];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)right {
    
    if (self.moving) return;
    self.moving = YES;
    self.index--;
        [self.arrayM exchangeObjectAtIndex:1 withObjectAtIndex:2];
        [self.arrayM exchangeObjectAtIndex:0 withObjectAtIndex:1];
        self.index = (int)(self.index + self.arrayImage.count) % self.arrayImage.count;
    UIImageView *image1 = self.arrayM[1];
        image1.image = self.arrayImage[self.index];
    [UIView animateWithDuration:0.5 animations:^{
        [self orderImageViews];
    } completion:^(BOOL finished) {
        self.moving = NO;
    }];
}

- (void)left {
    
    if (self.moving) return;
    self.moving = YES;
    self.index++;
    [self.arrayM exchangeObjectAtIndex:0 withObjectAtIndex:1];
    [self.arrayM exchangeObjectAtIndex:1 withObjectAtIndex:2];
    self.index = (int)(self.index + self.arrayImage.count) % self.arrayImage.count;
    UIImageView *image1 = self.arrayM[1];
    
    image1.image = self.arrayImage[self.index];
    [UIView animateWithDuration:0.5 animations:^{
        [self orderImageViews];
    } completion:^(BOOL finished) {
        self.moving = NO;
    }];
}

- (NSMutableArray *)arrayM {
    if (_arrayM == nil) {
        _arrayM = [NSMutableArray array];
        for (int i = 0; i<3; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self addSubview:imageView];
            [_arrayM addObject:imageView];
        }
    }
    return _arrayM;
}

- (void)setArrayImage:(NSArray *)arrayImage {
    _arrayImage = arrayImage;
    
    [self orderImageViews];
    [self.arrayM enumerateObjectsUsingBlock:^(UIImageView *obj, NSUInteger idx, BOOL *stop) {
        NSUInteger i = ( arrayImage.count + idx - 1 ) % arrayImage.count;
        obj.image = arrayImage[i];
    }];
}

@end

