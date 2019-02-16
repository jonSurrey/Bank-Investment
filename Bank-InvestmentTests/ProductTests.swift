//
//  ProductTests.swift
//  Bank-InvestmentTests
//
//  Created by Jonathan Martins on 09/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import XCTest
@testable import Bank_Investment

class ProductTests: XCTestCase {
    
    var presenter:ProductPresenterDelegate!
    
    func screenDataMock()->Data{
        let data = "{\n    \"screen\": {\n        \"title\": \"Fundos de investimento\",\n        \"fundName\": \"Vinci Valorem FI Multimercado\",\n        \"whatIs\": \"O que é?\",\n        \"definition\": \"O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.\",\n        \"riskTitle\": \"Grau de risco do investimento\",\n        \"risk\": 4,\n        \"infoTitle\": \"Mais informações sobre o investimento\",\n        \"moreInfo\": {\n            \"month\": {\n                \"fund\": 0.3,\n                \"CDI\": 0.3\n            },\n            \"year\": {\n                \"fund\": 13.01,\n                \"CDI\": 12.08\n            },\n            \"12months\": {\n                \"fund\": 17.9,\n                \"CDI\": 17.6\n            }\n        },\n        \"info\": [\n            {\n                \"name\": \"Taxa de administração\",\n                \"data\": \"0,50%\"\n            },\n            {\n                \"name\": \"Aplicação inicial\",\n                \"data\": \"R$ 10.000,00\"\n            },\n            {\n                \"name\": \"Movimentação mínima\",\n                \"data\": \"R$ 1.000,00\"\n            },\n            {\n                \"name\": \"Saldo mínimo\",\n                \"data\": \"R$ 5.000,00\"\n            },\n            {\n                \"name\": \"Resgate (valor bruto)\",\n                \"data\": \"D+0\"\n            },\n            {\n                \"name\": \"Cota (valor bruto)\",\n                \"data\": \"D+1\"\n            },\n            {\n                \"name\": \"Pagamento (valor bruto)\",\n                \"data\": \"D+2\"\n            }\n        ],\n        \"downInfo\": [\n            {\n                \"name\": \"Essenciais\",\n                \"data\": null\n            },\n            {\n                \"name\": \"Desempenho\",\n                \"data\": null\n            },\n            {\n                \"name\": \"Complementares\",\n                \"data\": null\n            },\n            {\n                \"name\": \"Regulamento\",\n                \"data\": null\n            },\n            {\n                \"name\": \"Adesão\",\n                \"data\": null\n            }\n        ]\n    }\n}".data(using: String.Encoding.utf8)!
        
        return data
    }
    
    func testParseScreenDataIsNotNil(){
        presenter = ProductPresenter()
        let data  = screenDataMock()
        
        presenter.parseInfoData(data)
        
        XCTAssertNotNil(presenter.screen, "screen object should not be nil")
    }
    
    func testNumberOfItemsInSectionsAreGreaterThanZero(){
        presenter = ProductPresenter()
        let data  = screenDataMock()
        
        presenter.parseInfoData(data)
        
        let section1 = presenter.numberOfItems(in: 0)
        let section2 = presenter.numberOfItems(in: 1)
        let section3 = presenter.numberOfItems(in: 2)
        
        XCTAssertGreaterThan(section1, 0, "Items in section 1 should not be 0")
        XCTAssertGreaterThan(section2, 0, "Items in section 2 should not be 0")
        XCTAssertGreaterThan(section3, 0, "Items in section 3 should not be 0")
    }
    
    func testNumberOfSectionsInList(){
        presenter = ProductPresenter()
        let numberOfSections = presenter.numberOfSections
        XCTAssertEqual(numberOfSections, 5, "number of sections is not 5")
    }
}
