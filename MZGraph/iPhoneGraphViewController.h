//
//  iPhoneGraphViewController.h
//  Graph for iPhone
//
//  Created by Serghei Mazur on 2/28/13.
//  Copyright (c) 2013 BinaSystem. All rights reserved.
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
