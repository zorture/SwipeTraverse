//
//  Queue.m
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import "Queue.h"

@implementation Queue

- (instancetype) init{
    self = [super init];
    if (self) {
        self.head = nil;
        self.tail = nil;
        self.free = nil;
        self.count = 0;
    }
    return self;
}


- (void) setHead:(LinkedListNode *)head{
    _head = head;
    __weak __typeof(self) weakSelf = self;
    [_head.contentView setDraggedOut:^(BOOL yes) {
        [weakSelf dequeue];
    }];
 
}


- (void)dequeue{
    LinkedListNode* node = self.head;
    [node.contentView removeFromSuperview];
    [self setHead:node.nextNode];
    node.nextNode = nil;
    self.free = node;
    self.count--;
    self.deQueue(YES);
}

- (DataView*)enqueueWithView:(DataView*)view{
    LinkedListNode* node = [[LinkedListNode alloc] initWithView:view];
    if (!self.head){
        [self setHead:node];
    }
    else
        self.tail.nextNode = node;
    self.tail = node;
    self.count++;
    return node.contentView;
    
}

- (void)printQueue{
    
    LinkedListNode* node = self.head;
    while (node.nextNode) {
        NSLog(@"%@\n",node.string);
        node = node.nextNode;
    }
}

@end
