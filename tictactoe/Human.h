#ifndef tictactoe_Human_h
#define tictactoe_Human_h

#import "IOttt.h"

@interface Human : NSObject

@property (nonatomic) IOttt *io;

-(id)initWithIO:(IOttt *)io;
-(NSString *)makeMove;
@end

#endif
