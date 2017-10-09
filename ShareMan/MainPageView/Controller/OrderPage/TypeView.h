//
//  TypeView.h
//  ShareMan
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"

@protocol TypeSeleteDelegate <NSObject>

- (void)btnindex:(NSInteger)tag;

@end
@interface TypeView : BaseView
@property(nonatomic)float height;
@property(nonatomic)int seletIndex;
@property (nonatomic,retain) id<TypeSeleteDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame andDatasource:(NSArray *)arr :(NSString *)typename;
@end
