//
//  ViewController.swift
//  JSONparsing
//
//  Created by Aditya Tanna on 6/17/17.
//  Copyright © 2017 Tanna Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionPost: UICollectionView!
    
    var posts = [Post] ()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PostCell", bundle: nil)
    
        collectionPost.register(nib, forCellWithReuseIdentifier: "cellPost")
        
        getSingleJSONObjectFromFile()
        
        getMultipleJSONObjectFromFile()
    }
    
    func getSingleJSONObjectFromFile(){
        
        if let urlFilePath = Bundle.main.url(forResource: "single_post", withExtension: "json"){
        
            do {
                let data = try Data(contentsOf: urlFilePath)
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let dictPost = (json as? [String:Any])?["post"] as? [String:Any]{
                    
                    let objPost = Post()
                    
                    objPost.setValuesForKeys(dictPost)
                    
                    if let strName = objPost.name, let numLikes = objPost.numLikes, let loc = objPost.location{
                        print(strName, numLikes, loc)
                    }
                }
            }catch let err{
                print(err)
            }
        }
    }
    
    func getMultipleJSONObjectFromFile() {
        if let urlFilePath = Bundle.main.url(forResource: "all_posts", withExtension: "json"){
            
            do {
                let data = try Data(contentsOf: urlFilePath)
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let arrPosts = (json as? [String:Any])? ["posts"] as? [[String:Any]]{
                    
                    for dictPost in arrPosts{
                        let objPost = Post()
                        
                        objPost.setValuesForKeys(dictPost)
                    
                        if let strName = objPost.name, let numLikes = objPost.numLikes, let loc = objPost.location{
                            print(strName, numLikes, loc)
                        }
                        
                        posts.append(objPost)
                    }
                }
            }catch let err{
                print(err)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0 //posts.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellPost = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPost", for: indexPath)
        
        return cellPost
    }
    
}

