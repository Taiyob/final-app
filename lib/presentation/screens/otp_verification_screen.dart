import 'package:e_commerce_app/presentation/screens/complete_profile_screen.dart';
import 'package:e_commerce_app/presentation/state_holders/verify_otp_controller.dart';
import 'package:e_commerce_app/presentation/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/widgets/app_logo.dart';
import 'package:e_commerce_app/presentation/widgets/centered_circular_progess.dart';
import 'package:e_commerce_app/presentation/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const AppLogo(),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter OTP Code',
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'A 4 digit OTP code has been send',
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildPinField(),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<VerifyOTPController>(
                    builder: (verifyOtpController) {
                      if (verifyOtpController.inProgress) {
                        return const CenteredCircularProgressWidget();
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          final result = await verifyOtpController.verifyOtp(
                              widget.email, _otpTEController.text);
                          if (result) {
                            Get.to(
                              () => const CompleteProfileScreen(),
                            );
                          } else {
                            if (mounted) {
                              showSnackMessage(
                                context,
                                verifyOtpController.errorMessage,
                              );
                            }
                          }
                        },
                        child: const Text('Next'),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildResendCodeMessage(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend Code',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText _buildResendCodeMessage() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: 'This will code will expired in',
          ),
          // TODO: countdown
          TextSpan(
            text: '120s',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
