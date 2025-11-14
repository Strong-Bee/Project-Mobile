import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the terms and conditions'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Show success dialog
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
              SizedBox(width: 12),
              Text("Registration Successful"),
            ],
          ),
          content: const Text(
            "Your account has been created successfully. Please check your email to verify your account.",
            style: TextStyle(height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to login
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color(0xFF667EEA),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^[+]?[0-9]{10,13}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final isVerySmallScreen = screenSize.width < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isVerySmallScreen ? 16 : 24,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        // Header Section
                        _buildHeaderSection(context, isSmallScreen),

                        // Form Section
                        _buildFormSection(
                          context,
                          isSmallScreen,
                          isVerySmallScreen,
                        ),

                        // Footer Section
                        _buildFooterSection(context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context, bool isSmallScreen) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isSmallScreen ? 70 : 90,
            height: isSmallScreen ? 70 : 90,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(isSmallScreen ? 18 : 22),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              Icons.person_add_rounded,
              color: Colors.white,
              size: isSmallScreen ? 32 : 40,
            ),
          ),

          SizedBox(height: isSmallScreen ? 16 : 24),

          Text(
            "Create Account",
            style: TextStyle(
              fontSize: isSmallScreen ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          Text(
            "Join us and start your journey",
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: isSmallScreen ? 32 : 48),
        ],
      ),
    );
  }

  Widget _buildFormSection(
    BuildContext context,
    bool isSmallScreen,
    bool isVerySmallScreen,
  ) {
    return Expanded(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: isSmallScreen ? 400 : 450),
        padding: EdgeInsets.all(isSmallScreen ? 20 : 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Full Name Field
              _buildNameField(isSmallScreen),

              SizedBox(height: isSmallScreen ? 16 : 20),

              // Email Field
              _buildEmailField(isSmallScreen),

              SizedBox(height: isSmallScreen ? 16 : 20),

              // Phone Field
              _buildPhoneField(isSmallScreen),

              SizedBox(height: isSmallScreen ? 16 : 20),

              // Password Field
              _buildPasswordField(isSmallScreen),

              SizedBox(height: isSmallScreen ? 16 : 20),

              // Confirm Password Field
              _buildConfirmPasswordField(isSmallScreen),

              SizedBox(height: isSmallScreen ? 12 : 16),

              // Terms and Conditions
              _buildTermsSection(context, isSmallScreen),

              SizedBox(height: isSmallScreen ? 24 : 32),

              // Register Button
              _buildRegisterButton(context, isSmallScreen),

              SizedBox(height: isSmallScreen ? 24 : 32),

              // Divider
              _buildDividerSection(isSmallScreen),

              SizedBox(height: isSmallScreen ? 20 : 28),

              // Social Login
              _buildSocialLoginSection(isSmallScreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Full Name",
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: _nameController,
            validator: _validateName,
            decoration: InputDecoration(
              hintText: "Enter your full name",
              prefixIcon: const Icon(Icons.person_rounded, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(fontSize: isSmallScreen ? 15 : 16),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Email",
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: _emailController,
            validator: _validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "your@email.com",
              prefixIcon: const Icon(Icons.email_rounded, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(fontSize: isSmallScreen ? 15 : 16),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Phone Number",
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: _phoneController,
            validator: _validatePhone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "+62 812-3456-7890",
              prefixIcon: const Icon(Icons.phone_rounded, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(fontSize: isSmallScreen ? 15 : 16),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Password",
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: _passwordController,
            validator: _validatePassword,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: "••••••••",
              prefixIcon: const Icon(Icons.lock_rounded, color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(
              fontSize: isSmallScreen ? 15 : 16,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Confirm Password",
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: _confirmPasswordController,
            validator: _validateConfirmPassword,
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              hintText: "••••••••",
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(
              fontSize: isSmallScreen ? 15 : 16,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsSection(BuildContext context, bool isSmallScreen) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _agreeToTerms = !_agreeToTerms;
              });
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: _agreeToTerms
                      ? const Color(0xFF667EEA)
                      : Colors.grey[400]!,
                ),
                color: _agreeToTerms
                    ? const Color(0xFF667EEA)
                    : Colors.transparent,
              ),
              child: _agreeToTerms
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  "I agree to the ",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 14,
                    color: Colors.grey[700],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to terms
                  },
                  child: Text(
                    "Terms of Service",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 13 : 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667EEA),
                    ),
                  ),
                ),
                Text(
                  " and ",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 14,
                    color: Colors.grey[700],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to privacy policy
                  },
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 13 : 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667EEA),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context, bool isSmallScreen) {
    return SizedBox(
      width: double.infinity,
      height: isSmallScreen ? 52 : 56,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: _isLoading ? null : _register,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              gradient: _isLoading
                  ? const LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : const LinearGradient(
                      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: _isLoading
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isLoading)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white.withOpacity(0.7),
                      ),
                    ),
                  )
                else
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                if (!_isLoading) const SizedBox(width: 12),
                if (!_isLoading)
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerSection(bool isSmallScreen) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Colors.grey[300])),
          const SizedBox(width: 16),
          Text(
            "or sign up with",
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 13,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Container(height: 1, color: Colors.grey[300])),
        ],
      ),
    );
  }

  Widget _buildSocialLoginSection(bool isSmallScreen) {
    return SizedBox(
      height: isSmallScreen ? 46 : 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialButton(
            icon: Icons.g_mobiledata_rounded,
            color: Colors.red,
            onTap: () {
              _showSocialLoginMessage('Google');
            },
            size: isSmallScreen ? 46 : 50,
          ),
          const SizedBox(width: 16),
          _buildSocialButton(
            icon: Icons.facebook_rounded,
            color: Colors.blue,
            onTap: () {
              _showSocialLoginMessage('Facebook');
            },
            size: isSmallScreen ? 46 : 50,
          ),
          const SizedBox(width: 16),
          _buildSocialButton(
            icon: Icons.apple_rounded,
            color: Colors.black,
            iconColor: Colors.white,
            onTap: () {
              _showSocialLoginMessage('Apple');
            },
            size: isSmallScreen ? 46 : 50,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required double size,
    Color iconColor = Colors.white,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, color: iconColor, size: size * 0.5),
        ),
      ),
    );
  }

  void _showSocialLoginMessage(String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$platform login selected'),
        backgroundColor: const Color(0xFF667EEA),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Text(
                "Sign In",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF667EEA),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
