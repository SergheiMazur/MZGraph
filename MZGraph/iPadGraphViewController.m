//
//  iPadGraphViewController.m
//  Graph for iPad
//
//  Created by Serghei Mazur on 11/26/13.
//  Copyright (c) 2013 Serghei Mazur. All rights reserved.
//

#import "iPadGraphViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation iPadGraphViewController

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//200px = 100%
- (void)drawRect:(CGRect)rect {
    double maxY = 0;
    bool  minusValue = NO;
    bool nothingShow = NO;
    
    for (NSNumber *number in _fistArray) {
        if (maxY < abs([number doubleValue])) {
            maxY = abs([number doubleValue]);
        }
        if ([number doubleValue] < 0) {
            minusValue = YES;
        }
    }
    for (NSNumber *number in _secondArray) {
        if (maxY < abs([number doubleValue])) {
            maxY = abs([number doubleValue]);
        }
        if ([number doubleValue] < 0) {
            minusValue = YES;
        }
    }
    
    if (maxY == 0) {
        maxY = 100;
        nothingShow = YES;
    }
    
    //coefficient
    double coefficient = 100/maxY;
    
    UIColor *currentColor = [UIColor blackColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context); // <---- this
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    
    // line X
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, 10,150);
    CGContextAddLineToPoint(context, 650, 150);
    CGContextAddLineToPoint(context, 640, 144);
    CGContextAddLineToPoint(context, 650, 150);
    CGContextAddLineToPoint(context, 640, 156);
    CGContextStrokePath(context);
    
    //Create 5 strike line for see difference
    //And for +  and -
    int halfGraph = 150;
    double yNumber = 0;
    for (int i = 0; i<2; i++) {
        for (int j = 0; j<5; j++) {
            halfGraph -= 20;
            yNumber +=maxY/5;
            CGFloat dashes[] = { 1, 1 };
            CGContextSetLineDash( context, 0.0, dashes, 2 );
            CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
            CGContextMoveToPoint(context, 10,halfGraph);
            CGContextAddLineToPoint(context, 650, halfGraph);
            CGContextStrokePath(context);
            
            UILabel *gradationLabel = [[UILabel alloc]initWithFrame:CGRectMake(-25, halfGraph, 50, 20)];
            gradationLabel.backgroundColor = [UIColor clearColor];
            gradationLabel.textAlignment = NSTextAlignmentRight;
            [gradationLabel setFont:[UIFont systemFontOfSize:13]];
            [gradationLabel setAdjustsFontSizeToFitWidth:YES];
            
            if (!nothingShow) {
                if (!minusValue && i > 0) {
                    
                } else{
                    gradationLabel.text = [NSString stringWithFormat:yNumber == (int)yNumber?@"%.0f":@"%.0f",yNumber];
                }
            }
            
            
            gradationLabel.textColor = [UIColor grayColor];
            [self addSubview:gradationLabel];
        }
        halfGraph = 270;
        yNumber = -maxY-maxY/5;
        
        //If Graph don't have < 0 value  No need wite numbers with minus (i = 2 exit loop)
    }
    
    //Create 12 strike line for month
    
    halfGraph = 4;
    if (_months == nil) {
        _months = [[NSArray alloc]initWithObjects:@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
    }
    
    for (int i = 0; i<12; i++) {
        halfGraph += 50;
        CGFloat dashes[] = { 1, 1 };
        CGContextSetLineDash( context, 0.0, dashes, 2 );
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextMoveToPoint(context, halfGraph,40);
        CGContextAddLineToPoint(context, halfGraph, 260);
        CGContextStrokePath(context);
        
        UILabel *gradationLabel = [[UILabel alloc]initWithFrame:CGRectMake(halfGraph-40, 260, 50, 20)];
        gradationLabel.backgroundColor = [UIColor clearColor];
        gradationLabel.textAlignment = NSTextAlignmentRight;
        [gradationLabel setFont:[UIFont systemFontOfSize:13]];
        [gradationLabel setAdjustsFontSizeToFitWidth:YES];
        gradationLabel.text = [NSString stringWithFormat:@"%@",[_months objectAtIndex:i]];
        gradationLabel.textColor = [UIColor grayColor];
        [self addSubview:gradationLabel];
    }
    
    CGContextSetLineDash(context, 0, NULL, 0);
    UILabel *xLabel = [[UILabel alloc]initWithFrame:CGRectMake(-15, 18, 100, 30)];
    xLabel.backgroundColor = [UIColor clearColor];
    [xLabel setFont:[UIFont systemFontOfSize:14]];
    xLabel.textColor = [UIColor darkGrayColor];
    xLabel.text = @"Money";
    [self addSubview:xLabel];
    
    UILabel *zeroLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 150, 30, 20)];
    zeroLabel.backgroundColor = [UIColor clearColor];
    zeroLabel.textColor = [UIColor grayColor];
    [zeroLabel setFont:[UIFont systemFontOfSize:13]];
    zeroLabel.text = @"0";
    [self addSubview:zeroLabel];
    
    // line Y
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, 30,250);
    CGContextAddLineToPoint(context, 30, 50);
    CGContextAddLineToPoint(context, 24, 60);
    CGContextAddLineToPoint(context, 30, 50);
    CGContextAddLineToPoint(context, 36, 60);
    CGContextStrokePath(context);
    
    UILabel *yLabel = [[UILabel alloc]initWithFrame:CGRectMake(635, 155, 100, 30)];
    yLabel.backgroundColor = [UIColor clearColor];
    [yLabel setFont:[UIFont systemFontOfSize:14]];
    yLabel.textColor = [UIColor darkGrayColor];
    yLabel.text = @"Month";
    [self addSubview:yLabel];
    
    CGContextSetLineWidth(context, 1.0);
    
    //FirstArray
    
    if (_linesGraph) {
        double demoData[31] = {[[_fistArray objectAtIndex:0] doubleValue],[[_fistArray objectAtIndex:1] doubleValue],[[_fistArray objectAtIndex:2] doubleValue],[[_fistArray objectAtIndex:3] doubleValue],[[_fistArray objectAtIndex:4] doubleValue],[[_fistArray objectAtIndex:5] doubleValue],[[_fistArray objectAtIndex:6] doubleValue],[[_fistArray objectAtIndex:7] doubleValue],[[_fistArray objectAtIndex:8] doubleValue],[[_fistArray objectAtIndex:9] doubleValue],[[_fistArray objectAtIndex:10] doubleValue],[[_fistArray objectAtIndex:11] doubleValue]};
        yLabel.text = @"Month";
        double distanceNextYline = 50;
        double bizieLineAligm = 20;
        
        double nextX = 55;
        double downToXline = 150;
        double corectPointer1 = downToXline - demoData[0]*coefficient;
        
        CGMutablePathRef spadePath = CGPathCreateMutable();
        CGPathMoveToPoint(spadePath, NULL, nextX, downToXline - demoData[0]*coefficient);
        
        
        for (int i = 1; i < [_fistArray count]; i++) {
            CGPathAddCurveToPoint(spadePath, NULL, nextX+bizieLineAligm, corectPointer1, nextX+distanceNextYline-bizieLineAligm, downToXline - demoData[i]*coefficient, nextX+distanceNextYline, downToXline - demoData[i]*coefficient);
            nextX +=distanceNextYline;
            corectPointer1 = downToXline - demoData[i]*coefficient;
        }
        [[UIColor colorWithRed:54.0/255.0f green:133.0f/255.0f blue:37.0f/255.0f alpha:1.0f] set];
        CGContextSetLineWidth(context, 4);
        CGContextAddPath(context, spadePath);
        
        CGContextStrokePath(context);
        
        
        
    } else {
        
        
        if ([_fistArray count] == 12) {
            double demoData[12] = {[[_fistArray objectAtIndex:0] doubleValue],[[_fistArray objectAtIndex:1] doubleValue],[[_fistArray objectAtIndex:2] doubleValue],[[_fistArray objectAtIndex:3] doubleValue],[[_fistArray objectAtIndex:4] doubleValue],[[_fistArray objectAtIndex:5] doubleValue],[[_fistArray objectAtIndex:6] doubleValue],[[_fistArray objectAtIndex:7] doubleValue],[[_fistArray objectAtIndex:8] doubleValue],[[_fistArray objectAtIndex:9] doubleValue],[[_fistArray objectAtIndex:10] doubleValue],[[_fistArray objectAtIndex:11] doubleValue]};
            
            int coor = 50;
            for (int i = 0; i<12; i++) {
                

                CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:96.0f/255.0f green:172.0f/255.0f blue:96.0f/255.0f alpha:1].CGColor);
                CGContextSetRGBFillColor(context, 96.0f/255.0f, 172.0f/255.0f, 96.0f/255.0f, 1.0);
                
                CGContextSetShadow(context,CGSizeMake(2, 2) , 2);
                CGMutablePathRef pathRef = CGPathCreateMutable();
                CGPathMoveToPoint(pathRef, NULL, coor, 150);
                CGPathAddLineToPoint(pathRef, NULL, coor, -demoData[i]*coefficient+150);
                CGPathAddLineToPoint(pathRef, NULL, coor+15, -demoData[i]*coefficient+150);
                CGPathAddLineToPoint(pathRef, NULL, coor+15, 150);
                CGPathCloseSubpath(pathRef);
                CGContextAddPath(context, pathRef);
                CGContextFillPath(context);
                CGContextAddPath(context, pathRef);
                CGContextStrokePath(context);
                
                
                CGPathRelease(pathRef);
                int negCor;
                if (demoData[i]>0) {
                    negCor = 20;
                } else {
                    negCor = 0;
                }
                UILabel *oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(coor+2.5, -demoData[i]*coefficient+150-negCor, 50, 20)];
                oneLabel.backgroundColor = [UIColor clearColor];
                

                oneLabel.textColor = [UIColor colorWithRed:96.0f/255.0f green:172.0f/255.0f blue:96.0f/255.0f alpha:1];
                
                oneLabel.text = [NSString stringWithFormat:demoData[i] == (int)demoData[i]?@"%.0f":@"%.0f",demoData[i]];
                oneLabel.shadowColor = [UIColor darkGrayColor];
                oneLabel.shadowOffset = CGSizeMake(1.0, 1.0);
                [oneLabel setFont:[UIFont systemFontOfSize:14]];
                [oneLabel setAdjustsFontSizeToFitWidth:YES];
                [self addSubview:oneLabel];
                
                coor += 50;
            }
        }
        
    }
    
    
    //SecondArray
    
    
    if (_linesGraph) {
        double demoData[31] = {[[_secondArray objectAtIndex:0] doubleValue],[[_secondArray objectAtIndex:1] doubleValue],[[_secondArray objectAtIndex:2] doubleValue],[[_secondArray objectAtIndex:3] doubleValue],[[_secondArray objectAtIndex:4] doubleValue],[[_secondArray objectAtIndex:5] doubleValue],[[_secondArray objectAtIndex:6] doubleValue],[[_secondArray objectAtIndex:7] doubleValue],[[_secondArray objectAtIndex:8] doubleValue],[[_secondArray objectAtIndex:9] doubleValue],[[_secondArray objectAtIndex:10] doubleValue],[[_secondArray objectAtIndex:11] doubleValue]};
        yLabel.text = @"Month";
        double distanceNextYline = 50;
        double bizieLineAligm = 20;
        
        double nextX = 55;
        double downToXline = 150;
        double corectPointer1 = downToXline - demoData[0]*coefficient;
        //        NSLog(@"FirstPOint:  %f , %f",nextX,downToXline - demoData[0]*coefficient);
        
        CGMutablePathRef spadePath = CGPathCreateMutable();
        CGPathMoveToPoint(spadePath, NULL, nextX, downToXline - demoData[0]*coefficient);
        
        
        for (int i = 1; i < [_fistArray count]; i++) {
            CGPathAddCurveToPoint(spadePath, NULL, nextX+bizieLineAligm, corectPointer1, nextX+distanceNextYline-bizieLineAligm, downToXline - demoData[i]*coefficient, nextX+distanceNextYline, downToXline - demoData[i]*coefficient);
            //            NSLog(@"POint %d: %f , %f %f %f %f %f",i,nextX+bizieLineAligm, corectPointer1, nextX+distanceNextYline-bizieLineAligm, downToXline - demoData[i], nextX+distanceNextYline, downToXline - demoData[i]);
            nextX +=distanceNextYline;
            corectPointer1 = downToXline - demoData[i]*coefficient;
        }
        [[UIColor colorWithRed:229.0/255.0f green:168.0/255.0f blue:10.0/255.0f alpha:1.0f] set];
        CGContextSetLineWidth(context, 4);
        CGContextAddPath(context, spadePath);
        
        CGContextStrokePath(context);
        
        
        
    } else {
        
        
        
        if ([_secondArray count] == 12) {
            //seconArray
            double demoData2[12] = {[[_secondArray objectAtIndex:0] doubleValue],[[_secondArray objectAtIndex:1] doubleValue],[[_secondArray objectAtIndex:2] doubleValue],[[_secondArray objectAtIndex:3] doubleValue],[[_secondArray objectAtIndex:4] doubleValue],[[_secondArray objectAtIndex:5] doubleValue],[[_secondArray objectAtIndex:6] doubleValue],[[_secondArray objectAtIndex:7] doubleValue],[[_secondArray objectAtIndex:8] doubleValue],[[_secondArray objectAtIndex:9] doubleValue],[[_secondArray objectAtIndex:10] doubleValue],[[_secondArray objectAtIndex:11] doubleValue]};
            
            
            int coor = 40;
            for (int i = 0; i<12; i++) {
                CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:229.0f/255.0f green:168.0f/255.0f blue:10.0f/255.0f alpha:1].CGColor);
                CGContextSetRGBFillColor(context, 229.0f/255.0f, 168.0f/255.0f, 10.0f/255.0f, 1.0);
                CGMutablePathRef pathRef = CGPathCreateMutable();
                CGPathMoveToPoint(pathRef, NULL, coor, 150);
                CGPathAddLineToPoint(pathRef, NULL, coor, -demoData2[i]*coefficient+150);
                CGPathAddLineToPoint(pathRef, NULL, coor+15, -demoData2[i]*coefficient+150);
                CGPathAddLineToPoint(pathRef, NULL, coor+15, 150);
                CGPathCloseSubpath(pathRef);
                CGContextAddPath(context, pathRef);
                CGContextFillPath(context);
                CGContextAddPath(context, pathRef);
                CGContextStrokePath(context);
                CGContextSetShadow(context,CGSizeMake(2, 2) , 2);
                
                CGPathRelease(pathRef);
                int negCor;
                if (demoData2[i]>0) {
                    negCor = 20;
                } else {
                    negCor = 0;
                }
                UILabel *secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(coor-38, -demoData2[i]*coefficient+150-negCor, 50, 20)];
                secondLabel.textAlignment = NSTextAlignmentRight;
                secondLabel.backgroundColor = [UIColor clearColor];
                secondLabel.textColor = [UIColor colorWithRed:229.0f/255.0f green:168.0f/255.0f blue:10.0f/255.0f alpha:1];
                secondLabel.text = [NSString stringWithFormat:demoData2[i] == (int)demoData2[i]?@"%.0f":@"%.0f",demoData2[i]];
                secondLabel.shadowColor = [UIColor darkGrayColor];
                secondLabel.shadowOffset = CGSizeMake(1.0, 1.0);
                [secondLabel setFont:[UIFont systemFontOfSize:14]];
                [secondLabel setAdjustsFontSizeToFitWidth:YES];
                [self addSubview:secondLabel];
                
                coor += 50;
            }
        }
    }
}

@end
