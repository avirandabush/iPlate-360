//
//  ViewController.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import UIKit

enum ResultsTabs: String, CaseIterable {
    case technical = "Technical"
    case licensing = "Licensing"
    case safety = "Safety"
    case miscellaneous = "Miscellaneous"
    case history = "History"
}

class MainVC: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tabsView: UIView!
    
    private let viewModel = SearchViewModel()
    private var tabsCollection: TabsCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Plate360"
        
        searchField.delegate = self
        searchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        tabsCollection = TabsCollection()
        tabsCollection?.translatesAutoresizingMaskIntoConstraints = false
        tabsCollection?.configure(with: ResultsTabs.allCases.map { $0.rawValue })
        tabsView.addSubview(tabsCollection)
        
        NSLayoutConstraint.activate([
            tabsCollection.topAnchor.constraint(equalTo: tabsView.topAnchor),
            tabsCollection.leadingAnchor.constraint(equalTo: tabsView.leadingAnchor),
            tabsCollection.trailingAnchor.constraint(equalTo: tabsView.trailingAnchor),
            tabsCollection.bottomAnchor.constraint(equalTo: tabsView.bottomAnchor)
        ])
        
        viewModel.onDataUpdated = { [weak self] in
            guard let self = self else { return }
            
            print(self.viewModel.vehicles.count)
            print(self.viewModel.vehicles.map{ $0.tradeName })
            print(self.viewModel.vehicles)
        }
        
        viewModel.onError = { error in
            print("error: \(error)")
        }
    }

    @IBAction func onTapSearch(_ sender: UIButton) {
        guard let searchText = searchField.text else { return }
        viewModel.searchVehicle(by: searchText)
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let searchText = textField.text else { return }
        searchButton.isEnabled = !searchText.isEmpty && searchText.count >= 6
    }
}

extension MainVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let proposedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return proposedText.count <= 8
    }
}
