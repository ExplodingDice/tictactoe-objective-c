#ifndef tictactoe_Human_h
#define tictactoe_Human_h

#import "IOttt.h"

@interface Human : NSObject

@property (nonatomic) IOttt *io;
@property (nonatomic) NSString *playerPiece;

-(id)initWithIO:(IOttt *)io andPlayerPiece:(NSString *)playerPiece;
-(NSString *)makeMove;
@end

#endif
