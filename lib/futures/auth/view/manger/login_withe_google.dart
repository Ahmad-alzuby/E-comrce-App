import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/servers/serviers.dart';

class GoogleAutheraizationControllar extends GetxController {
  MYServices myServices = Get.put(MYServices());
  OAuthCredential? credential;
  GoogleSignInAccount? googleUser;
  GoogleSignInAuthentication? googleAuth;
  Future signIn() async {
    googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    googleAuth = await googleUser?.authentication;

    // Create a new credential

    if (googleUser != null) {
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await MYServices.sharedPreferences.setString('image', '');

      await MYServices.sharedPreferences.setBool("Log", true);

      Get.offAndToNamed(AppRouter.homeScreen);
      await MYServices.sharedPreferences
          .setString('Name', "${googleUser!.displayName}");
      await MYServices.sharedPreferences
          .setString('${googleAuth!.idToken}', "${googleUser?.photoUrl}");
      await MYServices.sharedPreferences.setString('id', "${googleUser?.id}");

      if (googleUser?.photoUrl != null) {
        MYServices.sharedPreferences
            .setString('googleImage', "${googleUser!.photoUrl}");
      } else {
        MYServices.sharedPreferences.setString('googleImage',
            "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg");
      }
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    // Once signed in, return the UserCredential
  }

  Future logout() async {
    await MYServices.sharedPreferences.setString('image', '');
    try {
      await MYServices.sharedPreferences.setBool("Log", false);
      if (FirebaseAuth.instance.currentUser?.email == null) {
        
      await GoogleSignIn().disconnect();
      Get.offAndToNamed(AppRouter.login);

      return;
      }else{
      FirebaseAuth.instance.signOut();
      Get.offAndToNamed(AppRouter.login);

      }

    } catch (e) {
      Get.snackbar('error' , e.toString(),);

    }
  }

  Future updateName(String newName) async {
    try {
      MYServices.sharedPreferences.setString('Name', newName);
      Get.snackbar('Success', 'Name Has Change To $newName');
    } catch (e) {
      Get.snackbar('error', 'Name Has Not Change Errore $e');
    }
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
