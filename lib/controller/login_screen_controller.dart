import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isValidate = true.obs;
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  RxBool obscured = false.obs;
  RxBool emailErrorVisible = RxBool(false);
  RxString emailErrorMsg = "".obs;
  RxBool passwordErrorVisible = RxBool(false);
  RxString passwordErrorMsg = "".obs;
  final textFieldFocusNode = FocusNode();
  RegExp emailRegex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  onChangeText() {
    if (!isValidate.value) formKey.currentState!.validate();
  }

  onValidation(String value) {
    if (value.trim() == "") {
      emailErrorMsg.value = "Email is required!";
      emailErrorVisible.value = true;

    } else if (!emailRegex.hasMatch(value)) {
      emailErrorVisible.value = true;
      emailErrorMsg.value = "Invalid Email!";
    } else {
      emailErrorVisible.value = false;
      emailErrorMsg.value = "";
    }
    return emailErrorVisible.value;
  }

  bool passwordValidation(String value) {
    if (value.trim() == "") {
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password is required!";
    }else if (passwordTEController.text.trim().length < 8 ||
        passwordTEController.text.isEmpty) {
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be of at least 8 Characters!";
    }else if(!passwordTEController.text.trim().contains(RegExp(r'^(?=.*?[A-Z])'))){
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be contain at least 1 capital letter";
    }
    else if(!passwordTEController.text.trim().contains(RegExp(r'^(?=.*?[!@#\$&*~])'))){
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be contain at least 1 Special Character";
    }

    else {
      passwordErrorVisible.value = false;
      passwordErrorMsg.value = "";
    }
    return passwordErrorVisible.value;
  }

  void toggleObscured() {
    obscured.value = !obscured.value;
    if (textFieldFocusNode.hasPrimaryFocus)
      return;
    textFieldFocusNode.canRequestFocus = false;
  }


  Future<void> onSubmitProcess() async {
    bool isAllDataValid = false;
    isAllDataValid = isAllDataValid =  !onValidation(emailTEController.text);
    isAllDataValid = !passwordValidation(passwordTEController.text) && isAllDataValid;

    if (isAllDataValid) {
      if(emailTEController.text=='admin@gmail.com' && passwordTEController.text=='Admin#123'){
        emailTEController.text='';
        passwordTEController.text='';
        Get.snackbar('Congratulations!','Login Successfully',
            backgroundColor: Colors.black, colorText: Colors.white);
      }else{
        Get.snackbar('Can\'t Login', 'User Not Found',
            backgroundColor: Colors.red, colorText: Colors.white);
      }

    }
  }
}
