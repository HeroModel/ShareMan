//
//  DistriCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContextModel.h"
@interface DistriCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *phontImage;
/** <#注释#> */
@property(nonatomic, assign) ContextModel * model;
@end
