//
//  ContentController.swift
//  Task1.2Lab9
//
//  Created by Andrey Kuksa on 5/25/21.
//  All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContentController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var museumSearchField: UITextField!
    @IBOutlet weak var museumDescription: UITextView!
    @IBOutlet weak var museumsCollectionView: UICollectionView!
  

    var museums = [NSManagedObject]()
    var items: [Museums] = []
    let container =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        museumsCollectionView.delegate = self
        museumsCollectionView.dataSource = self
        
        fetchMuseums()
    }
    
    let reuseIdentifier = "cell"
      
       
       // MARK: - UICollectionViewDataSource protocol
       
       // tell the collection view how many cells to make
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return self.items.count
       }
       
       // make a cell for each cell index path
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           // get a reference to our storyboard cell
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MuseumCell
           
        var description = self.items[indexPath.row].museumDescription
        
        museumDescription.text = description
        
        let name = self.items[indexPath.row].name
        
        let image = self.items[indexPath.row].imagePath
        
        cell.museumLabel.text = name // The row value is the same as the index of the desired text within the array.
        cell.museumImage.image = UIImage(named: image!) // make cell more visible in our example project
           
           return cell
       }
       
    
    func fetchMuseums(){
        try! self.items = container.fetch(Museums.fetchRequest())
              
        DispatchQueue.main.async {
            self.museumsCollectionView.reloadData()
        }
        try! container.save()
    }

        
    @IBAction func addMuseum(_ sender: Any) {
//        for object in items{
//            container.delete(object)
//        }
//        try! container.save()
        
        let cityName = "Minsk"
        let cityId = 1
        
        let typeName = "Animal museum"
        let typeId = 4
        
        let museumName = "Minsk cat museum"
        let imagePath = "Cat_mus"
        let description = "I don't know what should i write here"
        
        let type = MuseumTypes(context:self.container)
        type.typeName = typeName
        type.id = NSNumber(value:typeId)
        
        let city = Cities(context:self.container)
        city.name = cityName
        city.id = NSNumber(value:cityId)
        
        let museum = Museums(context:self.container)
        museum.name = museumName
        museum.imagePath = imagePath
        museum.cityId = NSNumber(value:cityId)
        museum.type = NSNumber(value:typeId)
        museum.museumDescription = description
        museum.firstCoordinate = 53.903824
        museum.secondCoordinate = 27.558707
     
        try! self.container.save()
        self.fetchMuseums()
    }
    
    
    
    @IBAction func mapButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func findPressed(_ sender: Any) {
        
        let searchedName = museumSearchField.text
        let request = Museums.fetchRequest() as NSFetchRequest<Museums>
        let namePredicate = NSPredicate(format: "name CONTAINS %@", searchedName!)
        request.predicate = namePredicate
        self.items = try! container.fetch(request)
        DispatchQueue.main.async {
            self.museumsCollectionView.reloadData()
        }
        
    }
    
}
