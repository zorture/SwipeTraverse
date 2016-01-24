//
//  LinkedListNode.m
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import "LinkedListNode.h"

@implementation LinkedListNode

- (instancetype) initWithView:(DataView*)view{
    self = [super init];
    if (self) {
        self.contentView = view;
    }
    return self;
}
@end
