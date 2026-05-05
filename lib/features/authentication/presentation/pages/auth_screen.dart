import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_posts/core/utils/app_images.dart';
import 'package:instagram_posts/core/utils/navigation_helper.dart';
import 'package:instagram_posts/features/authentication/presentation/bloc/auth_bloc_bloc.dart';
import 'package:instagram_posts/features/authentication/presentation/pages/auth_register_screen.dart';
import 'package:instagram_posts/features/authentication/presentation/widgets/custom_text_field.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                AppImages.instagram(context).image(width: 96, fit: .contain),
                const SizedBox(height: 32),
                _buildFormWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailTextField(),
          const SizedBox(height: 16),
          _buildPasswordTextField(),
          const SizedBox(height: 24),
          _buildShowRegisterUserText(),
          const SizedBox(height: 24),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      type: AppTextFieldType.email,
      onValue: (v) => _email = v,
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      type: AppTextFieldType.password,
      onValue: (v) => _password = v,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<AuthBlocBloc>().add(
          AuthSignInEvent(email: _email, password: _password),
        );
      },
      child: const Text('Sign In'),
    );
  }

  Widget _buildShowRegisterUserText() {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          const TextSpan(text: "Don't have an account? "),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                // TODO: toggle to register mode
                NavigationHelper.push(AuthRegisterScreen());
              },
              child: Text(
                "Register",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
