//
//  ViewController.m
//  SwipeTraverse
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//  Copyright (c) 2015 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "ViewController.h"
#import "SwipeView.h"
#import "Queue.h"

@interface ViewController ()
@property (nonatomic, strong) Queue* myDueue;
@property (nonatomic, strong) SwipeView* swipeView;

@property (nonatomic, strong) NSArray* mTitleArray;
@property (nonatomic, strong) NSArray* mSubTitleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.swipeView = [[SwipeView alloc] initWithDataSource:self];
    [self.view addSubview:self.swipeView];
    
    UILabel* messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,500,550, 50)];
    [messageLabel setText:@"Swipe Below the text to dismiss the view ."];
    [self.swipeView addSubview:messageLabel];

    
    self.mTitleArray = [[NSArray alloc] initWithObjects:@"New York",@"Boston",@"San Francisco",@"Charlotte",@"Dallas",@"Chicago", nil];
    self.mSubTitleArray = [[NSArray alloc] initWithObjects:@"NY",@"MA",@"CA",@"NC",@"TX",@"IL", nil];
    
}

- (NSInteger)numberOfSwipeCell{
    return self.mTitleArray.count;
}

- (DataView*)headCellForSwipeViewAtIndex:(NSInteger)indexPath{
    DataView* view = [self.swipeView dequeueSwipeCellWithColor:[UIColor whiteColor]];
    [view setViewTitle:self.mTitleArray[view.indexPath] SubTitle:self.mSubTitleArray[view.indexPath]];
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
