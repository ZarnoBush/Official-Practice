import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:official_practice/Firestore/firestore_service.dart';
import 'package:official_practice/Firestore/user_model.dart';

class RegistrationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // An instance of FirestoreService is created to access the Firestore methods.
  final FirestoreService _firestoreService = FirestoreService();

  // UserModel userModel = UserModel(uid: '', name: '', email: '');
  var controlleList = <UserModel>[].obs;

   // Fetch the users when the controller is initialized.
   /*
   onInit is a lifecycle method provided by GetX. It is called when the controller is first created. 
   Here, it is overridden to call the fetchUsers method,
   ensuring that user data is fetched as soon as the controller is initialized.
   */

   @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // Add user to Firestore 
        // name and email a referrencing the parameters on signUp Method
        await _firestoreService.addUser(UserModel(uid: user.uid, name: name, email: email));
        // Navigating to the next screen
        Get.toNamed('/preview');
      }
    } catch (e) {
      // Handling error
      Get.snackbar('Error:', e.toString());
    }


  }

  // Method to fetch users from Firestore
  /*
  This method listens to the stream of user data from Firestore 
  provided by the getUsers method of the FirestoreService.
  ----
  When new data is received from the stream, the users list is updated with the new list of users (userList). 
  Since users is an observable list, 
  any UI components that are observing this list will automatically update to reflect the new data.
  */
  
  void fetchUsers() {
    // Listen to the stream of user data from Firestore
    _firestoreService.getUsers().listen((userList) {
      // Update the users observable list with the new data
      controlleList.value = userList;
    });
  }
}
