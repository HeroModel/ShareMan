//
//  SelectTypeView.h
//  ShareMan
//
//  Created by apple on 2017/8/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"
//#import "TypeView.h"

@protocol SelectTypeViewDelegate <NSObject>

- (void)didOrderButton:(NSString *)title
        WithReal_price:(NSString *)real_price
      WithDepreciation:(double)depreciation
          WithOriginal:(NSString *)original;
- (void)didCloseButton;
- (void)tapDismissView;
- (void)didQuestionButton;
@end
@interface SelectTypeView : BaseView
/** <#注释#> */
@property(nonatomic, assign) id<SelectTypeViewDelegate> delegate;
//- (void)show;

/** <#注释#> */
@property(nonatomic, strong) UIButton * closeButton;
/** 型号数组 */
@property(nonatomic, strong) NSMutableArray * sizearr;
/** 分类数组 */
@property(nonatomic, strong) NSArray * colorarray;
/** 商品库存量 */
@property(nonatomic, strong) NSDictionary * stockarr;
@end
