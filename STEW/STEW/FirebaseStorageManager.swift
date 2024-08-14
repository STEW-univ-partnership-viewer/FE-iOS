//
//  FirebaseStorageManager.swift
//  STEW
//
//  Created by 황채웅 on 8/9/24.
//

//import Foundation
//import FirebaseStorage
//import Firebase
//import FirebaseFirestore
//
//class FirebaseStorageManager {
//    static func uploadImage(image: UIImage, pathRoot: String, completion: @escaping (URL?) -> Void) {
//        guard let imageData = image.jpegData(compressionQuality: 0.4) else { return }
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpeg"
//        
//        let imageName = UUID().uuidString + String(Date().timeIntervalSince1970)
//        
//        let firebaseReference = Storage.storage().reference().child("\(imageName)")
//        firebaseReference.putData(imageData, metadata: metaData) { metaData, error in
//            firebaseReference.downloadURL { url, _ in
//                completion(url)
//            }
//        }
//    }
//    
//    static func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
//        let storageReference = Storage.storage().reference(forURL: urlString)
//        let megaByte = Int64(1 * 1024 * 1024)
//        
//        storageReference.getData(maxSize: megaByte) { data, error in
//            guard let imageData = data else {
//                completion(nil)
//                return
//            }
//            completion(UIImage(data: imageData))
//        }
//    }
//    
//    func saveUnitToFirestore(unit: Unit) {
//        let db = Firestore.firestore()
//        do {
//            let data = try JSONEncoder().encode(unit)
//            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                db.collection("units").document(unit.unitName).setData(jsonObject) { error in
//                    if let error = error {
//                        print("Error saving unit: \(error)")
//                    } else {
//                        print("Unit successfully saved!")
//                    }
//                }
//            }
//        } catch {
//            print("Error encoding unit: \(error)")
//        }
//    }
//    
//    func saveLocationToFirestore(location: Location) {
//        let db = Firestore.firestore()
//        do {
//            let data = try JSONEncoder().encode(location)
//            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                db.collection("locations").document(location.name).setData(jsonObject) { error in
//                    if let error = error {
//                        print("Error saving location: \(error)")
//                    } else {
//                        print("Location successfully saved!")
//                    }
//                }
//            }
//        } catch {
//            print("Error encoding location: \(error)")
//        }
//    }
//    func fetchUnitFromFirestore(unitName: String, completion: @escaping (Unit?) -> Void) {
//        let db = Firestore.firestore()
//        db.collection("unit").document(unitName).getDocument { document, error in
//            if let document = document, document.exists {
//                do {
//                    let data = try JSONSerialization.data(withJSONObject: document.data() ?? [:], options: [])
//                    let unit = try JSONDecoder().decode(Unit.self, from: data)
//                    completion(unit)
//                } catch {
//                    print("Error decoding unit: \(error)")
//                    completion(nil)
//                }
//            } else {
//                print("Document does not exist")
//                completion(nil)
//            }
//        }
//    }
//
//    func fetchLocationFromFirestore(locationName: String, completion: @escaping (Location?) -> Void) {
//        let db = Firestore.firestore()
//        db.collection("location").document(locationName).getDocument { document, error in
//            if let document = document, document.exists {
//                do {
//                    let data = try JSONSerialization.data(withJSONObject: document.data() ?? [:], options: [])
//                    let location = try JSONDecoder().decode(Location.self, from: data)
//                    completion(location)
//                } catch {
//                    print("Error decoding location: \(error)")
//                    completion(nil)
//                }
//            } else {
//                print("Document does not exist")
//                completion(nil)
//            }
//        }
//    }
//
//
//}
