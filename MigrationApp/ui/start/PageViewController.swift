//
//  PageViewController.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    lazy var viewConrollerList: [UIViewController] = {
        return [self.getVC(identifier: "langPickViewId"),
                self.getVC(identifier: "regionPickViewId")]
    }()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = viewConrollerList.first {
            setViewControllers([firstVC],
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
        configurePageControl()
    }
    
    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = viewConrollerList.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func getVC(identifier: String) -> UIViewController {
        return UIStoryboard.init(name: "page", bundle: nil)
            .instantiateViewController(withIdentifier: identifier)
    }

}

extension PageViewController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewConrollerList.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard viewConrollerList.count > previousIndex else {
            return nil
        }
        return viewConrollerList[previousIndex]
    }
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewConrollerList.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        guard viewConrollerList.count != nextIndex else {
            return nil
        }

        guard viewConrollerList.count > nextIndex else {
            return nil
        }
        return viewConrollerList[nextIndex]
    }
    
    
}

extension PageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentVC = pageViewController.viewControllers![0]
        self.pageControl.currentPage = viewConrollerList.index(of: pageContentVC)!
    }
}
