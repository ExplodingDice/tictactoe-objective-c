#ifndef tictactoe_Rulebook_h
#define tictactoe_Rulebook_h

#import "Board.h"

@interface Rulebook : NSObject

@property (nonatomic) Board *board;
@property (nonatomic) NSString *playerOne;
@property (nonatomic) NSString *playerTwo;

- (id)initWithBoard:(Board *)board PlayerOne:(NSString *)playerOne andPlayerTwo:(NSString *)playerTwo;
- (NSMutableArray *)rows;
- (NSString *)currentPlayerPiece;
- (NSString *)getWinningPiece;
- (BOOL)isDraw;
- (BOOL)gameOver;

@end


#endif
