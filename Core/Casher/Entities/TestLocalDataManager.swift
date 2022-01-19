//
//  TestLocalDataManager.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import CoreData
import RxSwift

class TestLocalDataManager {
    func retrievePostList() -> Observable<[LocalStacklist]>? {
        let managedOC = CoreDataStore.managedObjectContext
        let request: NSFetchRequest<LocalStacklist> = NSFetchRequest(entityName: String(describing: LocalStacklist.self))
        do {
            let fetched = try managedOC!.fetch(request)
            return Observable.create({ observer in
                observer.onNext(fetched)
                observer.onCompleted()
                return Disposables.create()
            })
        }catch let err {
            print(err)
            return  nil
        }
    }
    func savePost(dataDic:[String:Any])  {
        let managedOC = CoreDataStore.managedObjectContext
        if let newData = NSEntityDescription.entity(forEntityName: "LocalStacklist",
                                                    in: managedOC!) {
            let data = LocalStacklist(entity: newData, insertInto: managedOC)
            data.title = dataDic["title"] as? String
            data.link = dataDic["link"] as? String
            do {
                try managedOC!.save()
            }catch let err {
                print(err)
            }
        }
    }
    func deleteAllData(entity: String) {
        let managedOC = CoreDataStore.managedObjectContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let delQue = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try managedOC!.execute(delQue)
        }catch let err {
            print(err)
        }
    }
}
