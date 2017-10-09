//
//  MyView.m
//  王煌分享
//
//  Created by LL.F on 16/7/11.
//  Copyright © 2016年 LL.F. All rights reserved.
//

#import "MyView.h"
#import "ModelOfMyView.h"
@interface MyView ()
@property (nonatomic, assign) CGMutablePathRef path;
@property (nonatomic, retain) NSMutableArray *pathArray;
@property (nonatomic, assign) BOOL isHavePath;
@end

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _lineWidth = 5.0f;
        _linColor = [UIColor blackColor];
        
//        UIButton * butt = [UIButton buttonWithType:UIButtonTypeCustom];
//        butt.frame = CGRectMake(0, 20, self.frame.size.width, 40);
//        butt.backgroundColor = [UIColor greenColor];
//        [butt setTitle:@"清除" forState:UIControlStateNormal];
//        [butt addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:butt];
//        
//        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 40);
//        button.backgroundColor = [UIColor greenColor];
//        [button setTitle:@"保存" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(screenShot) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:button];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawView:context];
}
- (void)drawView:(CGContextRef)context
{

    for (ModelOfMyView *modelOfMyView in _pathArray) {
        CGContextAddPath(context, modelOfMyView.path.CGPath);
        [modelOfMyView.color set];
        CGContextSetLineWidth(context, modelOfMyView.width);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextDrawPath(context, kCGPathStroke);
    }
    if (_isHavePath) {
        CGContextAddPath(context, _path);
        [_linColor set];
        CGContextSetLineWidth(context, _lineWidth);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextDrawPath(context, kCGPathStroke);
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    _path = CGPathCreateMutable();
    _isHavePath = YES;
    CGPathMoveToPoint(_path, NULL, location.x, location.y);
    if (_isHavePath == YES) {
        [self.delegate value:1];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    CGPathAddLineToPoint(_path, NULL, location.x, location.y);
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:_path];
    ModelOfMyView *modelOfMyView = [ModelOfMyView viewModelWithColor:_linColor path:path width:_lineWidth];
    [_pathArray addObject:modelOfMyView];
    CGPathRelease(_path);
    _isHavePath = NO;

}

- (void)clear{
    [self.pathArray removeAllObjects];
    [self.delegate value:-1];
    [self setNeedsDisplay];
}

@end
