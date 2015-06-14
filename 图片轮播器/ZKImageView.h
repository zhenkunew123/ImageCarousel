//
//  ZKImageView.h
//  图片轮播器
//
//  Created by osx on 15/6/11.
//  Copyright (c) 2015年 osx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKImageView : UIView

/**
 *  含有UIImage的数组
 */
@property (nonatomic, strong) NSArray *arrayImage;
@property (nonatomic, assign) int index;

- (void)left;
- (void)right;
@end
