//
//  ShareingCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareingCollectionViewCell.h"
#import "Share_YouHu_CollectionViewCell.h"
#import "OrderModel.h"
@interface ShareingCollectionViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
Share_YouHu_CollectionViewCellDelegate
>
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
@end
static NSString * const Share_YouHuCell = @"Share_YouHu_CollectionViewCell";
static NSString * const BackGroundCell = @"BackGroundCollectionViewCell";
@implementation ShareingCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.bounces = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.pagingEnabled = YES;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.contentView addSubview:_collectionView];
        [self.collectionView registerClass:[Share_YouHu_CollectionViewCell class] forCellWithReuseIdentifier:Share_YouHuCell];
        [self.collectionView registerClass:[BackGroundCollectionViewCell class] forCellWithReuseIdentifier:BackGroundCell];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.array.count == 0) {
        return 1;
    }
    else
    {
        return self.array.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.array.count == 0) {
        BackGroundCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:BackGroundCell forIndexPath:indexPath];
        return cell;
    }else{
        
        OrderModel * model = _array[indexPath.item];
        Share_YouHu_CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:Share_YouHuCell forIndexPath:indexPath];
        cell.model = model;
        cell.delegate = self;
        return cell;
    }
}
- (void)setArray:(NSMutableArray *)array
{
    if (_array != array) {
        _array = array;
    }
    [self.collectionView reloadData];
}
- (void)order_id:(NSString *)order_id
{
    if ([self.delegate respondsToSelector:@selector(orderid:)]) {
        [self.delegate orderid:order_id];
    }
}
@end
