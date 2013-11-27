//
//  MZViewController.m
//  MZGraph
//
//  Created by Serghei Mazur on 11/26/13.
//  Copyright (c) 2013 Serghei Mazur. All rights reserved.
//

#import "MZViewController.h"

#import "iPadGraphViewController.h"
#import "iPhoneGraphViewController.h"

@interface MZViewController ()
@property (nonatomic, retain) iPhoneGraphViewController *iPhoneGraph;
@property (nonatomic, retain) iPadGraphViewController *iPadGraph;
@end

@implementation MZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // For iPhone
    
    UILabel *forIphone = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 20)];
    forIphone.text = @"Graph for iPhone";
    [forIphone setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:forIphone];
    
    _iPhoneGraph = [[iPhoneGraphViewController alloc]init];
    
    _iPhoneGraph.fistArray = @[[NSNumber numberWithInt:12],[NSNumber numberWithInt:8],[NSNumber numberWithInt:1],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:32],[NSNumber numberWithInt:22],[NSNumber numberWithInt:-12],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:22],[NSNumber numberWithInt:32]];
    _iPhoneGraph.secondArray = @[[NSNumber numberWithInt:2],[NSNumber numberWithInt:-18],[NSNumber numberWithInt:-5],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:30],[NSNumber numberWithInt:19],[NSNumber numberWithInt:-10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:32],[NSNumber numberWithInt:12]];
    
    [_iPhoneGraph setFrame:CGRectMake(20, 50, 700, 300)];

    //change style graph (Yes = For lines, No = For charts)
    [_iPhoneGraph setLinesGraph:NO];
    [self.view addSubview:_iPhoneGraph];
    
    
    // For iPad
    
    UILabel *forIpad = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, 300, 20)];
    forIpad.text = @"Graph for iPad";
    [forIpad setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:forIpad];
    
    
    _iPadGraph = [[iPadGraphViewController alloc]init];
    _iPadGraph.fistArray = @[[NSNumber numberWithInt:12],[NSNumber numberWithInt:8],[NSNumber numberWithInt:1],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:32],[NSNumber numberWithInt:22],[NSNumber numberWithInt:-12],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:22],[NSNumber numberWithInt:32]];
    _iPadGraph.secondArray = @[[NSNumber numberWithInt:2],[NSNumber numberWithInt:-18],[NSNumber numberWithInt:-5],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:30],[NSNumber numberWithInt:19],[NSNumber numberWithInt:-10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:32],[NSNumber numberWithInt:12]];
    
    [_iPadGraph setFrame:CGRectMake(20, 202, 700, 300)];
    
    //change style graph (Yes = For lines, No = For charts)
    [_iPadGraph setLinesGraph:NO];
    [self.view addSubview:_iPadGraph];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
