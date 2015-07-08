#ifndef tictactoe_EasyAi_h
#define tictactoe_EasyAi_h

#import "Board.h"

@interface Ai : NSObject

@property (nonatomic) Board *board;
@property (nonatomic) NSString *playerPiece;

-(id)initWithBoard:(Board *)board andPlayerPiece:(NSString *)playerPiece;
- (NSNumber *)makeMove;

@end

#endif
