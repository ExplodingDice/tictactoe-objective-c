#ifndef tictactoe_Game_h
#define tictactoe_Game_h

#import "Messenger.h"
#import "Board.h"
#import "Validator.h"
#import "Rulebook.h"
#import "Human.h"
#import "Ai.h"

@interface Game : NSObject

@property (nonatomic) Messenger *messenger;
@property (nonatomic) Board *board;
@property (nonatomic) Validator *validator;
@property (nonatomic) Rulebook *rules;
@property (nonatomic) Human *playerOne;
@property (nonatomic) Ai *playerTwo;

- (id)initWithSettings:(NSDictionary *)settings;
- (void)run;

@end

#endif
