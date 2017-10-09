//
//  ParameterTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ParameterTableViewCell.h"
#import "GraphicCollectionViewCell.h"
#import "ModityCollectionViewCell.h"
#import "IDPersonallModel.h"

@interface ParameterTableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UIScrollViewDelegate
>
@end
static NSString * const GraphicCell = @"GraphicCollectionViewCell";
static NSString * const ModityCell = @"ModityCollectionViewCell";
@implementation ParameterTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(13 * WIDTHFIT, 0, 350 * WIDTHFIT, 1140 * HEIGHTFIT)];
        _bigImage.image = [UIImage imageNamed:@"line-2"];
        _bigImage.userInteractionEnabled = YES;
        [self.contentView addSubview:_bigImage];
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(_bigImage.frame.size.width - 15, _bigImage.frame.size.height - 21);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(7.5, 0 * HEIGHTFIT, _bigImage.frame.size.width - 15, _bigImage.frame.size.height - 20) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
//        self.collectionView.contentOffset = CGPointMake(7.5, 0);
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.pagingEnabled = YES;
        self.collectionView.bounces = NO;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [_bigImage addSubview:_collectionView];
        
        [self.collectionView registerClass:[GraphicCollectionViewCell class] forCellWithReuseIdentifier:GraphicCell];
        [self.collectionView registerClass:[ModityCollectionViewCell class] forCellWithReuseIdentifier:ModityCell];
        
//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 0:
        {
            GraphicCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:GraphicCell forIndexPath:indexPath];
            [cell.grapIamge sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:_array.firstObject]] placeholderImage:PLACEHOLDER];
//            cell.grapIamge.image = [UIImage imageNamed:@"phone_paramenr_xiangqing"];
            return cell;
        }
            break;
        case 1:
        {
            ModityCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ModityCell forIndexPath:indexPath];
            [cell.modImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:_array.lastObject]] placeholderImage:PLACEHOLDER];
//            cell.modImage.image = [UIImage imageNamed:@"phone_paramenr_canshu"];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = ((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;
//    NSLog(@"%ld", index);
    if ([self.delegate respondsToSelector:@selector(offset:)]) {
        [self.delegate offset:index];
    }
}
- (void)setArray:(NSMutableArray *)array
{
    if (_array != array) {
        _array = array;
    }
    [self.collectionView reloadData];
}
@end
