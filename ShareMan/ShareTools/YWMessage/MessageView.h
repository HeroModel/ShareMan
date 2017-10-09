//
//  MessageView.h
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageViewDelegate <NSObject>

- (void)didViewGainIndex:(NSInteger)index;

@end
@interface MessageView : UIView
- (instancetype)initWithMessageViewFrame:(CGRect)frame;
/** <#注释#> */
@property(nonatomic, assign) id<MessageViewDelegate> delegate;
@end
