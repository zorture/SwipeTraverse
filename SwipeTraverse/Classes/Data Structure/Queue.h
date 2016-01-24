//
//  Queue.h
//  
//
//  Created by Kanwar Zorawar Singh Rana on 12/1/15.
//
//

#import <Foundation/Foundation.h>
#import "LinkedListNode.h"

@interface Queue : NSObject

// Head or first element of the Q Data Structure.
@property (nonatomic, strong) LinkedListNode* head;
// Tail or the last element of the Q Data Structure.
@property (nonatomic, strong) LinkedListNode* tail;
// Free node that can be used and added into the Q Data Structure
@property (nonatomic, strong) LinkedListNode* free;
// Total nodes in the Q data Structure
@property (nonatomic, assign) int count;

// Adding the node in the Q Data Structure
@property (nonatomic, copy) void (^enQueue)(BOOL value);
// Removind the node from the Q Dtat Structure
@property (nonatomic, copy) void (^deQueue)(BOOL value);

- (DataView*)enqueueWithView:(DataView*)view;
- (void)dequeue;
- (void)printQueue;
@end
