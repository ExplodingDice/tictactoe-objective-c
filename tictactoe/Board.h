#ifndef tictactoe_Board_h
#define tictactoe_Board_h

@interface Board : NSObject

@property (nonatomic) NSMutableDictionary *gameboard;
@property (nonatomic) int dimensions;

- (void)createBoard:(int)dimensions;
- (void)placePlayerPiece:(NSString *)playerPiece atCellLocation:(NSNumber *)cellLocation;
- (void)resetCellAt:(NSNumber *)cellLocation;
- (BOOL)isCellOccupied:(NSNumber *)cellLocation;
- (NSArray *)availableCells;

@end

#endif
