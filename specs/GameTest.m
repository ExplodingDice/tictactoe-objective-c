#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Game.h"
#import "IOMock.h"
#import "Validator.h"
#import "Board.h"
#import "Rulebook.h"
#import "Ai.h"
#import "HardAi.h"
#import "Human.h"


@interface GameTest : XCTestCase

@end

@implementation GameTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWinsTheGame {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:messenger];
    Board *testBoard = [[Board alloc] init];
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    Human *testHuman = [[Human alloc] initWithIO:ioMock andPlayerPiece:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    ioMock.outputs = [NSMutableArray array];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@5];
    [testBoard placePlayerPiece:@"O" atCellLocation:@9];
    [testBoard placePlayerPiece:@"O" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@8];
    
    NSDictionary *settings = @{
                              @"messenger": messenger,
                              @"board"    : testBoard,
                              @"playerOne": testHuman,
                              @"playerTwo": testAi,
                              @"validator": validator,
                              @"rules": testRules
                              };
    
    Game *game = [[Game alloc] initWithSettings:settings];
    [game run];
    
    XCTAssertTrue([ioMock.outputs containsObject:@"X wins!"]);
}

- (void)testGameEndsInDraw {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:messenger];
    Board *testBoard = [[Board alloc] init];
    Rulebook *testRules = [[Rulebook alloc] initWithBoard:testBoard PlayerOne:@"X" andPlayerTwo:@"O"];
    Human *testHuman = [[Human alloc] initWithIO:ioMock andPlayerPiece:@"O"];
    HardAi *testAi = [[HardAi alloc] initWithBoard:testBoard Rulebook:testRules andPlayerPiece:@"X"];
    
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"9"];
    ioMock.inputs = testInputs;
    ioMock.outputs = [NSMutableArray array];
    [testBoard createBoard:3];
    
    [testBoard placePlayerPiece:@"X" atCellLocation:@1];
    [testBoard placePlayerPiece:@"X" atCellLocation:@3];
    [testBoard placePlayerPiece:@"X" atCellLocation:@5];
    [testBoard placePlayerPiece:@"X" atCellLocation:@8];
    [testBoard placePlayerPiece:@"O" atCellLocation:@2];
    [testBoard placePlayerPiece:@"O" atCellLocation:@4];
    [testBoard placePlayerPiece:@"O" atCellLocation:@6];
    [testBoard placePlayerPiece:@"O" atCellLocation:@7];
    
    NSDictionary *settings = @{
                               @"messenger": messenger,
                               @"board"    : testBoard,
                               @"playerOne": testHuman,
                               @"playerTwo": testAi,
                               @"validator": validator,
                               @"rules": testRules
                               };
    
    Game *game = [[Game alloc] initWithSettings:settings];
    [game run];
    
    XCTAssertTrue([ioMock.outputs containsObject:@"DRAW GAME!"]);
}

@end
