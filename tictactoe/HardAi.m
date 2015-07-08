#import <Foundation/Foundation.h>
#import "HardAi.h"

@implementation HardAi : Ai

-(id)initWithBoard:(Board *)board_ Rulebook:(Rulebook *)rulebook_ andPlayerPiece:(NSString *)playerPiece_;
{
    self = [super init];
    if (self) {
        self.board = board_;
        self.rulebook = rulebook_;
        self.playerPiece = playerPiece_;
    }
    return self;
}

- (BOOL)aiTurn {
    return [self.rulebook currentPlayerPiece] == self.playerPiece;
}

- (BOOL)aiWins {
    return [self.rulebook getWinningPiece] == self.playerPiece;
}

- (int)gameStateScoring:(int)depth {
    if ([[self rulebook] isDraw]) {
        return 0;
    } else if ([self aiWins]) {
        return 10 - depth;
    } else {
        return depth - 10;
    }
}

- (NSNumber *)getMinScoreFrom:(NSArray *)scoreValues {
    return [scoreValues valueForKeyPath:@"@min.self"];
}

- (NSNumber *)getMaxScoreFrom:(NSArray *)scoreValues {
    return [scoreValues valueForKeyPath:@"@max.self"];
}

- (NSNumber *)bestScoreFrom:(NSMutableDictionary *)scores {
    if ([self aiTurn]) {
        return [self getMaxScoreFrom:[scores allValues]];
    } else {
        return [self getMinScoreFrom:[scores allValues]];
    }
}

- (NSNumber *)bestMoveFrom:(NSMutableDictionary *)scores {
    NSArray *sortedKeysArray = [scores keysSortedByValueUsingSelector:@selector(compare:)];
    
    if ([self aiTurn]) {
        return [sortedKeysArray lastObject];
    } else {
        return [sortedKeysArray firstObject];
    }
}

- (NSNumber *)minimax:(NSMutableDictionary *)scores withDepth:(int)depth {
    if ([[self rulebook] gameOver])
        return [NSNumber numberWithInt:[self gameStateScoring:depth]];

    for (NSNumber *cell in self.board.availableCells) {
        [self.board placePlayerPiece:[self.rulebook currentPlayerPiece] atCellLocation:cell];
        scores[cell] = [self minimax:[[NSMutableDictionary alloc] init] withDepth:depth + 1];
        [self.board resetCellAt:cell];
    }
    
    if (depth == 0) {
        return [self bestMoveFrom:scores];
    } else {
        return [self bestScoreFrom:scores];
    }
}

- (NSNumber *)makeMove {
    return [self minimax:[[NSMutableDictionary alloc] init] withDepth:0];
}

@end