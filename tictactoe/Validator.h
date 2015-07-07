#ifndef tictactoe_Validator_h
#define tictactoe_Validator_h

#import "IOttt.h"

@interface Validator : NSObject

@property (nonatomic) IOttt *io;

- (id)initWithIO:(IOttt *)io;
- (int)promptForBoardSize;
- (NSString *)promptForOpponent:(NSArray *)choices;
- (NSNumber *)promptForMove:(NSArray *)choices;

@end

#endif
