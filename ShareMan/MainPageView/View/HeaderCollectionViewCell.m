//
//  HeaderCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HeaderCollectionViewCell.h"

@interface HeaderCollectionViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * photoCollection;
@end
@implementation HeaderCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout * flowLayoutPhoto = [[UICollectionViewFlowLayout alloc] init];
        flowLayoutPhoto.itemSize = CGSizeMake(SCREEN_WIDTH * WIDTHFIT, 359 * HEIGHTFIT);
        flowLayoutPhoto.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.photoCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * WIDTHFIT, 359.5 * HEIGHTFIT) collectionViewLayout:flowLayoutPhoto];
        self.photoCollection.backgroundColor = [UIColor whiteColor];
        self.photoCollection.bouncesZoom = NO;
        self.photoCollection.delegate = self;
        self.photoCollection.dataSource = self;
        [self.contentView addSubview:_photoCollection];
        [self.photoCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
@end
