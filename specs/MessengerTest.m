#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Messenger.h"
#import "IOMock.h"

@interface MessengerTest : XCTestCase

@end

@implementation MessengerTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testDisplaysAMessageToChooseAnOpponent {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger chooseAnOpponent];
    
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"Choose an opponent ('e' for Easy or 'h' for Hard): "]);
}

- (void)testDisplaysAMessageToMakeAMove {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger makeMove];
    
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"Make a move: "]);
}

- (void)testAnInvalidInputMessage {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger invalidInput];
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"Invalid input."]);
}

- (void)testAnInvalidOpponentMessage {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger invalidOpponent];
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"Invalid opponent selection."]);
}

- (void)testAnInvalidMoveMessage {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger invalidMove];
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"Invalid move."]);
}

- (void)testDisplaysAWelcomeMessage {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger welcome];
    
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"Welcome to Tic Tac Toe!"]);
}

- (void)testDisplaysADrawGameMessage {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger drawGame];
    
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"DRAW GAME!"]);
}

- (void)testDisplaysAWinnerFoundMessage {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger winnerFound:@"X"];
    
    
    XCTAssertEqualObjects(ioMock.outputs, @[@"X wins!"]);
}

- (void)testDisplaysA3x3Gameboard {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    [messenger gameboard:@[@[@"1", @" ", @" "],
                           @[@" ", @"2", @" "],
                           @[@" ", @" ", @"3"]]];
    
    NSArray *expectedOutput = @[@"1 |   |  ",
                                @"---------",
                                @"  | 2 |  ",
                                @"---------",
                                @"  |   | 3", @"\n\n"];
    
    XCTAssertEqualObjects(ioMock.outputs, expectedOutput);
}

@end
