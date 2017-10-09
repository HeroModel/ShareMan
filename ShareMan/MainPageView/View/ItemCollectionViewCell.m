//
//  ItemCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "DistriCollectionViewCell.h"
@interface ItemCollectionViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
@end
static NSString * const DistriCell = @"DistriCollectionViewCell";
@implementation ItemCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2, SCREEN_WIDTH / 2 - 75);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * WIDTHFIT, (SCREEN_HEIGHT - 64 - 49) * HEIGHTFIT) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.bouncesZoom = NO;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.contentView addSubview:_collectionView];
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"DistriCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:DistriCell];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DistriCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:DistriCell forIndexPath:indexPath];
    return cell;
}
@end
