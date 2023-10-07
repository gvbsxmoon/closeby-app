import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/checkbox.dart';
import 'package:closeby/components/cb-components/divider.dart';
import 'package:closeby/components/cb-components/snackbar.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_header.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({
    super.key,
  });

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp>
    with FormValidator, StringUtils {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _firstNameFocusNode = FocusNode();
  final LoginController _controller = Get.put(LoginController());

  String _firstName = "";
  String _surname = "";
  String _email = "";
  String _password = "";

  bool _marketing = false;
  bool _obscureText = false;

  @override
  void initState() {
    _firstNameFocusNode.requestFocus();
    _email = _controller.model.email;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    super.dispose();
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _controller.signUp(
          capitalize(_firstName),
          capitalize(_surname),
          _email,
          _password,
        );
      } catch (err) {
        if (context.mounted) {
          showCBSnackbar(context, err.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      header: const LoginHeader(),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildSignUpForm(),
      ),
    );
  }

  SingleChildScrollView _buildSignUpForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CBTextField(
              hintText: 'name'.tr,
              focusNode: _firstNameFocusNode,
              onChanged: (v) => setState(
                () {
                  _firstName = v;
                },
              ),
              validator: (v) => validateString(v, 'name'.tr),
            ),
            const SizedBox(height: 16),
            CBTextField(
              hintText: 'surname'.tr,
              onChanged: (v) => setState(() {
                _surname = v;
              }),
              validator: (v) => validateString(v, 'surname'.tr),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 32),
              child: Text(
                'id_check_banner'.tr,
                style: AppFonts.figtree(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryBlack),
              ),
            ),
            CBTextField(
              initialValue: _email,
              hintText: "Email",
              onChanged: (v) => setState(() {
                _email = v;
              }),
              validator: (v) => validateEmail(v),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CBTextField(
              hintText: "Password",
              obscureText: _obscureText,
              showEye: true,
              showPassword: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              onChanged: (v) => setState(() {
                _password = v;
              }),
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'\s'),
                ),
              ],
              validator: (v) => validatePassword(v),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 32, 4, 16),
              child: Text(
                'signup_banner'.tr,
                style: AppFonts.figtree(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryBlack),
              ),
            ),
            CBButton(
              expanded: true,
              label: 'terms'.tr,
              onTap: _signUp,
            ),
            const CBDivider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Text(
                'mailing_list_banner'.tr,
                style: AppFonts.figtree(
                    fontSize: 12,
                    color: AppColor.secondaryBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),
            CBCheckbox(
              checked: _marketing,
              label: 'marketing_checkbox'.tr,
              onChanged: () {
                setState(() {
                  _marketing = !_marketing;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
