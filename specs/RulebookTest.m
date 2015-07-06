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

- (void)testReturnsTheWinningGamePieceIfOneExists {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"X", @"3": @"X",
                            @"4": @" ", @"5": @"O", @"6": @"O",
                            @"7": @" ", @"8": @" ", @"9": @" "
                            };
    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    NSString *winner = [rulebook getWinningPiece];

    XCTAssertEqualObjects(winner, @"X", @"returns the winning game piece if it exists.");
}

- (void)testReturnsNullIfNoWinner {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @" ", @"3": @"X",
                            @"4": @" ", @"5": @"O", @"6": @"O",
                            @"7": @" ", @"8": @" ", @"9": @" "
                            };
    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    NSString *winner = [rulebook getWinningPiece];

    XCTAssertEqualObjects(winner, NULL, @"returns null if a winner does not exist.");
}

- (void)testReturnsTrueIfGameIsADraw {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @"O",
                            @"7": @"O", @"8": @"X", @"9": @"X"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    XCTAssertTrue([rulebook isDraw], @"returns true if the game is a draw.");
}

- (void)testReturnsFalseIfAWinnerIsFound {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @"O",
                            @"7": @"X", @"8": @"X", @"9": @"O"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    XCTAssertFalse([rulebook isDraw], @"returns false if a winner is found.");
}

- (void)testReturnsFalseIfTheBoardIsNotFull {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @" ", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @" ",
                            @"7": @" ", @"8": @"X", @"9": @"O"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    XCTAssertFalse([rulebook isDraw], @"returns false if the board is not full.");
}

- (void)testReturnsTrueIfTheGameIsOverWithAWinner {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"O", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @" ",
                            @"7": @" ", @"8": @"X", @"9": @"O"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    XCTAssertTrue([rulebook gameOver], @"returns true if the game is over with a winner.");
}

- (void)testReturnsTrueIfTheGameIsOverWithADraw {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @"O", @"6": @"O",
                            @"7": @"O", @"8": @"X", @"9": @"X"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    XCTAssertTrue([rulebook gameOver], @"returns true if the game is over with a draw.");
}

- (void)testReturnsFalseIfTheGameIsNotOver {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    testBoard.gameboard = @{
                            @"1": @"X", @"2": @"O", @"3": @"X",
                            @"4": @"X", @"5": @" ", @"6": @"O",
                            @"7": @"O", @"8": @"X", @"9": @"X"
                            };

    Rulebook *rulebook = [[Rulebook alloc] initWithBoard:testBoard];

    XCTAssertFalse([rulebook gameOver], @"returns false if the game is not over.");
}

@end
