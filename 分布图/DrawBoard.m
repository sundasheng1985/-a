//
//  DrawBoard.m
//  分布图
//
//  Created by 孙玉震 on 17/2/22.
//  Copyright © 2017年 孙玉震. All rights reserved.
//

#import "DrawBoard.h"
@interface DrawBoard ()
@property (nonatomic, assign) CGFloat progress;
@end
@implementation DrawBoard
{
    CGLayerRef layer;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景色
        //        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    //获取ctx
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置画图相关样式参数
    
    //设置笔触颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);//设置颜色有很多方法，我觉得这个方法最好用
    //设置笔触宽度
    CGContextSetLineWidth(ctx, 2);
    //设置填充色
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    //设置拐点样式
    //    enum CGLineJoin {
    //        kCGLineJoinMiter, //尖的，斜接
    //        kCGLineJoinRound, //圆
    //        kCGLineJoinBevel //斜面
    //    };
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //Line cap 线的两端的样式
    //    enum CGLineCap {
    //        kCGLineCapButt,
    //        kCGLineCapRound,
    //        kCGLineCapSquare
    //    };
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    [self distributionMap:ctx];
    
    self.progress = 0.6;
    [self annularProgress:ctx];
}

//饼状分布图
- (void)distributionMap:(CGContextRef)context{
    NSArray *array = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    NSArray *colorArray = @[[UIColor redColor], [UIColor greenColor], [UIColor yellowColor],[UIColor cyanColor],[UIColor blueColor],[UIColor lightGrayColor],[UIColor grayColor],[UIColor darkGrayColor],[UIColor magentaColor],[UIColor orangeColor]];
    NSMutableArray * colorArr=[NSMutableArray new];
    for (int i=0; i<array.count; i++) {
        [colorArr addObject:colorArray[i%10]];
    }
    CGFloat w = 300;
    CGFloat h = 300;
    CGPoint center = CGPointMake(w * 0.5, h * 0.5);
    CGFloat radius = w * 0.3 - 5;
    CGFloat startA = 0;
    CGFloat endA = -M_PI/2;
    CGFloat angle = 0;
    for (int i = 0; i < array.count; i ++) {
        //这句话是为了画完其中一个之后第二个的起点就是第一个的终点，这里面M_PI代表的是180度 55这个数值是数据源的总和
        startA = endA;
        angle = [array[i] floatValue] / 55 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [(UIColor *)colorArr[i] set];
        CGContextAddPath(context, path.CGPath);
        CGContextFillPath(context);
    }
}

//环形进度条

- (void)annularProgress:(CGContextRef)context{
    CGContextAddArc (context, 150, 400, 90, 0, M_PI* 2 , 0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    CGPoint center = CGPointMake(150, 400);
    CGFloat radius = 90;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + M_PI_2*2*self.progress;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
