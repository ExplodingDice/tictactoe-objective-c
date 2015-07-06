#ifndef tictactoe_Rulebook_h
#define tictactoe_Rulebook_h

#import "Board.h"

@interface Rulebook : NSObject

@property (nonatomic) Board *board;

- (id)initWithBoard:(Board *)board;
- (NSString *)getWinningPiece;

@end


#endif
