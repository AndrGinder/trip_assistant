import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/utils/constants/form.dart';

class LogoutButton extends StatelessWidget{
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0, 
        horizontal: BlockProperties.thinPadding
      ),
      child: IconButton(
      icon: const Icon(
        Icons.logout, 
        color: Colors.white,
      ),
      onPressed: () async {
          try{
            await authService.value.signOut();

            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AuthUtils.snackSignOut)
              ),
            ); 

            // ignore: use_build_context_synchronously
            NavigationUtils.navigateBackToSignInPage(context);
          }
          on FirebaseAuthException catch(e){
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message ?? AuthUtils.snackError)
              ),
            );
          }
        },
      )
    );
  }
}