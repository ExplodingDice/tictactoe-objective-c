#import <Foundation/Foundation.h>
#import "Config.h"
#import "Board.h"
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

- (Ai *)getOpponent:(Board*)board{
    NSString *userInput = [self.validator promptForOpponent];

    if ([userInput isEqual: @"e"]) {
        return [[Ai alloc] initWithBoard:board];
    }

    return NULL;
}

-(NSDictionary *)getSettings {
    Board *board = [self getBoard];
    Ai *opponent = [self getOpponent:board];
    Human *human = [[Human alloc] initWithIO:self.io];

    return @{
                @"board"    : board,
                @"playerOne": human,
                @"playerTwo": opponent,
                @"io"       : self.io,
                @"validator": self.validator
            };
}

@end