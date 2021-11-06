//
//  NewsListViewModelTests.swift
//  IGNewsTests
//
//  Created by subahan on 06/11/21.
//

import XCTest
@testable import IGNews

class NewsListViewModelTests: IGBaseTests {

    let viewModel = NewsListViewModel()
    
    override func setUp() {
        super.setUp()
        viewModel.fetchData { error in
            
        }
    }
    
    func testNumberOfCells() {
        XCTAssertEqual(viewModel.numberOfRows(0), 3)
        XCTAssertEqual(viewModel.numberOfRows(1), 5)
        XCTAssertEqual(viewModel.numberOfRows(2), 5)
    }
    
    func testNumberOfSections(){
        XCTAssertEqual(viewModel.numberOfSections, 3)
    }
    
    func testSectionTitles(){
        XCTAssertEqual(viewModel.titleForSection(0), "Top News")
        XCTAssertEqual(viewModel.titleForSection(1), "Technical Analysis")
        XCTAssertEqual(viewModel.titleForSection(2), "Special Report")
    }
    
    func testArticleAtIndexPath(){
        let article0 = viewModel.article(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(article0?.title, "Crude Oil Price Outlook: WTI Eyes NFPs After OPEC+ Output Decision as Trend Breaks")
        XCTAssertEqual(article0?.description, "Crude oil prices fell despite OPEC+ maintaining output hike trajectories for December. WTI is eyeing US non-farm payrolls as retail positioning offers a bearish contrarian outlook.")
        
        let article1 = viewModel.article(at: IndexPath(row: 1, section: 1))
        XCTAssertEqual(article1?.title, "Gold Price Forecast: Muddling Through the Range - Levels for XAU/USD")
        XCTAssertEqual(article1?.description, "A stronger US Dollar and negative monthly seasonal tendencies leaves gold prices on unstable footing.")
    }
    
}
