//
//  DataView.m
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import "DataView.h"

#define kViewFrame CGRectMake(20,20, 300,400)

@interface DataView()

@property(nonatomic, strong) UILabel* mTitleLabel;
@property(nonatomic, strong) UILabel* mSubTitleLabel;

@end

@implementation DataView

- (instancetype) initWithColor:(UIColor*)color IndexPath:(NSInteger)indexPath{
    self = [super initWithFrame:kViewFrame];
    if (self) {
        [self setBackgroundColor:color];
        
        self.mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,10,250, 50)];
        [self.mTitleLabel setText:@"Title"];
        [self addSubview:self.mTitleLabel];
        
        self.mSubTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,80,250, 50)];
        [self.mSubTitleLabel setText:@"Sub Title"];
        [self addSubview:self.mSubTitleLabel];
        self.indexPath = indexPath;

        
    }
    return self;
}

- (void)reAlignViewWithIndexPath:(NSInteger)indexPath{
    [self setFrame:kViewFrame];
    self.indexPath = indexPath;
}

- (void)setViewTitle:(NSString*)title SubTitle:(NSString*)subtitle{
    [self.mTitleLabel setText:title];
    [self.mSubTitleLabel setText:subtitle];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    [self setFrame:CGRectMake(touchLocation.x-100, touchLocation.y-100, self.frame.size.width, self.frame.size.height)];
    
    if (touchLocation.y> 500) {
        
        [UIView animateWithDuration:1 animations:^{
            // Anivate your view dismiss.
        } completion:^(BOOL finished) {
            self.draggedOut(YES);
        }];
        
    }
}

@end
