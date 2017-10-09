//
//  HeaderView.h
//  ShareMan
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderViewDelegate <NSObject>

- (void)didLeftImage;
- (void)didCenterImage;
- (void)didRightImage;
- (void)didImageIndex:(NSInteger)version;

@end
@interface HeaderView : UICollectionReusableView<SDCycleScrollViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, assign) id<HeaderViewDelegate> delegate;
/** <#注释#> */
@property(nonatomic, strong) SDCycleScrollView * cycleScrollView;
@end
