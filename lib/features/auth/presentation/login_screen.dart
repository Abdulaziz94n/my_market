import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/mixins/validators_mixin.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_text_field.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/auth/presentation/auth_controller.dart';

const double _fieldWidth = 350;

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({
    super.key,
  });

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with Validators {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameCtrl = useTextEditingController(text: 'Nejim123');
    final passwordCtrl = useTextEditingController();

    return AppScaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   UsersRepository().addUser(UserModel(
      //     nationalId: 'national id',
      //     name: nameCtrl.text.trimAndLower,
      //     password: passwordCtrl.text.trim(),
      //     roleId: 1,
      //     genderId: 1,
      //   ));
      // }),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 120),
              const VerticalSpacingWidget(Sizes.p100),
              AppTextField.withController(
                controller: nameCtrl,
                label: 'Username',
                prefixIcon: const Icon(Icons.person),
                width: _fieldWidth,
                validator: validateIsEmpty,
              ),
              const VerticalSpacingWidget(Sizes.p48),
              AppTextField.withController(
                controller: passwordCtrl,
                label: 'Password',
                prefixIcon: const Icon(Icons.abc),
                width: _fieldWidth,
                validator: validateIsEmpty,
              ),
              const VerticalSpacingWidget(Sizes.p48),
              LoginButton(
                onLogin: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(authController.notifier).login(
                          userName: nameCtrl.text.trimAndLower,
                          password: passwordCtrl.text.trim(),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onLogin,
  });
  final VoidCallback onLogin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLogin,
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: context.appColors.primary,
                  ),
                  const AppText(text: 'Login'),
                ],
              ),
            ),
            SizedBox(
              height: 1,
              width: double.infinity,
              child: ColoredBox(color: context.appColors.primary),
            )
          ],
        ),
      ),
    );
  }
}
