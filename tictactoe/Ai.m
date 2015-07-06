#import <Foundation/Foundation.h>
#import "Ai.h"

@implementation Ai : NSObject

-(id)initWithBoard:(Board *)board_
{
    self = [super init];
    if (self) {
        self.board = board_;
    }
    return self;
}

-(NSArray *)availableBoardCells {
    return [self.board availableCells];
}

-(NSUInteger)getRandomIndex {
    return arc4random() % [[self availableBoardCells] count];
}

-(NSNumber *)makeMove {
    return [self availableBoardCells][[self getRandomIndex]];
}

@end