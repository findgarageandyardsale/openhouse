import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:open_house/features/authentication/presentation/widgets/password_field_widget.dart';
import 'package:open_house/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/custom_loading.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';
import '../../../../routes/app_route.gr.dart';
import '../../../../shared/widgets/action_button.dart';
import '../../../../shared/widgets/app_image.dart';
import '../providers/auth_providers.dart';
import '../providers/state/auth_state.dart';
import '../widgets/auth_field.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);

    void setFilterInitail() {
      AutoRouter.of(context).replaceAll([const DashboardScreen()]);
      ref.invalidate(currentUserProvider);
    }

    ref.listen(authStateNotifierProvider.select((value) => value), ((
      previous,
      next,
    ) {
      next.maybeWhen(
        orElse: () {},
        failure: (failure) {
          CustomToast.showToast(
            failure.message.toString(),
            status: ToastStatus.error,
          );
        },
        success: () {
          setFilterInitail();
        },
      );
    }));
    return CustomLoadingOverlay(
      isLoading: state is Loading,
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('Sign In'),
          leading: BackButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                setFilterInitail();
              }
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: AutofillGroup(
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppImage(),
                        Spacing.sizedBoxH_20(),
                        Text(
                          'Welcome to Open House!',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        Spacing.sizedBoxH_10(),
                        Text(
                          'Find your perfect property \nOr\nList your property with ease.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.tileColor),
                          textAlign: TextAlign.center,
                        ),
                        Spacing.sizedBoxH_20(),
                        AuthField(
                          name: 'email',
                          hintText: 'Email',
                          labelText: 'Email',
                          controller: usernameController,
                          fillColor: AppColors.extraLightGrey,
                          autofillHints: const [
                            AutofillHints.email,
                            AutofillHints.username,
                          ],
                          textInputAction: TextInputAction.next,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Email Address is empty.',
                            ),
                            FormBuilderValidators.email(
                              errorText: 'Invalid Email Address',
                            ),
                          ]),
                        ),
                        Spacing.sizedBoxH_16(),
                        PasswordFieldWidget(
                          name: 'password',
                          hintText: 'Password',
                          autofillHints: const [AutofillHints.password],
                          labelText: 'Password',
                          passwordController: passwordController,
                        ),
                        Spacing.sizedBoxH_20(),
                        loginButton(context, ref),
                        Spacing.sizedBoxH_16(),
                        TextButton(
                          onPressed: () {
                            context.router.push(ForgetEmailScreen());
                          },
                          child: Text(
                            'Forget Password?',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Spacing.sizedBoxH_20(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account?  ',
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      AutoRouter.of(
                                        context,
                                      ).push(SignupScreen());
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge?.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacing.sizedBoxH_30(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context, WidgetRef ref) {
    return ActionButton(
      width: double.infinity,
      label: 'Log In',
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (formKey.currentState!.saveAndValidate()) {
          ref
              .read(authStateNotifierProvider.notifier)
              .loginUser(usernameController.text, passwordController.text);
        }
      },
      textColor: AppColors.white,
    );
  }
}
