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
    
    var noData: String {
        let isHebrew = LanguageManager.shared.isHebrew
        
        switch self {
        case .technical:
            return isHebrew ? "אין נתונים טכניים" : "No technical information"
        case .licensing:
            return isHebrew ? "אין נתוני רישוי" : "No licensing information"
        case .safety:
            return isHebrew ? "אין נתוני בטיחות" : "No safety information"
        case .miscellaneous:
            return isHebrew ? "אין מידע נוסף" : "No additional information"
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
    private var emptyView: EmptyView!
    private var currentTab: ResultsTabs = .technical
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Plate360"
        
        loadData()
        setSearchField()
        setTabCollection()
        setResultsTable()
        setEmptyView()
    }
    
    private func loadData() {
        viewModel.onDataUpdated = { [weak self] in
            guard let self = self else { return }
            
            updateContent()
        }
        
        viewModel.onError = { error in
            print("error: \(error)")
        }
    }
    
    private func updateContent() {
        let items = viewModel.displayItems(for: currentTab)
        
        if items.isEmpty {
            resultsTable.isHidden = true
            emptyView.isHidden = false
            emptyView.setMessage(currentTab.noData)
        } else {
            emptyView.isHidden = true
            resultsTable.isHidden = false
            resultsTable.configure(with: items)
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
                updateContent()
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
        
        resultsTable.isHidden = true
    }
    
    private func setEmptyView() {
        emptyView = EmptyView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(emptyView)
        
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: resultsView.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: resultsView.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: resultsView.bottomAnchor)
        ])
    }

    @IBAction func onTapSearch(_ sender: UIButton) {
        guard let searchText = searchField.text else { return }
        tabsView.isHidden = false
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
