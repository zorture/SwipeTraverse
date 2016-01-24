//
//  LinkedListNode.h
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DataView.h"

@interface LinkedListNode : NSObject

@property (nonatomic, strong) NSString* string;
@property (nonatomic, strong) DataView* contentView;
@property (nonatomic, strong) LinkedListNode* nextNode;

- (instancetype) initWithView:(DataView*)view;
@end
