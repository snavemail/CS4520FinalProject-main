//
//  PostProgressSpinnerManager.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/20/23.
//
import Foundation

extension PostScreenViewController: ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }

    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
