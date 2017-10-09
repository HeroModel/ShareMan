//
//  TypeView.m
//  ShareMan
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TypeView.h"

@interface TypeView ()
/** <#注释#> */
@property(nonatomic, assign) float lineY;
@end
@implementation TypeView

-(instancetype)initWithFrame:(CGRect)frame andDatasource:(NSArray *)arr :(NSString *)typename
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(35 * WIDTHFIT, 10 * HEIGHTFIT, 60, 20)];
        lab.text = typename;
        lab.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
//        lab.layer.masksToBounds = YES;
//        lab.layer.cornerRadius = 5;
//        lab.layer.borderWidth = 0.5;
//        lab.layer.borderColor = UIColorFromRGB(GLOBAL_SIGN_COLOR).CGColor;
        lab.font = NAM_TITLE;
        [self addSubview:lab];
        
//        BOOL  isLineReturn = NO;
        float upX = 20 * WIDTHFIT;
        float upY = 40 * HEIGHTFIT;
        float upW = 66 * WIDTHFIT;
        float upH = 33 * HEIGHTFIT;
        for (int i = 0; i<arr.count; i++) {
            NSInteger index = i % 4;
            NSInteger page = i / 4;
//            NSString *str = [arr objectAtIndex:i] ;
//            
//            NSDictionary *dic = [NSDictionary dictionaryWithObject:NAM_TITLE_B forKey:NSFontAttributeName];
//            CGSize size = [str sizeWithAttributes:dic];
//            NSLog(@"%f",size.width);
//            if ( upX > (self.frame.size.width - 20 - size.width - 35)) {
//                
//                isLineReturn = YES;
//                upX = 20 * WIDTHFIT;
//                upY += 48 * HEIGHTFIT;
//            }
            
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(index * (upW + 23.5) + upX, page * (15 + upH) + upY, upW, upH);
            [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
            [btn setTitleColor:[UIColor blackColor] forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [btn setTitle:[arr objectAtIndex:i] forState:0];
            btn.layer.cornerRadius = 8;
            btn.layer.borderColor = UIColorFromRGB(GLOBAL_SIGN_COLOR).CGColor;
            btn.layer.borderWidth = 1;
            btn.layer.borderWidth = 0;
            [btn.layer setMasksToBounds:YES];
            
            [self addSubview:btn];
            btn.tag = 2000+i;
            [btn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
//            upX+=size.width+35;
            self.lineY = page * (15 + upH) + upY;

        }
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(20, self.lineY + 40, self.frame.size.width - 40, 0.5)];
        line.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
        [self addSubview:line];
        
        self.height = upY+11;
        
        self.seletIndex = -1;
    }
    return self;
}
-(void)touchbtn:(UIButton *)btn
{
    
    if (btn.selected == NO) {
        
        self.seletIndex = (int)btn.tag-2000;
        btn.backgroundColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        
        
        //        for (UIView *view in self.subviews) {
        //            if ([view class] == [UIButton class]) {
        //                UIButton *bt = (UIButton *)view;
        //                bt.selected = NO;
        //                if (bt.tag == btn.tag) {
        //                    bt.selected = YES;
        //                }
        //            }
        //
        //        }
    }else
    {
        self.seletIndex = -1;
        btn.selected = NO;
        btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    }
    [self.delegate btnindex:(int)btn.tag-2000];
    
}


@end
