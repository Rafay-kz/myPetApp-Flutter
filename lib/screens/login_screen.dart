import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pets_app/controller/login_screen_controller.dart';
import 'package:my_pets_app/screens/custom_widget/custom_bottom_navbar.dart';
import 'package:my_pets_app/utils/app_colors.dart';


class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color(kWhiteColor),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/loin-image.png',height: 200,width: 150),
                    Image.asset(
                      'assets/images/tiger_image.png',height: 200,width: 150,),
                  ],
                ),
                const SizedBox(height: 30.0),
                const Text('WELCOME \nBACK!',style: TextStyle(color:  Color(kBlackColor),fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                const SizedBox(height: 30.0),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                      child: _getErrorMessage(
                          visibility: controller.emailErrorVisible,
                          errorMessage: controller.emailErrorMsg),
                    ),
                   TextField(
                        controller: controller.emailTEController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black54
                          ),
                          labelText: 'Email:',
                          border: InputBorder.none,
                          hintText: 'Enter your Email',
                          filled: true,
                          fillColor: Colors.white70,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onChanged: (value){
                          controller.onValidation(value);
                        },

                      ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                      child: _getErrorMessage(
                          visibility: controller.passwordErrorVisible,
                          errorMessage: controller.passwordErrorMsg),
                    ),
                    Obx(
                      ()=>TextField(
                        controller: controller.passwordTEController,
                        obscureText: controller.obscured.value,
                        focusNode: controller.textFieldFocusNode,
                        style: const TextStyle(color:  Colors.black),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black54
                          ),
                          labelText: 'Password:',
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          filled: true,
                          fillColor: Colors.white70,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child:
                            GestureDetector(
                              onTap: controller.toggleObscured,
                              child: Icon(
                                controller.obscured.value ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),

                          ),

                        ),
                        onChanged: (value){
                          controller.passwordValidation(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                GestureDetector(
                  onTap: controller.onSubmitProcess,
                  child: Container(
                    width: Get.width,
                    height: 55,
                    decoration: const BoxDecoration(
                      color:  Color(kBlackColor),
                      borderRadius: BorderRadius.all(Radius.circular(50)
                      ),
                    ),
                    child: const Center(child: Text('LOG IN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
            ),
          ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  Widget _getErrorMessage(
      {required RxBool visibility, required RxString errorMessage}) {
    return Obx(
          () => Visibility(
          visible: visibility.value,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, bottom: 3.0),
              child: Text(
                errorMessage.value,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(kRequiredColor),
                ),
              ),
            ),
          )),
    );
  }



}




