#import <Foundation/Foundation.h>
#import "Board.h"

@implementation Board : NSObject

// This is where you can define functions and properties
- (NSMutableDictionary*)gameboard {
    return _gameboard;
}

- (int)calculateSizeBasedOn:(int)dimensions {
    return pow(dimensions, 2);
}

- (NSIndexSet*)getAllCellNumbers:(int)dimensions {
    int size = [self calculateSizeBasedOn:dimensions];
    
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, size)];
}

- (void)createBoard:(int)dimensions {
    NSIndexSet *cellNumbers = [self getAllCellNumbers:dimensions];
    _gameboard = [[NSMutableDictionary alloc] init];
    
    [cellNumbers enumerateIndexesUsingBlock:^(NSUInteger num, BOOL *stop) {
        NSNumber *cellNumber = [NSNumber numberWithInteger:num];
        _gameboard[cellNumber] = @" ";
    }];
}

@end
