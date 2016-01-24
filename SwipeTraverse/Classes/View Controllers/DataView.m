//
//  DataView.m
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import "DataView.h"

#define kViewFrame CGRectMake(20,20, 300,400)
#define kRotationDegree 20

@interface DataView()

@property(nonatomic, strong) UILabel* mTitleLabel;
@property(nonatomic, strong) UILabel* mSubTitleLabel;
@property(nonatomic, assign) CGRect originalFrame;
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
        
        self.originalFrame = self.frame;

        
    }
    return self;
}

- (void)reAlignViewWithIndexPath:(NSInteger)indexPath{
    
    [self setTransform:[self resetTransformation]];
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

    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGAffineTransform rotate = CGAffineTransformMakeRotation(kRotationDegree * M_PI/180);
        CGAffineTransform scale = CGAffineTransformMakeScale(0.9,0.9);
        [self setTransform:CGAffineTransformConcat(rotate, scale)];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    
    [self setTransform:[self transformationWithLocation:touchLocation]];
    
    if (touchLocation.y> 500) {
        [UIView animateWithDuration:0 animations:^{
            // Animate your view dismiss.
        } completion:^(BOOL finished) {
            self.draggedOut(YES);
        }];
        
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGAffineTransform rotate = CGAffineTransformMakeRotation(0 * M_PI/180);
        CGAffineTransform scale = CGAffineTransformMakeScale(1,1);
        [self setTransform:CGAffineTransformConcat(rotate, scale)];
    } completion:^(BOOL finished) {
    }];


    
    
}

# pragma mark View Transformation

- (CGAffineTransform)transformationWithLocation:(CGPoint)touchLocation{
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(kRotationDegree * M_PI/180);
    CGAffineTransform scale = CGAffineTransformMakeScale(0.9,0.9);
    CGAffineTransform translation = CGAffineTransformMakeTranslation(touchLocation.x-100, touchLocation.y-100);
    CGAffineTransform rotateNScale = CGAffineTransformConcat(rotate, scale);
    return  CGAffineTransformConcat(rotateNScale, translation);
}

- (CGAffineTransform)resetTransformation{
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(0 * M_PI/180);
    CGAffineTransform scale = CGAffineTransformMakeScale(1,1);
    CGAffineTransform translation = CGAffineTransformMakeTranslation(0,0);
    CGAffineTransform rotateNScale = CGAffineTransformConcat(rotate, scale);
    return  CGAffineTransformConcat(rotateNScale, translation);
}



@end
