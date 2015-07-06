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

@end
