#import <Foundation/Foundation.h>
#import "Board.h"

@implementation Board : NSObject

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
    self.gameboard = [[NSMutableDictionary alloc] init];
    
    [cellNumbers enumerateIndexesUsingBlock:^(NSUInteger num, BOOL *stop) {
        NSNumber *cellNumber = [NSNumber numberWithInteger:num];
        self.gameboard[cellNumber] = @" ";
    }];
}

- (void)placePlayerPiece:(NSString *)playerPiece atCellLocation:(NSNumber *)cellLocation {
    [self.gameboard setObject:playerPiece forKey:cellLocation];
}

- (BOOL)isCellOccupied:(NSNumber *)cellLocation {
    return (![self.gameboard[cellLocation] isEqualToString:@" "]);
}

- (NSArray*)sortByNumValue:(NSMutableArray *)unsortedCollection {
    return [unsortedCollection sortedArrayUsingDescriptors:
     @[[NSSortDescriptor
        sortDescriptorWithKey:@"intValue"
        ascending:YES]]];
}

- (NSArray*)availableCells {
    NSMutableArray *unsortedAvailableCells = [NSMutableArray array];

    for (id cellLocation in self.gameboard)
    {
        if (![self isCellOccupied:cellLocation])
            [unsortedAvailableCells addObject:cellLocation];
    }

    return [self sortByNumValue:unsortedAvailableCells];
}

@end
