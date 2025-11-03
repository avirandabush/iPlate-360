//
//  ViewController.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import UIKit

enum ResultsTabs: String, CaseIterable {
    case technical
    case licensing
    case safety
    case miscellaneous
    
    var title: String {
        let isHebrew = LanguageManager.shared.isHebrew
        
        switch self {
        case .technical:
            return isHebrew ? "טכני" : "Technical"
        case .licensing:
            return isHebrew ? "רישוי" : "Licensing"
        case .safety:
            return isHebrew ? "בטיחות" : "Safety"
        case .miscellaneous:
            return isHebrew ? "שונות" : "Miscellaneous"
        }
    }
}

class MainVC: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tabsView: UIView!
    @IBOutlet weak var resultsView: UIView!
    
    private let viewModel = SearchViewModel()
    private var tabsCollection: TabsCollection!
    private var resultsTable: ResultsTable!
    private var currentTab: ResultsTabs = .technical
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Plate360"
        
        loadData()
        setSearchField()
        setTabCollection()
        setResultsTable()
    }
    
    private func loadData() {
        viewModel.onDataUpdated = { [weak self] in
            guard let self = self else { return }
            
            let items = viewModel.displayItems(for: currentTab)
            self.resultsTable.configure(with: items)
        }
        
        viewModel.onError = { error in
            print("error: \(error)")
        }
    }
    
    private func setSearchField() {
        searchField.delegate = self
        searchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setTabCollection() {
        tabsCollection = TabsCollection()
        tabsCollection?.translatesAutoresizingMaskIntoConstraints = false
        tabsCollection?.configure(with: ResultsTabs.allCases.map { $0.title })
        tabsView.addSubview(tabsCollection)
        
        tabsCollection.onTabSelected = { [weak self] index in
            if let self = self {
                currentTab = ResultsTabs.allCases[index]
                let items = viewModel.displayItems(for: currentTab)
                self.resultsTable.configure(with: items)
            }
        }
        
        NSLayoutConstraint.activate([
            tabsCollection.topAnchor.constraint(equalTo: tabsView.topAnchor),
            tabsCollection.leadingAnchor.constraint(equalTo: tabsView.leadingAnchor),
            tabsCollection.trailingAnchor.constraint(equalTo: tabsView.trailingAnchor),
            tabsCollection.bottomAnchor.constraint(equalTo: tabsView.bottomAnchor)
        ])
    }
    
    private func setResultsTable() {
        resultsTable = ResultsTable()
        resultsTable.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(resultsTable)
        
        NSLayoutConstraint.activate([
            resultsTable.topAnchor.constraint(equalTo: resultsView.topAnchor),
            resultsTable.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor),
            resultsTable.trailingAnchor.constraint(equalTo: resultsView.trailingAnchor),
            resultsTable.bottomAnchor.constraint(equalTo: resultsView.bottomAnchor)
        ])
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
