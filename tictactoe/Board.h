#ifndef tictactoe_Board_h
#define tictactoe_Board_h

@interface Board : NSObject

@property NSMutableDictionary *gameboard;

- (void)createBoard:(int)dimensions;
- (void)placePlayerPiece:(NSString*)playerPiece atCellLocation:(NSNumber*)cellLocation;
- (BOOL)isCellOccupied:(NSNumber*)cellLocation;

@end

#endif
