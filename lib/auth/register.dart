import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Full Name Field
            _buildTextField(
              label: "Full Name",
              hintText: "Enter your full name",
              prefixIcon: Icons.person_rounded,
              isSmallScreen: isSmallScreen,
            ),

            SizedBox(height: isSmallScreen ? 16 : 20),

            // Email Field
            _buildTextField(
              label: "Email",
              hintText: "your@email.com",
              prefixIcon: Icons.email_rounded,
              isSmallScreen: isSmallScreen,
            ),

            SizedBox(height: isSmallScreen ? 16 : 20),

            // Phone Field
            _buildTextField(
              label: "Phone Number",
              hintText: "+62 812-3456-7890",
              prefixIcon: Icons.phone_rounded,
              isSmallScreen: isSmallScreen,
            ),

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
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
    required bool isSmallScreen,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 55,
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(prefixIcon, color: Colors.grey),
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
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "••••••••",
              prefixIcon: const Icon(Icons.lock_rounded, color: Colors.grey),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.visibility_off_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {},
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
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "••••••••",
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.visibility_off_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {},
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
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[400]!),
                color: Colors.transparent,
              ),
              child: const Icon(
                Icons.check,
                size: 14,
                color: Colors.transparent,
              ),
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
          onTap: () {
            // Register action
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
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
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
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
            onTap: () {},
            size: isSmallScreen ? 46 : 50,
          ),
          const SizedBox(width: 16),
          _buildSocialButton(
            icon: Icons.facebook_rounded,
            color: Colors.blue,
            onTap: () {},
            size: isSmallScreen ? 46 : 50,
          ),
          const SizedBox(width: 16),
          _buildSocialButton(
            icon: Icons.apple_rounded,
            color: Colors.black,
            iconColor: Colors.white,
            onTap: () {},
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
