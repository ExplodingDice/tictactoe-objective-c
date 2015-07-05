#ifndef tictactoe_IOMock_h
#define tictactoe_IOMock_h

#import "IOttt.h"

@interface IOMock : IOttt

@property NSMutableArray *inputs;
@property NSMutableArray *outputs;

@end

#endif
