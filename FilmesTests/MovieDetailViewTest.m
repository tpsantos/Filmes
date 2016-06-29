//
//  MovieDetailViewTest.m
//  Filmes
//
//  Created by Thiago Santos on 29/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MovieDetailView.h"

@interface MovieDetailViewTest : XCTestCase

@property (nonatomic) MovieDetailView *movieHeaderDetail;

@end

@implementation MovieDetailViewTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.movieHeaderDetail = [[MovieDetailView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testImageUrlEmpty{

    NSString *url = [self.movieHeaderDetail getImageUrlWithPath:@""];
    NSLog(@"url: %@", url);
    
    XCTAssertEqualObjects(url, @"", @"Url is empty");
}

- (void)testImageUrlNil{
    
    NSString *url = [self.movieHeaderDetail getImageUrlWithPath:nil];
    NSLog(@"url: %@", url);
    
    XCTAssertEqualObjects(url, @"", @"Url is nil");
}

- (void)testImageUrlComplete{
    
    NSString *path = @"/oQWWth5AOtbWG9o8SCAviGcADed.jpg";
    NSString *completeUrl = @"http://image.tmdb.org/t/p/w185/oQWWth5AOtbWG9o8SCAviGcADed.jpg";
    NSString *url = [self.movieHeaderDetail getImageUrlWithPath:path];
    
    XCTAssertEqualObjects(url, completeUrl, @"Url is correct");
}

- (void)testDateEmpty{
    
    NSString *date = [self.movieHeaderDetail formatDate:@""];
    NSLog(@"date: %@", date);
    
    XCTAssertEqualObjects(date, @"0", @"Date is empty");
}

- (void)testGenreEmpty{
    
    NSString *genre = [self.movieHeaderDetail getGenreWithArray:@[]];
    XCTAssertEqualObjects(genre, @"", @"Genre is empty");
}

- (void)testGenreNil{
    
    NSString *genre = [self.movieHeaderDetail getGenreWithArray:nil];
    XCTAssertEqualObjects(genre, @"", @"Genre is nil");
}




@end
