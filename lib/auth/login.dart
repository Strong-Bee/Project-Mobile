import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final isVerySmallScreen = screenSize.width < 400;

    return Scaffold(
      backgroundColor: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
              Icons.lock_person_rounded,
              color: Colors.white,
              size: isSmallScreen ? 32 : 40,
            ),
          ),

          SizedBox(height: isSmallScreen ? 16 : 24),

          Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: isSmallScreen ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          Text(
            "Sign in to continue your journey",
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
            // Title
            Text(
              "Login",
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: isSmallScreen ? 24 : 32),

            // Email Field
            _buildEmailField(isSmallScreen),

            SizedBox(height: isSmallScreen ? 16 : 20),

            // Password Field
            _buildPasswordField(isSmallScreen),

            SizedBox(height: isSmallScreen ? 12 : 16),

            // Remember me & Forgot password
            _buildRememberForgotSection(context, isSmallScreen),

            SizedBox(height: isSmallScreen ? 24 : 32),

            // Login Button
            _buildLoginButton(context, isSmallScreen),

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
          child: TextField(
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

  Widget _buildRememberForgotSection(BuildContext context, bool isSmallScreen) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          // Remember Me
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
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
                  const SizedBox(width: 8),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 13 : 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Forgot Password
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/forgot'),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: isSmallScreen ? 13 : 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF667EEA),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, bool isSmallScreen) {
    return SizedBox(
      width: double.infinity,
      height: isSmallScreen ? 52 : 56,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            // Login action
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
                  "Sign In",
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
            "or continue with",
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
            "Don't have an account?",
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/register'),
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Text(
                "Sign Up",
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
