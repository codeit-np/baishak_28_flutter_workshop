import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: ScreenSize.sPadding),
            child: Form(child: Column(
              children: [
                //Email
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter your email',
                      label: Text("Email")
                    ),
                    keyboardType:TextInputType.emailAddress ,
                  ),
                //Password
                TextFormField(
                  controller: controller.password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: () {
                       
                      }, icon: Icon(Icons.visibility_off)),
                      hintText: 'Enter your password',
                      label: Text("Password")
            
                    ),
                    obscureText: true,
                  ),
                Gap(ScreenSize.vGap),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password? Click"),
                  ],
                ),
            
                //Login Button
                Gap(ScreenSize.vGap),
                Row(
                  children: [
                    Expanded(child: FilledButton(onPressed: () async{
                       Loader.show(context);
                        await controller.login();
                        Loader.hide();
                    }, child: Text("Login"))),
                  ],
                ),

                Gap(ScreenSize.vGap),

                // Create Account button
                Text("New student? Create Account"),
              ],
            )),
          )
        ],
      ),
    );
  }
}