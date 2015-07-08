#ifndef tictactoe_Validator_h
#define tictactoe_Validator_h

#import "IOttt.h"
#import "Messenger.h"

@interface Validator : NSObject

@property (nonatomic) IOttt *io;
@property (nonatomic) Messenger *messenger;

- (id)initWithIO:(IOttt *)io andMessenger:(Messenger *)messenger;
- (int)promptForBoardSize;
- (NSString *)promptForOpponent:(NSArray *)choices;
- (NSNumber *)promptForMove:(NSArray *)choices;

@end

#endif
