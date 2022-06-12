//
//  SearchDetailsView.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import UIKit
import MXParallaxHeader
import LinkPresentation
import SafariServices

class SearchDetailsView: BaseView<SearchDetailsVM, SearchItem> {
    
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ingredientsLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!

    override func bindind() {
        setTransparentNavagtionBar("")
        viewModel = SearchDetailsVM(routingManeger: RouterManagerImpl(self), item.recipe)
        viewModel.title.bind(to: titleLbl)
        viewModel.ingrediente.bind(to: ingredientsLbl)
        viewModel.recipeImage.bind { img in
            self.recipeImg.loadWebImageWithUrl(imageUrl: img)
        }
        setupHeaderView()
        viewModel.setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
 
    func setupHeaderView()  {
        scrollView.parallaxHeader.view = headerView
        scrollView.parallaxHeader.height = 300
        scrollView.parallaxHeader.minimumHeight = 200
        scrollView.parallaxHeader.mode = .fill
        headerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

}

//MARK: - Actions -
extension SearchDetailsView{
    @IBAction func shareUrlAction(_ sender: UIButton) {
        shareLink()
    }
    
    @IBAction func openUrlAction(_ sender: UIButton) {
        openUrl()
    }
}

//MARK: - Share Link -
extension SearchDetailsView {
    func openUrl() {
        let safariVC = SFSafariViewController(url: URL(string: viewModel.url)!)
        present(safariVC, animated: true, completion: nil)
        // safariVC.delegate = self
    }
}

//MARK: - Share Link -
extension SearchDetailsView: UIActivityItemSource {
    func shareLink() {
        let activityViewController = UIActivityViewController(activityItems:  [self], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        self.present(activityViewController, animated: true)
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return ""
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return NSURL(string: viewModel.url)
    }
    
    @available(iOS 13.0, *)
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let image = UIImage(named: "appbg")!
      //  let imageProvider = NSItemProvider(object: cardAsImage)
      //  let url = URL(string: presenter.link)
        
        let metadata = LPLinkMetadata()
        metadata.title = viewModel.title.value ?? ""
       // metadata.imageProvider = imageProvider
        metadata.iconProvider = NSItemProvider(object: image)
//        metadata.url =  url
//        metadata.originalURL = url
        return metadata
    }
}
