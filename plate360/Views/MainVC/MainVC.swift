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
        switch self {
        case .technical:
            return "results.tabs.title.technical".localized
        case .licensing:
            return "results.tabs.title.licensing".localized
        case .safety:
            return "results.tabs.title.safety".localized
        case .miscellaneous:
            return "results.tabs.title.miscellaneous".localized
        }
    }
    
    var noData: String {
        switch self {
        case .technical:
            return "results.tabs.noData.technical".localized
        case .licensing:
            return "results.tabs.noData.licensing".localized
        case .safety:
            return "results.tabs.noData.safety".localized
        case .miscellaneous:
            return "results.tabs.noData.miscellaneous".localized
        }
    }
}

class MainVC: UIViewController {

    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var appDescription: UILabel!
    @IBOutlet weak var tabsView: UIView!
    @IBOutlet weak var resultsView: UIView!
    
    private let viewModel = SearchViewModel()
    private var tabsCollection: TabsCollection!
    private var resultsTable: ResultsTable!
    private var emptyView: EmptyView!
    private var loaderView: LoaderView!
    private var currentTab: ResultsTabs = .technical
    private var lastSearchedPlateNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTexts()
        loadData()
        setSearchField()
        setTabCollection()
        setResultsTable()
        setEmptyView()
        setLoaderView()
    }
    
    private func setTexts() {
        title = "main.screen.title".localized
        appTitle.text = "main.screen.title".localized
        searchField.placeholder = "main.search.placeholder".localized
        searchButton.setTitle("main.screen.search.button.title".localized, for: .normal)
        appDescription.text = "main.screen.description".localized
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
        loaderView.stopLoading()
        
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
    
    private func setLoaderView() {
        loaderView = LoaderView()
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(loaderView)
        
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: resultsView.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: resultsView.trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: resultsView.bottomAnchor)
        ])
        
        loaderView.isHidden = true
    }

    @IBAction func onTapSearch(_ sender: UIButton) {
        guard let searchText = searchField.text else { return }
        loaderView.startLoading()
        
        lastSearchedPlateNumber = searchText
        currentTab = .technical
        tabsCollection.resetSelection()
        
        tabsView.isHidden = false
        emptyView.isHidden = true
        resultsTable.isHidden = true
        searchButton.isEnabled = false
        
        viewModel.searchVehicle(by: searchText)
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let searchText = textField.text else { return }
        
        let correctNumberOfDigits = !searchText.isEmpty && searchText.count >= 6
        let hasPlateNumberChanged = searchText != lastSearchedPlateNumber
        
        searchButton.isEnabled = correctNumberOfDigits && hasPlateNumberChanged
    }
}

extension MainVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let proposedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return proposedText.count <= 8
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        lastSearchedPlateNumber = nil
        searchButton.isEnabled = false
    }
}
