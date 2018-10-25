//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by heihei on 16/9/14.
//  Copyright © 2016年 huiju. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) NSUInteger time;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIImage *picImage = [UIImage imageNamed:@"tupian"];
//    self.layerView.layer.contents = (__bridge id)picImage.CGImage;
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;

//    [UIView animateWithDuration:2 animations:^{
//        CATransform3D transform = CATransform3DIdentity;
//        transform.m34 = -1 / 1000.0;
//        transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
////        transform = CATransform3DTranslate(transform, 0, 0, 50);
//        self.layerView.layer.transform = transform;

//        transform = CGAffineTransformScale(transform, 0.5, 0.5);
//        transform = CGAffineTransformRotate(transform, M_PI / 180 * 30);
//        transform = CGAffineTransformTranslate(transform, 200, 0);
//        self.layerView.layer.affineTransform = transform;
//    }];


//    CGMutablePathRef circlePath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(circlePath, NULL, CGRectInset(self.layerView.bounds, -20, -20));
//    self.layerView.layer.shadowPath = circlePath;
//    CGPathRelease(circlePath);

//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
//    NSDateComponents *conponents = [calendar components:units fromDate:[NSDate date]];
//    NSLog(@"%@",conponents);
//    self.layerView.layer.shadowOpacity = 0.5f;
//    self.layerView.layer.shadowColor = [UIColor redColor].CGColor;

//    self.layerView.layer.shadowRadius = 1.0f;
//    self.layerView.layer.shadowOffset = CGSizeMake(0, 3);

//    self.layerView.layer.anchorPoint = CGPointMake(0, 1);
//    self.time = 0;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];

//    self.layerView.layer.contentsScale = picImage.scale;
//    self.layerView.layer.contentsRect = CGRectMake(0.25, 0.25, 0.5, 0.5);

//    CALayer *blueLayer = [[CALayer alloc] init];
//    [blueLayer setFrame:CGRectMake(10, 10, CGRectGetWidth(self.layerView.frame) - 20, CGRectGetHeight(self.layerView.frame) - 20)];
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//
//    blueLayer.delegate = self;
//
//    [self.layerView.layer addSublayer:blueLayer];
//
//    [blueLayer display];


    // CAShapLayer
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    [path moveToPoint:CGPointMake(50, 50)];
//
//    [path addArcWithCenter:CGPointMake(25, 50) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
//    [path moveToPoint:CGPointMake(25, 75)];
//    [path addLineToPoint:CGPointMake(25, 125)];
//    [path addLineToPoint:CGPointMake(75, 100)];
//
//    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
//    shapeLayer.lineWidth = 5.0f;
//    shapeLayer.lineJoin = kCALineJoinRound;
//    shapeLayer.lineCap = kCALineCapRound;
//    shapeLayer.path = path.CGPath;
//    [self.layerView.layer addSublayer:shapeLayer];

    CGRect rect = self.layerView.bounds;
    CGSize redil = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerTopRight;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:redil];

    CAShapeLayer *shapLayer = [[CAShapeLayer alloc] init];
    shapLayer.path = path.CGPath;
    shapLayer.strokeColor = [UIColor redColor].CGColor;
    shapLayer.fillColor = [UIColor redColor].CGColor;

    [self.layerView.layer addSublayer:shapLayer];
}

- (void)tick {
    self.time ++;
    CGFloat angle = (self.time / 60.0) * M_PI * 2;
    self.layerView.transform = CGAffineTransformMakeRotation(angle);
}

- (void)displayLayer:(CALayer *)layer {
    UIImage *picImage = [UIImage imageNamed:@"tupian"];
    layer.contents = (__bridge id)picImage.CGImage;
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
