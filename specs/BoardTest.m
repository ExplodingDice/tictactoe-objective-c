#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Board.h"

@interface BoardTest : XCTestCase {
    Board *testBoard;
}
@end

@implementation BoardTest

- (void)setUp {
    [super setUp];
    testBoard = [[Board alloc] init];
}

- (void)tearDown {
    [super tearDown];
    testBoard = nil;
}

- (void)testCreatesABoardOfSize9 {
    [testBoard createBoard:3];

    NSDictionary *gameboard = @{
                                @1: @" ", @2: @" ", @3: @" ",
                                @4: @" ", @5: @" ", @6: @" ",
                                @7: @" ", @8: @" ", @9: @" "
                                };
    
    XCTAssertEqualObjects(testBoard.gameboard, gameboard, "creates a gameboard with 9 cells.");
}

- (void)testCreatesABoardOfSize16 {
    [testBoard createBoard:4];

    NSDictionary *gameboard = @{
                                @1: @" ", @2: @" ", @3: @" ", @4: @" ",
                                @5: @" ", @6: @" ", @7: @" ", @8: @" ",
                                @9: @" ", @10: @" ", @11: @" ", @12: @" ",
                                @13: @" ", @14: @" ", @15: @" ", @16: @" "
                                };
    
    XCTAssertEqualObjects(testBoard.gameboard, gameboard, "creates a gameboard with 16 cells.");
}

- (void)testReturnsTheBoardDimensions {
    [testBoard createBoard:3];

    XCTAssertEqual(testBoard.dimensions, 3, "returns gameboard dimensions.");
}

- (void)testPlacesAPieceOnTheBoard {
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];

    XCTAssertEqualObjects(testBoard.gameboard[@1], @"X", "places a piece on the gameboard.");
}

- (void)testResetsCellOnTheBoard {
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard resetCellAt:@1];
    
    XCTAssertEqualObjects(testBoard.gameboard[@1], @" ", "places a piece on the gameboard.");
}

- (void)testReturnsTrueIfTheCellIsOccupied {
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@5];

    XCTAssertTrue([testBoard isCellOccupied:@5], "evaluates true if a cell is occupied.");
}

- (void)testReturnsFalseIfTheCellIsNotOccupied {
    [testBoard createBoard:3];

    XCTAssertFalse([testBoard isCellOccupied:@4], "evaluates false if a cell is not occupied.");
}

- (void)testAllAvailableCellLocations {
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@8];
    NSArray *keyList = @[@1, @2, @4, @5, @6, @7, @9];

    XCTAssertEqualObjects([testBoard availableCells], keyList, "returns a sorted collection of keys from all available cell locations.");
}

@end
