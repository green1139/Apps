//
//  ShapedViewTestCase.m
//  ShapesExample
//
//  Created by Denys Telezhkin on 03.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTShapeView.h"

@interface ShapedViewPathTestCase : XCTestCase
@property (nonatomic, strong) DTShapeView * view;

@end

@implementation ShapedViewPathTestCase

- (void)setUp
{
    [super setUp];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.miterLimit = 6;
    path.usesEvenOddFillRule = YES;
    
    self.view = [DTShapeView new];
    [self.view setPath:path];
}

-(void)testLineWidth
{
    XCTAssert(self.view.shapeLayer.lineWidth == 2);
}

-(void)testLineCapStyle
{
    XCTAssert([self.view.shapeLayer.lineCap isEqualToString:kCALineCapRound]);
}

-(void)testLineJoinStyle
{
    XCTAssert([self.view.shapeLayer.lineJoin isEqualToString:kCALineJoinRound]);
}

-(void)testMiterLimit
{
    XCTAssert(self.view.shapeLayer.miterLimit == 6);
}

-(void)testEvenOddRule
{
    XCTAssert([self.view.shapeLayer.fillRule isEqualToString:kCAFillRuleEvenOdd]);
}

@end
