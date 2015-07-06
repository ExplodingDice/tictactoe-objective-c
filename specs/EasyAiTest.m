#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "EasyAi.h"
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

    EasyAi *testAi = [[EasyAi alloc] initWithBoard:testBoard];

    NSNumber *aiMove = [testAi makeMove];

    XCTAssertTrue([testBoard.availableCells containsObject:aiMove], @"returns a move based on available cells.");
}

@end
