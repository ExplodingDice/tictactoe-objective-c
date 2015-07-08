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
    testBoard.gameboard = @{
                            @"1": @" ", @"2": @" ", @"3": @" ",
                            @"4": @" ", @"5": @" ", @"6": @" ",
                            @"7": @" ", @"8": @" ", @"9": @" "
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertEqualObjects([rulebook currentPlayerPiece], @"O");
}

- (void)testReturnsPlayerTwoOnOddCellCount {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"O", @"2": @" ", @"3": @" ",
                            @"4": @" ", @"5": @" ", @"6": @" ",
                            @"7": @" ", @"8": @" ", @"9": @" "
                            };
    
    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    
    XCTAssertEqualObjects([rulebook currentPlayerPiece], @"X");
}

- (void)testReturnsTheWinningGamePieceIfOneExists {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"X", @"3": @"X",
                            @"4": @" ", @"5": @"O", @"6": @"O",
                            @"7": @" ", @"8": @" ", @"9": @" "
                            };
    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    NSString *winner = [rulebook getWinningPiece];

    XCTAssertEqualObjects(winner, @"X");
}

- (void)testReturnsNullIfNoWinner {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @" ", @"3": @"X",
                            @"4": @" ", @"5": @"O", @"6": @"O",
                            @"7": @" ", @"8": @" ", @"9": @" "
                            };
    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    NSString *winner = [rulebook getWinningPiece];

    XCTAssertEqualObjects(winner, NULL);
}

- (void)testReturnsTrueIfGameIsADraw {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @"O",
                            @"7": @"O", @"8": @"X", @"9": @"X"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertTrue([rulebook isDraw]);
}

- (void)testReturnsFalseIfAWinnerIsFound {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @"O",
                            @"7": @"X", @"8": @"X", @"9": @"O"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertFalse([rulebook isDraw]);
}

- (void)testReturnsFalseIfTheBoardIsNotFull {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @" ", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @" ",
                            @"7": @" ", @"8": @"X", @"9": @"O"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertFalse([rulebook isDraw]);
}

- (void)testReturnsTrueIfTheGameIsOverWithAWinner {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"O", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @" ",
                            @"7": @" ", @"8": @"X", @"9": @"O"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertTrue([rulebook gameOver]);
}

- (void)testReturnsTrueIfTheGameIsOverWithADraw {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @"O",
                            @"7": @"O", @"8": @"X", @"9": @"X"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertTrue([rulebook gameOver]);
}

- (void)testReturnsFalseIfTheGameIsNotOver {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @" ", @"6": @"O",
                            @"7": @"O", @"8": @"X", @"9": @"X"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];

    XCTAssertFalse([rulebook gameOver]);
}

@end
