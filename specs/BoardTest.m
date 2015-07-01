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

- (void)testPlacesAPieceOnTheBoard {
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];

    XCTAssertEqualObjects(testBoard.gameboard[@1], @"X", "places a piece on the gameboard.");
}

@end
