#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Ai.h"
#import "Board.h"

@interface EasyAiTest : XCTestCase

@end

@implementation EasyAiTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReturnsAnAvailableMove {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];

    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];

    Ai *testAi = [[Ai alloc] initWithBoard:testBoard andPlayerPiece:@"X"];

    NSNumber *aiMove = [testAi makeMove];

    XCTAssertTrue([testBoard.availableCells containsObject:aiMove]);
}

- (void)testReturnsThePlayerPiece {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];
    
    Ai *testAi = [[Ai alloc] initWithBoard:testBoard andPlayerPiece:@"X"];
    
    XCTAssertEqualObjects(testAi.playerPiece, @"X");
}

@end
