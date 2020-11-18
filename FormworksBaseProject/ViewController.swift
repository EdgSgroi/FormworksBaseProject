//
//  ViewController.swift
//  FormworksBaseProject
//
//  Created by Edgar Sgroi on 18/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presentForm()
    }

    private func presentForm() {
        // present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: true)
    }
    
    private func getJSON(for resource: String) -> Data? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else { return nil}
        var data: Data?
        do {
            data = try Data(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
        guard let jsonData = data else { return nil }
        
        return jsonData
    }

}

