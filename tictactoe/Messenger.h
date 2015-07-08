#ifndef tictactoe_Messenger_h
#define tictactoe_Messenger_h
#import "IOttt.h"

@interface Messenger : NSObject

@property (nonatomic) IOttt *io;

- (id)initWithIO:(IOttt *)io;
- (void)chooseBoardSize;
- (void)chooseAnOpponent;
- (void)makeMove;
- (void)invalidInput;
- (void)invalidOpponent;
- (void)invalidMove;
- (void)welcome;
- (void)drawGame;
- (void)winnerFound:(NSString *)winnerPiece;
- (void)gameboard:(NSArray *)board;

@end

#endif
