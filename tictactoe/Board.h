#ifndef tictactoe_Board_h
#define tictactoe_Board_h

@interface Board : NSObject

@property NSMutableDictionary *gameboard;
@property int dimensions;

- (void)createBoard:(int)dimensions;
- (void)placePlayerPiece:(NSString *)playerPiece atCellLocation:(NSNumber *)cellLocation;
- (BOOL)isCellOccupied:(NSNumber *)cellLocation;
- (NSArray *)availableCells;

@end

#endif
