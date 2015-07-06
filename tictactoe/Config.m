#import <Foundation/Foundation.h>
#import "Config.h"
#import "Board.h"
#import "EasyAi.h"
#import "Human.h"

@implementation Config : NSObject

- (id)initWithIO:(IOttt *)io_
{
    self = [super init];
    if (self) {
        self.io = io_;
    }
    return self;
}

- (Board *)getBoard {
    Board *board = [[Board alloc] init];

    [self.io putOut:@"Choose a board size: "];
    int userInput = [[self.io getIn] intValue];

    [board createBoard:userInput];

    return board;
}

- (EasyAi *)getOpponent:(Board*)board{
   [self.io putOut:@"Choose an opponent ('e' for Easy): "];
    NSString *userInput = [self.io getIn];

    if ([userInput  isEqual: @"e"]) {
        return [[EasyAi alloc] initWithBoard:board];
    }

    return NULL;
}

-(NSDictionary *)getSettings {
    Board *board = [self getBoard];
    EasyAi *opponent = [self getOpponent:board];
    Human *human = [[Human alloc] initWithIO:self.io];

    return @{
                @"board"    : board,
                @"playerOne": human,
                @"playerTwo": opponent,
                @"io"       : self.io
            };
}

@end