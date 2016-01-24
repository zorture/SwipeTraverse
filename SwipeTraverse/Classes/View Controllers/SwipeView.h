//
//  SwipeView.h
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import <UIKit/UIKit.h>
#import "DataView.h"

@protocol SwipeViewDataSource

@required

// returns the number of elements in the Swipe View.
- (NSInteger)numberOfSwipeCell;

// returns the head cell for the swipe view.
- (DataView*)headCellForSwipeViewAtIndex:(NSInteger)indexPath;

@end

@interface SwipeView : UIView

@property (nonatomic, strong) id<SwipeViewDataSource> dataSource;


- (instancetype) initWithDataSource:(id)dataSource;

// returns the reusable swipe view.
- (DataView*)dequeueSwipeCellWithColor:(UIColor*)color;

@end
