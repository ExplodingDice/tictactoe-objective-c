#import <Foundation/Foundation.h>
#import "Messenger.h"

@implementation Messenger : NSObject

-(id)initWithIO:(IOttt *)io_
{
    self = [super init];
    if (self) {
        self.io = io_;
    }
    return self;
}

- (void)chooseBoardSize {
    [self.io putOut:@"Choose a board size: (eg. '3' for 3x3)"];
}

- (void)chooseAnOpponent {
    [self.io putOut:@"Choose an opponent ('e' for Easy or 'h' for Hard): "];
}

- (void)makeMove {
    [self.io putOut:@"Make a move: "];
}

- (void)invalidInput {
    [self.io putOut:@"Invalid input."];
}

- (void)invalidOpponent {
    [self.io putOut:@"Invalid opponent selection."];
}

- (void)invalidMove {
    [self.io putOut:@"Invalid move."];
}

- (void)welcome {
    [self.io putOut:@"Welcome to Tic Tac Toe!"];
}

- (void)drawGame {
    [self.io putOut:@"DRAW GAME!"];
}

- (void)winnerFound:(NSString *)winnerPiece {
    NSString *message = [NSString stringWithFormat:@"%@ wins!", winnerPiece];
    
    [self.io putOut:message];
}

- (NSMutableString *)format:(NSArray *)row {
    NSMutableString *message = [NSMutableString string];
    
    for (int i = 0; i < [row count]; i++) {
        [message appendString:row[i]];
        
        if (i != 2)
            [message appendString:@" | "];
    }
    
    return message;
}

- (void)gameboard:(NSArray *)board {
    for (int i = 0; i < [board count]; i++) {
        [self.io putOut:[self format:board[i]]];
         
        if (i != 2)
            [self.io putOut:@"---------"];
    }
    
    [self.io putOut:@"\n\n"];
}

@end