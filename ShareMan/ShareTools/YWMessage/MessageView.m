//
//  MessageView.m
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MessageView.h"
#import "OrderTableViewCell.h"

@interface MessageView ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * imageArray;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * stringArray;

@end

static NSString * const OrderCell = @"OrderTableViewCell";
@implementation MessageView
- (instancetype)initWithMessageViewFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UIImage * image1 = [UIImage imageNamed:@"icon-1"];
        UIImage * image2 = [UIImage imageNamed:@"icon-2"];
        UIImage * image3 = [UIImage imageNamed:@"icon-3"];
        UIImage * image4 = [UIImage imageNamed:@"icon-4"];
        UIImage * image5 = [UIImage imageNamed:@"icon-5"];
        UIImage * image6 = [UIImage imageNamed:@"icon-6"];
        
        self.imageArray = [NSMutableArray arrayWithObjects:image1, image2, image3, image4, image5, image6, nil];
        self.stringArray = [NSMutableArray arrayWithObjects:@"共享订单", @"回收订单", @"维修订单", @"联系客服", @"小报告", @"代金券", nil];
        
        [self createView];
        [self createTableHeader];
        
    }
    return self;
}
- (void)createView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH -  SCREEN_WIDTH / 3, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:_tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:OrderCell];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width, 0, SCREEN_WIDTH - self.tableView.frame.size.width, SCREEN_HEIGHT)];
    view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5f];
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didViewDismiss)];
    [view addGestureRecognizer:tap];
    [self addSubview:view];
    
    //wyw
//    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -  SCREEN_WIDTH / 3, 297, 14, 51)];
//    image.image = [UIImage imageNamed:@"sidebar-right"];
//    [self addSubview:image];
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stringArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.ima.image = self.imageArray[indexPath.row];
    cell.label.text = self.stringArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didViewGainIndex:)]) {
        [self.delegate didViewGainIndex:indexPath.row];
    }
}
- (void)createTableHeader
{
    UIImageView * backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH -  SCREEN_WIDTH / 3, 186)];
    backImage.image = [UIImage imageNamed:@"top-bg"];
    backImage.contentMode = UIViewContentModeScaleAspectFill;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width / 2 - 100, backImage.frame.size.height - 45, 200, 20)];
    label.text = @"微微一笑";
    label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = NAM_TITLE;
    [backImage addSubview:label];
    
    self.tableView.tableHeaderView = backImage;
}
- (void)didViewDismiss
{
    [self removeFromSuperview];
}
@end
