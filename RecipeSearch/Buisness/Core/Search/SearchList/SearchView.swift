//
//  SearchView.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import UIKit

class SearchView: BaseView<SearchVM, BaseItem> {
    let searchCellIdintifier = String(describing: SearchListTableViewCell.self)
    let loadingCellIdintifier = String(describing: LoadingTableViewCell.self)
    let filterCellIdintifier = String(describing: SearchFilterCollectionViewCell.self)
    
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var filterCollectionView: UICollectionView!{
        didSet{
            self.filterCollectionView.registerCell(idintifier: filterCellIdintifier)
        }
    }
    
    @IBOutlet weak var searchTableView: UITableView!{
        didSet {
            self.searchTableView.registerCell(idintifier: searchCellIdintifier)
            self.searchTableView.registerCell(idintifier: loadingCellIdintifier)
            self.searchTableView.rowHeight = 110
        }
    }
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    var timer: Timer!
    
    override func bindind() {
        viewModel = SearchVM(routingManeger: RouterManagerImpl(self))
        viewModel.filterList.bind { (list) in
            self.filterCollectionView.reloadData()
        }
        viewModel.recipesList.bind { (list) in
            self.refreshControl.endRefreshing()
            //            self.searchTableView.removeNoDataPlaceholder()
            //            if list.count == 0 {
            //                self.searchTableView.setNoDataPlaceholder()
            //            }
            self.searchTableView.reloadData()
        }
        initRefreshController() //add pull to refresh
        viewModel.setData()
        filterCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buildSearchBar()
    }
    
    private func buildSearchBar() {
        // TODO: Search for how to put search bar beside back button.
        self.extendedLayoutIncludesOpaqueBars = true
        searchController.obscuresBackgroundDuringPresentation = false
        self.definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        self.searchController.searchBar.barTintColor = .clear
        self.searchController.searchBar.backgroundImage = UIImage()
        searchController.isActive = true
        searchController.searchBar.searchBarStyle = .minimal
        //   searchController.searchBar.showsBookmarkButton = true
        // searchController.searchBar.setImage(UIImage(named: "filter")!, for: .bookmark, state: .normal)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.white
            viewModel.searchText.bidirectionalBind(to: textfield.reactive.text)
            //  textfield.font = UIFont(name: "Cairo-Regular", size: 14)!
            textfield.textColor = UIColor.darkGray
            //  textfield.placeholder = ""
            textfield.becomeFirstResponder()
        }
        searchController.searchBar.setValue("cancel".localize(), forKey: "cancelButtonText")
    }
    
    func initRefreshController() {
        if #available(iOS 10.0, *) {
            searchTableView.refreshControl = refreshControl
        } else {
            searchTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
    }
    
    @objc private func pullToRefresh(_ sender: Any) {
        viewModel.pullToRefresh.value = true
        viewModel.reloadData()
    }
}

//MARK: - Actions -
extension SearchView{
    @IBAction func filterAction(_ sender: UIButton) {
    }
}

// MARK: - Colection Delegate -
extension SearchView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filterList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellIdintifier, for: indexPath) as! SearchFilterCollectionViewCell
        let filterItem = viewModel.filterList.value[indexPath.row]
        cell.configure(filterItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectNewFilter(indexPath.row)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let w = (collectionView.frame.width/2)-10
    //        return CGSize(width: w, height: w+50)
    //    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

// MARK: - Table Delegate -
extension SearchView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.recipesList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: searchCellIdintifier, for: indexPath) as! SearchListTableViewCell
        let recipeItem = viewModel.recipesList.value[indexPath.row].recipe
        cell.configure(recipeItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.routeToRecipeDetails(indexPath.row)
    }
}

// MARK: - serach delegate -
extension SearchView: UISearchBarDelegate,UISearchResultsUpdating {
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        viewModel.openFilter()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchEndPoint()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // applySearchOnViews(searchQuery: "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // startTimer(searchQuery: searchText)
    }
    
    private func startTimer(searchQuery: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ApplySearch), userInfo: ["SearchQuery": searchQuery], repeats: false)
    }
    
    @objc private func ApplySearch() {
        //        if  let userInfo = timer.userInfo as? [String: String],
        //            let searchQuery = userInfo["SearchQuery"] {
        //          //  applySearchOnViews(searchQuery: searchQuery)
        //        }
    }
    
    private func applySearchOnViews(searchQuery: String) {
        view.endEditing(true)
        viewModel.pullToRefresh.value = true
        viewModel.searchText.value = searchQuery
        viewModel.reloadData()
    }
}
