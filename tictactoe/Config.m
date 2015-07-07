#import <Foundation/Foundation.h>
#import "Config.h"
#import "Board.h"
#import "Rulebook.h"
#import "HardAi.h"
#import "Ai.h"
#import "Human.h"

@implementation Config : NSObject

- (id)initWithIO:(IOttt *)io_ andValidator:(Validator *)validator_
{
    self = [super init];
    if (self) {
        self.io = io_;
        self.validator = validator_;
    }
    return self;
}

- (Board *)getBoard {
    Board *board = [[Board alloc] init];

    int userInput = [self.validator promptForBoardSize];

    [board createBoard:userInput];

    return board;
}

- (Ai *)getOpponent:(Board *)board withRules:(Rulebook *)rules andPlayerPiece:(NSString *)playerPiece{
    NSString *userInput = [self.validator promptForOpponent:@[@"e", @"h"]];

    if ([userInput isEqual: @"e"]) {
        return [[Ai alloc] initWithBoard:board andPlayerPiece:playerPiece];
    } else if ([userInput isEqual:@"h"]) {
        return [[HardAi alloc] initWithBoard:board Rulebook:rules andPlayerPiece:playerPiece];
    }

    return NULL;
}

-(NSDictionary *)getSettings {
    Board *board = [self getBoard];
    Rulebook *rules = [[Rulebook alloc] initWithBoard:board PlayerOne:@"O" andPlayerTwo:@"X"];
    Human *human = [[Human alloc] initWithIO:self.io andPlayerPiece:rules.playerOne];
    Ai *opponent = [self getOpponent:board withRules:rules andPlayerPiece:rules.playerTwo];

    return @{
                @"board"    : board,
                @"playerOne": human,
                @"playerTwo": opponent,
                @"io"       : self.io,
                @"validator": self.validator,
                @"rules"    : rules
            };
}

@end