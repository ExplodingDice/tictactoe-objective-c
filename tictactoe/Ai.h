#ifndef tictactoe_EasyAi_h
#define tictactoe_EasyAi_h

#import "Board.h"

@interface Ai : NSObject

@property (nonatomic) Board *board;

-(id)initWithBoard:(Board *)board;
- (NSNumber *)makeMove;

@end

#endif
