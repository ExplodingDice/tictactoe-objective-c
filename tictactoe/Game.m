#import <Foundation/Foundation.h>
#import "Game.h"

@implementation Game : NSObject

-(id)initWithSettings:(NSDictionary *)settings_;
{
    self = [super init];
    if (self) {
        self.messenger = settings_[@"messenger"];
        self.board = settings_[@"board"];
        self.validator = settings_[@"validator"];
        self.rules = settings_[@"rules"];
        self.playerOne = settings_[@"playerOne"];
        self.playerTwo = settings_[@"playerTwo"];
    }
    return self;
}

- (NSString *)currentPiece {
    return [self.rules currentPlayerPiece];
}

- (BOOL)playerOneTurn {
    return self.playerOne.playerPiece == [self currentPiece];
}

- (NSNumber *)getMove {
    if ([self playerOneTurn]) {
        return [self.validator promptForMove:[self.board availableCells]];
    } else {
        return [self.playerTwo makeMove];
    }
}

- (void)determineResults {
    NSString *winningPiece = [self.rules getWinningPiece];
    
    if (winningPiece) {
        [self.messenger winnerFound:winningPiece];
    } else {
        [self.messenger drawGame];
    }
}

- (void)run {
    [self.messenger welcome];
    
    while (![self.rules gameOver]) {
        [self.messenger gameboard:[self.rules rows]];
        [self.board placePlayerPiece:[self currentPiece] atCellLocation:[self getMove]];
    }
    
    [self.messenger gameboard:[self.rules rows]];
    [self determineResults];
}

@end