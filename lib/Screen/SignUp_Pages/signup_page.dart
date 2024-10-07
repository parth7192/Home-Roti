import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.07, // Adjust the opacity level (0.0 to 1.0)
              child: Image.asset(
                'lib/assets/images/image.png', // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with content
          Padding(
            padding:
                EdgeInsets.all(16), // Fixed padding, adjusted by screen size
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizeBox(
                      h * 0.05, null), // Use percentage of height for spacing

                  // Login heading
                  Text(
                    'Login to your HomeRoti \naccount',
                    style: GoogleFonts.roboto(
                      fontSize:
                          w * 0.08, // Use percentage of width for font size
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1F493D),
                    ),
                  ),

                  MySizeBox(h * 0.06, null), // Height-based spacing

                  MySizeBox(
                      h * 0.06, null), // Mobile number input section spacing

                  // Mobile number input
                  Row(
                    children: [
                      // Country code box
                      Container(
                        width: w * 0.12, // Use percentage of width
                        height: h * 0.06, // Use percentage of height
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffD1D5DB),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '+91',
                            style: GoogleFonts.openSans(
                              color: const Color(0xff6B7280),
                              fontSize:
                                  w * 0.045, // Percentage width for font size
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: w * 0.02), // Width-based spacing

                      // Mobile number text field
                      SizedBox(
                        width: w * 0.7, // Scaled width based on screen size
                        height: h * 0.06, // Scaled height
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Enter your mobile number',
                            hintStyle: GoogleFonts.openSans(
                              color: const Color(0xff374151),
                              fontSize:
                                  w * 0.045, // Percentage width for font size
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xffD1D5DB),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xffD1D5DB),
                              ),
                            ),
                          ),
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: w * 0.05, // Adjusted font size
                            fontWeight: FontWeight.w400,
                          ),
                          cursorColor: const Color(0xff374151),
                        ),
                      ),
                    ],
                  ),

                  MySizeBox(h * 0.2, null), // Add more height-based spacing

                  // Privacy policy text
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By continuing, you agree to our ",
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.04,
                            color: const Color(0xFF4B5563),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "Terms & \nConditions ",
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.045,
                            color: const Color(0xff1F493D),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.04,
                            color: const Color(0xFF4B5563),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy.",
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.045,
                            color: const Color(0xff1F493D),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MySizeBox(h * 0.04, null), // Adjusted spacing

                  // Get OTP button
                  Container(
                    width: w * 0.9, // Use percentage of width
                    height: h * 0.07, // Use percentage of height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff1F493D), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(24), // Fixed radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'otp_enter');
                      },
                      child: Text(
                        'Generate OTP',
                        style: GoogleFonts.openSans(
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),

                  MySizeBox(h * 0.07, null), // Bottom spacing

                  // Bottom sign-up option
                  Center(
                    child: Text(
                      "You don't have an account yet?",
                      style: GoogleFonts.openSans(
                        color: const Color(0xff6B7280),
                        fontSize: w * 0.05, // Font size adjustment
                      ),
                    ),
                  ),

                  MySizeBox(h * 0.01, null),

                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, 'otp_send');
                    },
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.openSans(
                          color: const Color(0xff374151),
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.05, // Font size adjustment
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  MySizeBox(h * 0.01, null),

                  // or text
                  Center(
                    child: Text(
                      'or',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff6B7280),
                        fontSize: w * 0.05, // Font size adjustment
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  MySizeBox(h * 0.01, null),

                  // Explore it as a guest text
                  GestureDetector(
                    onTap: () {
                      // Handle sign-up click
                    },
                    child: Center(
                      child: Text(
                        'Explore it as a Guest',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff374151),
                          fontSize: w * 0.05, // Font size adjustment
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  MySizeBox(h * 0.15, null), // Add final bottom spacing
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget MySizeBox(double? height, double? width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
