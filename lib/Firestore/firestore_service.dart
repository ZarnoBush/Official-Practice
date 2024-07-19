import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:official_practice/Firestore/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to add user to Firestore
  Future<void> addUser(UserModel user) {
    // Create a new document for the user using their uid
    return _db.collection('Users').doc(user.uid).set({
      'name': user.name,
      'email': user.email,
    });
  }

  // Function to get a user from Firestore using their uid
  Stream<UserModel?> getUser(String uid) {
    // Return a stream of snapshots of the document with the given uid
    return _db.collection('Users').doc(uid).snapshots().map((event) {
      if (event.exists) {
        // If the document exists, create a User object from the snapshot data
        return UserModel(
            uid: uid,
            name: event.data()?['name'] ?? '', // Retrieve user's name from snapshot
            email: event.data()?['email'] ?? '', // Retrieve user's email from snapshot
            );
      } else {
        // If the document doesn't exist, return null
        return null;
      }
    });
  }

  // Method to get a stream of user data from Firestore
  Stream<List<UserModel>> getUsers() {
    // Listen to the snapshots of the 'Users' collection in Firestore
    return _db.collection('Users').snapshots().map((snapshot) {
      // Map the documents in the snapshot to a list of UserModel objects
      return snapshot.docs.map((doc) {
        // Create a UserModel object for each document
        return UserModel(
          uid: doc.id, // Use the document ID as the user ID
          name: doc.data()['name'] ?? '', // Get the user's name, or an empty string if it doesn't exist
          email: doc.data()['email'] ?? '', // Get the user's email, or an empty string if it doesn't exist
        );
      }).toList(); // Convert the iterable to a list
    });
  }
  /*
  his method returns a stream of List<UserModel>:

    return _db.collection('Users').snapshots(): This sets up a listener on the Users collection in Firestore. 
    It returns a stream of snapshots, where each snapshot represents the current state of the collection.

    .map((snapshot) { ... }): For each snapshot, the code inside the map function is executed.

    snapshot.docs.map((doc) { ... }): This iterates over each document in the snapshot.
        return UserModel(uid: doc.id, name: doc.data()['name'] ?? '', email: doc.data()['email'] ?? '');: 
        For each document, it creates a UserModel object. It uses the document ID as the user ID (uid), 
        and retrieves the name and email fields from the document data. If these fields don't exist, 
        it defaults to an empty string.
        
    .toList(): Converts the iterable of UserModel objects into a list.
  */
}
