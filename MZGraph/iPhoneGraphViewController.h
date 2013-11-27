//
//  iPhoneGraphViewController.h
//  Graph for iPhone
//
//  Created by Serghei Mazur on 11/26/13.
//  Copyright (c) 2013 Serghei Mazur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPhoneGraphViewController : UIView

@property(retain,nonatomic) NSArray *fistArray;
@property(retain,nonatomic) NSArray *secondArray;
@property(retain,nonatomic) NSString *Xname;
@property(retain,nonatomic) NSString *Yname;
@property(retain,nonatomic) NSArray  *months;

@property (nonatomic, assign, getter = isLinesGraph) BOOL linesGraph; //change style graph (Yes = For lines, No = For charts)

@end
