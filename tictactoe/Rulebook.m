#import <Foundation/Foundation.h>
#import "Rulebook.h"

@implementation Rulebook : NSObject

-(id)initWithBoard:(Board *)board_
{
    self = [super init];
    if (self) {
        self.board = board_;
    }
    return self;
}

- (NSMutableArray *)gameboardToArray {
    NSMutableArray *boardValues = [NSMutableArray array];

    for (NSNumber *key in [[[self board].gameboard allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
        [boardValues addObject:[self board].gameboard[key]];
    }

    return boardValues;
}

- (NSMutableArray *)rows {
    NSMutableArray *rows = [NSMutableArray array];
    
    int itemsRemaining = [[self gameboardToArray] count];
    int currentIndex = 0;

    while(currentIndex < [[self gameboardToArray] count]) {
        NSRange range = NSMakeRange(currentIndex, MIN([self board].dimensions, itemsRemaining));
        NSArray *row = [[self gameboardToArray] subarrayWithRange:range];
        [rows addObject:row];
        itemsRemaining-=range.length;
        currentIndex+=range.length;
    }

    return rows;
}

- (NSMutableArray *)column:(int)xIndex {
    NSMutableArray *column = [NSMutableArray array];
    for (int yIndex = 0; yIndex < [self board].dimensions; yIndex++) {
        [column addObject:[self rows][yIndex][xIndex]];
    }

    return column;
}

- (NSMutableArray *)columns {
    NSMutableArray *columns = [NSMutableArray array];

    for (int xIndex = 0; xIndex < [self board].dimensions; xIndex++)
    {
        [columns addObject:[self column:xIndex]];
    }

    return columns;
}

- (NSArray *)leftDiagonal {
    NSMutableArray *leftDiagonal = [NSMutableArray array];
    
    for (int xIndex = 0; xIndex < [self board].dimensions; xIndex++) {
        [leftDiagonal addObject:[self rows][xIndex][xIndex]];
    }

    return leftDiagonal;
}

- (NSArray *)rightDiagonal {
    NSMutableArray *rightDiagonal = [NSMutableArray array];
    int yIndex = [self board].dimensions;

    for (int xIndex = 0; xIndex < [self board].dimensions; xIndex++) {
        yIndex--;
        [rightDiagonal addObject:[self rows][xIndex][yIndex]];
    }

    return rightDiagonal;
}

- (NSArray *)diagonals {
    return @[[self leftDiagonal], [self rightDiagonal]];
}

- (NSArray *)possibilities {
    NSArray *rowsColumns = [[self rows] arrayByAddingObjectsFromArray:[self columns]];
    NSArray *allPossibilities = [rowsColumns arrayByAddingObjectsFromArray:[self diagonals]];

    return allPossibilities;
}

- (NSArray *)removeDuplicatesIn:(NSArray *)subspace {
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:subspace];
    return [orderedSet array];
}

- (NSString *)getWinningPiece {
    NSString *winner;
    
    for (NSArray *possibility in [self possibilities]) {
        NSArray *uniqueSubspace = [self removeDuplicatesIn:possibility];

        if ([uniqueSubspace count] == 1 && ![uniqueSubspace[0] isEqual: @" "]) {
            winner = possibility[0];
        }
    }

    return winner;
}


@end