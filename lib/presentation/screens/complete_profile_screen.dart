import 'package:e_commerce_app/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shoppingAddressTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Complete Profile',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Get started with us by providing your details',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildProfileForm(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Get.to(()=> OtpVerificationScreen(email: _emailTEController.text.toString(),),);
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              hintText: 'First Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _mobileTEController,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _shoppingAddressTEController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shoppingAddressTEController.dispose();
    super.dispose();
  }
}
