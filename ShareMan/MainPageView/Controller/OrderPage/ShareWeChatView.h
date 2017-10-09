//
//  ShareWeChatView.h
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"

@protocol ShareWeChatViewDelegate <NSObject>

- (void)dismissView;
- (void)weChatButton;
- (void)weChatFriendButton;
@end
@interface ShareWeChatView : BaseView
/** <#注释#> */
@property(nonatomic, assign) id<ShareWeChatViewDelegate> delegate;
- (void)show;
- (void)dismiss;
@end
