#ifndef tictactoe_HardAi_h
#define tictactoe_HardAi_h

#import "Ai.h"
#import "Rulebook.h"

@interface HardAi : Ai

@property (nonatomic) Rulebook *rulebook;

-(id)initWithBoard:(Board *)board Rulebook:(Rulebook *)rulebook andPlayerPiece:(NSString *)playerPiece;
- (NSNumber *)makeMove;

@end


#endif

