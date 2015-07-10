#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "HardAi.h"

@interface HardAiTest : XCTestCase

@end

@implementation HardAiTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testBlocksAColumnWin {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@4];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];

    XCTAssertEqualObjects([testRules currentPlayerPiece], @"O");
    XCTAssertEqualObjects([testAi makeMove], @6);
}

- (void)testBlocksARowWin {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    XCTAssertEqualObjects([testRules currentPlayerPiece], @"X");
    XCTAssertEqualObjects([testAi makeMove], @5);
}

- (void)testBlocksADiagonalWin {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"O" atCellLocation:@9];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@7];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    XCTAssertEqualObjects([testRules currentPlayerPiece], @"O");
    XCTAssertEqualObjects([testAi makeMove], @5);
}

- (void)testChoosesMoveForAColumnWin {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"X" atCellLocation:@5];
    [testBoard placePlayerPiece:@"X" atCellLocation:@7];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    XCTAssertEqualObjects([testRules currentPlayerPiece], @"O");
    XCTAssertEqualObjects([testAi makeMove], @9);
}

- (void)testChoosesMoveForARowWin {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@1];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];
    [testBoard placePlayerPiece:@"X" atCellLocation:@5];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    XCTAssertEqualObjects([testRules currentPlayerPiece], @"O");
    XCTAssertEqualObjects([testAi makeMove], @3);
}

- (void)testChoosesMoveForADiagonalWin {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@3];
    [testBoard placePlayerPiece:@"O" atCellLocation:@5];
    [testBoard placePlayerPiece:@"X" atCellLocation:@9];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    XCTAssertEqualObjects([testRules currentPlayerPiece], @"O");
    XCTAssertEqualObjects([testAi makeMove], @7);
}

- (void)testChoosesTheBestMoveForAHigherChanceOfWinning {
    Board *testBoard = [[Board alloc] init];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@4];
    
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"O" andPlayerTwo:@"X"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];

    XCTAssertEqualObjects([testRules currentPlayerPiece], @"O");
    XCTAssertEqualObjects([testAi makeMove], @8);
}

@end
