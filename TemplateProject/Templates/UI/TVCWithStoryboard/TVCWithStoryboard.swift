//
//  TVCWithStoryboard.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 20/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TVCWithStoryboard: UITableViewController {
    private let disposeBag = DisposeBag()
    let viewModel = MVWithStoryboard()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        templateAPIProvider.rx.request(.stream(num:10))
            .filter(statusCode: 200)
            .mapString()
            .subscrib ({resp in
            print(resp)
                
//                let jsonData = resp.data(encoding: .utf8)!
//                let decoder = JSONDecoder()
//                let beer = try! decoder.decode(Beer.self, for: jsonData)

//                re
//
//                let decoder = JSONDecoder()
//                if let red = try? decoder.decode(BasicResponse.self, from: resp.data){
//                    print("oks")
//                }else{
//                    print("soks")
//                }

        }).disposed(by: disposeBag)
        
        
        
        
        
//        viewModel.data.asObservable().bind(onNext: { resp in
//            print(resp)
//        }).disposed(by: disposeBag)
        
//            .bind(to: tableView.rx.items(cellIdentifier: "TVCWithStoryboardCell", cellType: TVCWithStoryboardCell.self))
//            { row, element, cell in
//                //cell.
//                cell.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
//            }.disposed(by: disposeBag)
//
        
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 10
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCWithStoryboardCell", for: indexPath) as! TVCWithStoryboardCell
//
//        cell.lblHeader.text = "ALper"
//        // Configure the cell...
//
//        return cell
//    }
//

}
