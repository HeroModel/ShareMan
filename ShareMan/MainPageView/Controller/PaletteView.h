//
//  PaletteView.h
//  ShareMan
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"
#import "MyView.h"

@protocol PaletteViewDelegate <NSObject>

- (void)deleteView;
- (void)shotImage:(UIImage *)image;
- (void)valueArray:(NSInteger)array;

@end
@interface PaletteView : BaseView
/** <#注释#> */
@property(nonatomic, assign) id<PaletteViewDelegate> delegate;
/** <#注释#> */
@property(nonatomic, strong) MyView * paletteView;
@end
