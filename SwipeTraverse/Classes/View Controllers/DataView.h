//
//  DataView.h
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import <UIKit/UIKit.h>

@interface DataView : UIView

@property (nonatomic, assign) NSInteger indexPath;
@property (nonatomic, copy) void (^draggedOut)(BOOL value);


- (instancetype) initWithColor:(UIColor*)color IndexPath:(NSInteger)indexPath;
- (void)reAlignViewWithIndexPath:(NSInteger)indexPath;
- (void)setViewTitle:(NSString*)title SubTitle:(NSString*)subtitle;
@end
