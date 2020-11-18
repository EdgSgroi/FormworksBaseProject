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
        view.backgroundColor = .white
        addButtonView()
        presentForm()
    }
    
    @objc private func presentForm() {
        navigationController?.pushViewController(TestViewController(), animated: true)
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
    
    private func addButtonView() {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .red
        button.setTitle("Open Form", for: .normal)
        button.layer.cornerRadius = 20
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(presentForm), for: .touchDown)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 70),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

