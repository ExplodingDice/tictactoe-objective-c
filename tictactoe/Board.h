#ifndef tictactoe_Board_h
#define tictactoe_Board_h

@interface Board : NSObject

// this is where you can declare what is public
// (-) is an instance method, (+) is a class method

@property NSMutableDictionary *gameboard;

- (void)createBoard:(int)dimensions;

@end


#endif
