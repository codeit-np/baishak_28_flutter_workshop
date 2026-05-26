import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

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
                //Full Name
                TextFormField(
                  controller: controller.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter your Full Name',
                    label: Text("Full Name")
                  ),
                ),
                //Email
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Enter your Email',
                    label: Text("Email")
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                //Password

                Obx((){
                  return TextFormField(
                  controller: controller.password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                      controller.tooglePassword();
                    }, icon:controller.obsecure.value == true ? Icon(Icons.visibility_off) :Icon(Icons.visibility) ),
                    hintText: 'Enter your password',
                    label: Text("Password")
                  ),
                  obscureText: controller.obsecure.value,
                );
                }),
                
                Gap(ScreenSize.vGap),

                Row(
                  children: [
                    Expanded(child: FilledButton(onPressed: () async{
                      Loader.show(context);
                      await controller.register();
                      Loader.hide();
                    }, child: Text("Register"))),
                  ],
                ),
                Gap(ScreenSize.vGap),

                Text("Already have an account? Login")
              ],
            )),
          )
        ],
      ),
    );
  }
}