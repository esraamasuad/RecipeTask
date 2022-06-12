//
//  SearchView.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import UIKit
import Lottie

class SearchView: BaseView<SearchVM, BaseItem> {
    let searchCellIdintifier = String(describing: SearchListTableViewCell.self)
    let loadingCellIdintifier = String(describing: LoadingTableViewCell.self)
    let filterCellIdintifier = String(describing: FilterCollectionViewCell.self)
    
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
            self.searchTableView.rowHeight = 90
        }
    }
    
    @IBOutlet  var animatedImageView: AnimationView!
    @IBOutlet weak var emptyView: UIView!

    lazy var searchController = UISearchController(searchResultsController: nil)
    
    override func bindind() {
        viewModel = SearchVM(routingManeger: RouterManagerImpl(self))
        viewModel.filterList.bind { (list) in
            self.filterCollectionView.reloadData()
        }
        viewModel.recipesList.bind { (list) in
            self.refreshControl.endRefreshing()
            self.searchTableView.isHidden = list.isEmpty
            if list.isEmpty {self.addAnimation()}
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.searchBar.becomeFirstResponder()
    }
    
    private func buildSearchBar() {
        self.extendedLayoutIncludesOpaqueBars = true
        searchController.obscuresBackgroundDuringPresentation = false
        self.definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        self.searchController.searchBar.barTintColor = .clear
        self.searchController.searchBar.backgroundImage = UIImage()
        searchController.isActive = true
        searchController.searchBar.searchBarStyle = .minimal
   
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.white
            viewModel.searchText.bidirectionalBind(to: textfield.reactive.text)
            textfield.textColor = UIColor.darkGray
            textfield.keyboardType = .asciiCapable
        }
        searchController.searchBar.setValue("cancel".localize(), forKey: "cancelButtonText")
    }
    
    fileprivate func addAnimation() {
        animatedImageView.backgroundColor = UIColor.clear
        animatedImageView.contentMode = .scaleAspectFit
        animatedImageView.loopMode = .loop
        animatedImageView.play()
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

// MARK: - Colection Delegate -
extension SearchView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filterList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellIdintifier, for: indexPath) as! FilterCollectionViewCell
        let filterItem = viewModel.filterList.value[indexPath.row]
        cell.configure(filterItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.reloadData(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

// MARK: - Table Delegate -
extension SearchView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.recipesList.value.count + (viewModel.hasMorePagination ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.hasMorePagination && (indexPath.row >= viewModel.recipesList.value.count){
            let  cell = tableView.dequeueReusableCell(withIdentifier: loadingCellIdintifier, for: indexPath) as! LoadingTableViewCell
            cell.loading.startAnimating()
            return cell
        }
        let  cell = tableView.dequeueReusableCell(withIdentifier: searchCellIdintifier, for: indexPath) as! SearchListTableViewCell
        let recipeItem = viewModel.recipesList.value[indexPath.row].recipe
        cell.configure(recipeItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.hasMorePagination && (indexPath.row >= viewModel.recipesList.value.count) && !viewModel.isLoadigPagination{
            viewModel.searchEndPoint()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.routeToRecipeDetails(indexPath.row)
    }
}

// MARK: - serach delegate -
extension SearchView: UISearchBarDelegate,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.reSearchData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.cancel()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty ?? true {
            viewModel.cancel()
        }
    }
}
