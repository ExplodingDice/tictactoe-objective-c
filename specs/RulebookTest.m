#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Rulebook.h"
#import "Board.h"

@interface RulebookTest : XCTestCase

@end

@implementation RulebookTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReturnsPlayerOneOnEvenCellCount {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertEqualObjects([rulebook currentPlayerPiece], @"X");
}

- (void)testReturnsPlayerTwoOnOddCellCount {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@1];
    
    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    
    XCTAssertEqualObjects([rulebook currentPlayerPiece], @"O");
}

- (void)testReturnsTheWinningGamePieceIfOneExists {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"X" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    NSString *winner = [rulebook getWinningPiece];

    XCTAssertEqualObjects(winner, @"X");
}

- (void)testReturnsNullIfNoWinner {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    NSString *winner = [rulebook getWinningPiece];

    XCTAssertEqualObjects(winner, NULL);
}

- (void)testReturnsTrueIfGameIsADraw {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertTrue([rulebook isDraw]);
}

- (void)testReturnsFalseIfAWinnerIsFound {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"X" atCellLocation:@7];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"O" atCellLocation:@9];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertFalse([rulebook isDraw]);
}

- (void)testReturnsFalseIfTheBoardIsNotFull {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"O" atCellLocation:@9];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertFalse([rulebook isDraw]);
}

- (void)testReturnsTrueIfTheGameIsOverWithAWinner {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@1];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"O" atCellLocation:@9];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertTrue([rulebook gameOver]);
}

- (void)testReturnsTrueIfTheGameIsOverWithADraw {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertTrue([rulebook gameOver]);
}

- (void)testReturnsFalseIfTheGameIsNotOver {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertFalse([rulebook gameOver]);
}

@end
