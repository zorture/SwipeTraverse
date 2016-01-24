//
//  SwipeView.m
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import "SwipeView.h"
#import "Queue.h"

#define kMaxQueueSize 3
@interface SwipeView ()
@property (nonatomic, strong) Queue* myDueue;
@property (nonatomic, assign) int rowCount;
@property (nonatomic, assign) NSInteger maxRowCount;

@end

@implementation SwipeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithDataSource:(id)dataSource{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.rowCount = -1;
    self = [super initWithFrame:screenRect];
    if (self) {
        [self setBackgroundColor:[UIColor grayColor]];
        self.dataSource = dataSource;
        self.myDueue = [[Queue alloc] init];
         __weak __typeof(self) weakSelf = self;
        [self.myDueue setDeQueue:^(BOOL value) {
            [weakSelf createCells];
        }];
        [self performSelector:@selector(createCells) withObject:nil afterDelay:1];

    }
    return self; 
}


- (void)createCells{

    self.maxRowCount = [self.dataSource numberOfSwipeCell];
    while (self.myDueue.count<kMaxQueueSize && self.rowCount< self.maxRowCount-1)
    {
        DataView* cell =  [self.dataSource headCellForSwipeViewAtIndex:self.rowCount];
        [self insertSubview:cell atIndex:0];
        [self.myDueue enqueueWithView:cell];
    }
}

- (DataView*)dequeueSwipeCellWithColor:(UIColor*)color{
 
    self.rowCount++;

    if (self.myDueue.free){
        DataView* view = (DataView*)self.myDueue.free.contentView;
        [view setBackgroundColor:color];
        [view reAlignViewWithIndexPath:self.rowCount];
        return view;
    }
    else
        return [[DataView alloc] initWithColor:color IndexPath:self.rowCount];
}



@end
